package com.busanit.baseballseat.dao;

import com.busanit.baseballseat.dto.BoardVO;
import com.busanit.baseballseat.dto.QnAVO;
import util.Manager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class QnADAO {
    // 전체 게시글 불러오기(List)
    public List<QnAVO> selectAllBoard(String type) {
        String baseSql = "select num,\n" +
                "       (CASE \n" +
                "            WHEN type = 'Y' THEN '양도'\n" +
                "            WHEN type = 'qna' THEN 'Q&A'\n" +
                "            WHEN type = 'B' THEN '분실물'\n" +
                "            ELSE type\n" +
                "        END) AS type, \n" +
                "       title,\n" +
                "       content,\n" +
                "       readcount,\n" +
                "       writedate,\n" +
                "       (select nickname from members mm where mm.id = b.id) AS nickname\n " +
                "from board b\n";



        // 조건에 따라 SQL을 동적으로 구성
        String sql;
        if (type == null || type.isEmpty()) {
            sql = baseSql + "order by num desc";  // type 조건이 없을 때
        } else {
            sql = baseSql + "where type = 'qna' order by num desc";  // type 조건이 있을 때
        }

        List<QnAVO> boardList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = Manager.getConnection();
            pstmt = conn.prepareStatement(sql);

            // type이 null이 아니고 빈 값이 아닐 때만 파라미터를 설정
            if (type != null && !type.isEmpty()) {
                pstmt.setString(1, type);
            }

            rs = pstmt.executeQuery();

            while (rs.next()) {
                QnAVO board = new QnAVO();
                board.setNum(rs.getInt("num"));
                board.setType(rs.getString("type"));
                board.setTitle(rs.getString("title"));
                board.setContent(rs.getString("content"));
                board.setReadcount(rs.getInt("readcount"));
                board.setWritedate(rs.getTimestamp("writedate"));
                board.setNickname(rs.getString("nickname"));

                boardList.add(board);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            Manager.close(conn, pstmt, rs);
        }
        return boardList;
    }



    // 게시글 상세 보기
    public QnAVO selectOneBoard(String num) {
        String sql = "select num, type, title, content, readcount, writedate, id, (select nickname from members mm where mm.id = b.id) AS nickname from board b where num = ?";

        QnAVO board = null;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = Manager.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, num);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                board = new QnAVO();
                board.setNum(rs.getInt("num"));
                board.setType(rs.getString("type"));
                board.setTitle(rs.getString("title"));
                board.setContent(rs.getString("content"));
                board.setReadcount(rs.getInt("readcount"));
                board.setWritedate(rs.getTimestamp("writedate"));
                board.setNickname(rs.getString("nickname"));
                board.setId(rs.getString("id"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            Manager.close(conn, pstmt, rs);
        }
        return board;
    }



    // 조회수 업데이트
    public void updateReadCount(String num) {
        String sql = "UPDATE board SET readcount = readcount + 1 WHERE num = ?";

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = Manager.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, num);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            Manager.close(conn, pstmt);
        }
    }



    // 게시글 입력
    public void insertBoard(QnAVO board) {
        String sql = "INSERT INTO board(id, title, content, type) " +
                "VALUES(?,?,?,'qna')";

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = Manager.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, board.getId());
            pstmt.setString(2, board.getTitle());
            pstmt.setString(3, board.getContent());
            pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            Manager.close(conn, pstmt);
        }
    }



    // 게시글 삭제
    public void deleteBoard(String num) {
        String sql = "delete from board where num = ?";

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = Manager.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, num);
            pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            Manager.close(conn, pstmt);
        }
    }



    // 게시글 업데이트
    public void updateBoard(QnAVO board) {
        String sql = "UPDATE board SET id = ?, title = ? , content = ?, type = 'qna' WHERE num = ?";

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = Manager.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, board.getId());
            pstmt.setString(2, board.getTitle());
            pstmt.setString(3, board.getContent());
            pstmt.setInt(4, board.getNum());
            pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            Manager.close(conn, pstmt);
        }
    }

    public int selectAllBoardCount(String searchType, String searchText) {
        String sql = "";

        int boardCnt = 0;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = Manager.getConnection();

            if (searchType != null && searchText.length() > 0) {
                // 검색 리스트 조회
                // type: all = 제목 + 내용
                //       title = 제목
                //       name = 작성자
                //       content = 내용
                switch (searchType) {
                    case "all":
                        sql = "SELECT COUNT(*) FROM board b, members m " +
                                "WHERE b.id = m.id AND b.title LIKE ? OR b.content LIKE ? AND type = 'qna'";
                        pstmt = conn.prepareStatement(sql);
                        pstmt.setString(1, "%" + searchText + "%");
                        pstmt.setString(2, "%" + searchText + "%");
                        break;
                    case "title":
                        sql = "SELECT COUNT(*) FROM board b, members m " +
                                "WHERE b.id = m.id AND b.title LIKE ? ";
                        pstmt = conn.prepareStatement(sql);
                        pstmt.setString(1, "%" + searchText + "%");

                        break;
                    case "name":
                        sql = "SELECT COUNT(*) FROM board b, members m " +
                                "WHERE b.id = m.id AND b.title LIKE ? ";
                        pstmt = conn.prepareStatement(sql);
                        pstmt.setString(1, "%" + searchText + "%");
                        break;
                    case "content":
                        sql = "SELECT COUNT(*) FROM board b, members m " +
                                "WHERE b.id = m.id AND b.title LIKE ? ";
                        pstmt = conn.prepareStatement(sql);
                        pstmt.setString(1, "%" + searchText + "%");
                        break;
                }
            } else {
                // 전체 리스트 조회
                sql = "SELECT COUNT(*) FROM board b, members m WHERE b.id = m.id";
                pstmt = conn.prepareStatement(sql);
            }
            rs = pstmt.executeQuery();

            if (rs.next()) {
                boardCnt = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            Manager.close(conn, pstmt, rs);
        }
        return boardCnt;
    }



    // 페이징
    public List<QnAVO> selectPagingBoard(int offset, int pageSize, String searchType, String searchText) {
        String sql = "";

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<QnAVO> boardList = new ArrayList<>();

        try {
            conn = Manager.getConnection();

            if (searchType != null && searchText.length() > 0) {
                // 검색 리스트 조회
                // type: all = 제목 + 내용
                //       title = 제목
                //       name = 작성자
                //       content = 내용
                switch (searchType) {
                    case "all":
                        sql = "SELECT * FROM board b, members m " +
                                "WHERE b.id = m.id AND b.title LIKE ? OR b.content LIKE ? " +
                                "ORDER BY b.num DESC " +
                                "LIMIT ?, ?";
                        pstmt = conn.prepareStatement(sql);
                        pstmt.setString(1, "%" + searchText + "%");
                        pstmt.setString(2, "%" + searchText + "%");
                        pstmt.setInt(3, offset);
                        pstmt.setInt(4, pageSize);
                        break;
                    case "title":
                        sql = "SELECT * FROM board b, members m " +
                                "WHERE b.id = m.id AND b.title LIKE ? " +
                                "ORDER BY b.num DESC " +
                                "LIMIT ?, ?";
                        pstmt = conn.prepareStatement(sql);
                        pstmt.setString(1, "%" + searchText + "%");
                        pstmt.setInt(2, offset);
                        pstmt.setInt(3, pageSize);
                        break;
                    case "name":
                        sql = "SELECT * FROM board b, members m " +
                                "WHERE b.id = m.id AND m.name LIKE ? " +
                                "ORDER BY b.num DESC " +
                                "LIMIT ?, ?";
                        pstmt = conn.prepareStatement(sql);
                        pstmt.setString(1, "%" + searchText + "%");
                        pstmt.setInt(2, offset);
                        pstmt.setInt(3, pageSize);
                        break;
                    case "content":
                        sql = "SELECT * FROM board b, members m " +
                                "WHERE b.id = m.id AND b.content LIKE ? " +
                                "ORDER BY b.num DESC " +
                                "LIMIT ?, ?";
                        pstmt = conn.prepareStatement(sql);
                        pstmt.setString(1, "%" + searchText + "%");
                        pstmt.setInt(2, offset);
                        pstmt.setInt(3, pageSize);
                        break;
                }
            } else {
                // 전체 리스트 조회
                sql = "SELECT * FROM board b, members m " +
                        "WHERE b.id = m.id ORDER BY b.num DESC LIMIT ?, ?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1, offset);
                pstmt.setInt(2, pageSize);
            }
            rs = pstmt.executeQuery();

            while(rs.next()) {
                QnAVO board = new QnAVO();
                board.setNum(rs.getInt("num"));
                board.setName(rs.getString("name"));
                board.setType(rs.getString("type"));
                board.setTitle(rs.getString("title"));
                board.setContent(rs.getString("content"));
                board.setReadcount(rs.getInt("readcount"));
                board.setWritedate(rs.getTimestamp("writedate"));
                board.setNickname(rs.getString("nickname"));
                board.setId(rs.getString("id"));

                boardList.add(board);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            Manager.close(conn, pstmt, rs);
        }
        return boardList;
    }



    // 비밀번호 체크
    public String checkPassword(String pass, String num) {
        String sql = "SELECT * FROM board WHERE num = ? AND pass = ?";

        String return_pass = "";

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = Manager.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, num);
            pstmt.setString(2, pass);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                return_pass = rs.getString("pass");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            Manager.close(conn, pstmt, rs);
        }
        return return_pass;
    }
}
