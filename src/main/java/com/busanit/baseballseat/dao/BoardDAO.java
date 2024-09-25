package com.busanit.baseballseat.dao;

import com.busanit.baseballseat.dto.BoardVO;
import util.Manager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class BoardDAO {
    // 전체 게시글 불러오기(List)
    public List<BoardVO> selectAllBoard(String type) {
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
                "       (select nickname from members mm where mm.id = b.id) AS nickname\n" +
                "from board b\n";

        // 조건에 따라 SQL을 동적으로 구성
        String sql;
        if (type == null || type.isEmpty()) {
            sql = baseSql + "order by num desc";  // type 조건이 없을 때
        } else {
            sql = baseSql + "where type = ? order by num desc";  // type 조건이 있을 때
        }

        List<BoardVO> boardList = new ArrayList<>();
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
                BoardVO board = new BoardVO();
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
    public BoardVO selectOneBoard(String num) {
        String sql = "select num, type, title, content, readcount, writedate, id, (select nickname from members mm where mm.id = b.id) AS nickname from board b where num = ?";

        BoardVO board = null;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = Manager.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, num);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                board = new BoardVO();
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
    public void insertBoard(BoardVO board) {
        String sql = "INSERT INTO board(id, title, content, type) VALUES(?,?,?,?)";

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = Manager.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, board.getId());
            pstmt.setString(2, board.getTitle());
            pstmt.setString(3, board.getContent());
            pstmt.setString(4, board.getType());
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
    public void updateBoard(BoardVO board) {
        String sql = "UPDATE board SET id = ?, title = ? , content = ?, type = ? WHERE num = ?";

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = Manager.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, board.getId());
            pstmt.setString(2, board.getTitle());
            pstmt.setString(3, board.getContent());
            pstmt.setString(4, board.getType());
            pstmt.setInt(5, board.getNum());
            pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            Manager.close(conn, pstmt);
        }
    }
    // 게시글 검색 리스트 조회
    public List<BoardVO> selectSearchBoard(String SearchType, String SearchText) {
        String sql = "";

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<BoardVO> boardList = new ArrayList<>();

        try {
            conn = Manager.getConnection();
            if(SearchType != null && SearchText.length() > 0) {
                // 검색 리스트 조회
                // type : all = 제목 + 내용
                //       title = 제목
                //       content = 내용
                //       name = 작성자
                switch (SearchType) {
                    case "all" :
                        sql = "select b.*, m.nickname from members m inner join board b on m.id=b.id where b.title like concat('%', ?, '%') or b.content like concat('%', ?, '%') order by b.num desc";
                        pstmt = conn.prepareStatement(sql);
                        pstmt.setString(1, "%" + SearchText + "%");
                        pstmt.setString(2, "%" + SearchText + "%");
                        break;

                    case "title" :
                        sql = "select b.*, m.nickname from members m inner join board b on m.id=b.id where b.title like concat('%', ?, '%') order by b.num desc";
                        pstmt = conn.prepareStatement(sql);
                        pstmt.setString(1, "%" + SearchText + "%");
                        break;

                    case "content" :
                        sql = "select b.*, m.nickname from members m inner join board b on m.id=b.id where b.content like concat('%', ?, '%') order by b.num desc";
                        pstmt = conn.prepareStatement(sql);
                        pstmt.setString(1, "%" + SearchText + "%");
                        break;

                    case "nickname" :
                        sql = "select b.*, m.nickname from members m inner join board b on m.id=b.id where m.nickname like concat('%', ?, '%') order by b.num desc";
                        pstmt = conn.prepareStatement(sql);
                        pstmt.setString(1, "%" + SearchText + "%");
                        break;
                }//switch
            } else {
                // 전체 리스트 조회
                sql = "select b.*, m.nickname from members m inner join board b on m.id=b.id order by b.num desc";
                pstmt = conn.prepareStatement(sql);
            }
            rs = pstmt.executeQuery();

            while (rs.next()) {
                BoardVO board = new BoardVO();
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

    // 전체 게시글 수
    public int selectAllBoardCount(String searchType, String SearchText, String type) {
        String baseSql = "";
        String sql = "";

        int boardCnt = 0;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = Manager.getConnection();

            if(searchType != null && SearchText.length() > 0) {
                // 검색 리스트 조회
                // type : all = 제목 + 내용
                //       title = 제목
                //       content = 내용
                //       name = 작성자
                switch (searchType) {
                    case "all" :
                        baseSql = "select count(*) from board where title like ? or content like ? ";
                        // 조건에 따라 SQL을 동적으로 구성
                        if (type == null || type.isEmpty()) {
                            sql = baseSql;
                            pstmt = conn.prepareStatement(sql);
                            pstmt.setString(1, "%" + SearchText + "%");
                            pstmt.setString(2, "%" + SearchText + "%");
                        } else {
                            sql = baseSql + "and type = ?";  // type 조건이 있을 때
                            pstmt = conn.prepareStatement(sql);
                            pstmt.setString(1, "%" + SearchText + "%");
                            pstmt.setString(2, "%" + SearchText + "%");
                            pstmt.setString(3, type);
                        }
                        break;

                    case "title" :
                        baseSql = "select count(*) from board where title like ? ";
                        // 조건에 따라 SQL을 동적으로 구성
                        if (type == null || type.isEmpty()) {
                            sql = baseSql;
                            pstmt = conn.prepareStatement(sql);
                            pstmt.setString(1, "%" + SearchText + "%");
                        } else {
                            sql = baseSql + "and type = ?";  // type 조건이 있을 때
                            pstmt = conn.prepareStatement(sql);
                            pstmt.setString(1, "%" + SearchText + "%");
                            pstmt.setString(2, type);
                        }
                        break;

                    case "content" :
                        baseSql = "select count(*) from board where content like ? ";
                        // 조건에 따라 SQL을 동적으로 구성
                        if (type == null || type.isEmpty()) {
                            sql = baseSql;
                            pstmt = conn.prepareStatement(sql);
                            pstmt.setString(1, "%" + SearchText + "%");
                        } else {
                            sql = baseSql + "and type = ?";  // type 조건이 있을 때
                            pstmt = conn.prepareStatement(sql);
                            pstmt.setString(1, "%" + SearchText + "%");
                            pstmt.setString(2, type);
                        }
                        break;

                    case "nickname" :
                        baseSql = "select count(*) from members m inner join board b on m.id=b.id where m.nickname like ? ";
                        // 조건에 따라 SQL을 동적으로 구성
                        if (type == null || type.isEmpty()) {
                            sql = baseSql;
                            pstmt = conn.prepareStatement(sql);
                            pstmt.setString(1, "%" + SearchText + "%");
                        } else {
                            sql = baseSql + "and type = ? ";  // type 조건이 있을 때
                            pstmt = conn.prepareStatement(sql);
                            pstmt.setString(1, "%" + SearchText + "%");
                            pstmt.setString(2, type);
                        }
                        break;
                } //switch
            } else {
                // 전체 리스트 조회
                baseSql = "select count(*) from board ";
                // 조건에 따라 SQL을 동적으로 구성
                if (type == null || type.isEmpty()) {
                    sql = baseSql;
                    pstmt = conn.prepareStatement(sql);
                } else {
                    sql = baseSql + "where type = ?";  // type 조건이 있을 때
                    pstmt = conn.prepareStatement(sql);
                    pstmt.setString(1, type);
                }
            }
            rs = pstmt.executeQuery();

            if(rs.next()) {
                boardCnt = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            Manager.close(conn, pstmt, rs);
        }
        return boardCnt;
    }
    // 페이지네이션
    public List<BoardVO> selectPagingBoard(int offset, int pageSize, String searchType, String SearchText, String type) {
        String baseSql = "";
        String sql;

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<BoardVO> boardList = new ArrayList<>();

        try {
            conn = Manager.getConnection();
            if(searchType != null && SearchText.length() > 0) {
                switch (searchType) {
                    case "all" :
                        baseSql = "select b.num,\n" +
                                "(CASE\n" +
                                "WHEN b.type = 'Y' THEN '양도'\n" +
                                "WHEN b.type = 'qna' THEN 'Q&A'\n" +
                                "WHEN b.type = 'B' THEN '분실물'\n" +
                                "ELSE b.type\n" +
                                "END) AS type, \n" +
                                "b.title,\n" +
                                "b.content,\n" +
                                "b.readcount,\n" +
                                "b.writedate, m.nickname from members m inner join board b on m.id=b.id where b.title like ? or b.content like ?";
                        // 조건에 따라 SQL을 동적으로 구성
                        if (type == null || type.isEmpty()) {
                            sql = baseSql + "order by num desc limit ?,?";  // type 조건이 없을 때
                            pstmt = conn.prepareStatement(sql);
                            pstmt.setString(1, "%" + SearchText + "%");
                            pstmt.setString(2, "%" + SearchText + "%");
                            pstmt.setInt(3, offset);
                            pstmt.setInt(4, pageSize);
                        } else {
                            sql = baseSql + "and type = ? order by num desc limit ?,?";  // type 조건이 있을 때
                            pstmt = conn.prepareStatement(sql);
                            pstmt.setString(1, "%" + SearchText + "%");
                            pstmt.setString(2, "%" + SearchText + "%");
                            pstmt.setString(3, type);
                            pstmt.setInt(4, offset);
                            pstmt.setInt(5, pageSize);
                        }
                        break;

                    case "title" :
                        baseSql = "select b.num,\n" +
                                "(CASE\n" +
                                "WHEN b.type = 'Y' THEN '양도'\n" +
                                "WHEN b.type = 'qna' THEN 'Q&A'\n" +
                                "WHEN b.type = 'B' THEN '분실물'\n" +
                                "ELSE b.type\n" +
                                "END) AS type, \n" +
                                "b.title,\n" +
                                "b.content,\n" +
                                "b.readcount,\n" +
                                "b.writedate, m.nickname from members m inner join board b on m.id=b.id where b.title like ? ";
                        // 조건에 따라 SQL을 동적으로 구성
                        if (type == null || type.isEmpty()) {
                            sql = baseSql + "order by num desc limit ?,?";  // type 조건이 없을 때
                            pstmt = conn.prepareStatement(sql);
                            pstmt.setString(1, "%" + SearchText + "%");
                            pstmt.setInt(2, offset);
                            pstmt.setInt(3, pageSize);
                        } else {
                            sql = baseSql + "and type = ? order by num desc limit ?,?";  // type 조건이 있을 때
                            pstmt = conn.prepareStatement(sql);
                            pstmt.setString(1, "%" + SearchText + "%");
                            pstmt.setString(2, type);
                            pstmt.setInt(3, offset);
                            pstmt.setInt(4, pageSize);
                        }
                        break;

                    case "content" :
                        baseSql = "select b.num,\n" +
                                "(CASE\n" +
                                "WHEN b.type = 'Y' THEN '양도'\n" +
                                "WHEN b.type = 'qna' THEN 'Q&A'\n" +
                                "WHEN b.type = 'B' THEN '분실물'\n" +
                                "ELSE b.type\n" +
                                "END) AS type, \n" +
                                "b.title,\n" +
                                "b.content,\n" +
                                "b.readcount,\n" +
                                "b.writedate, m.nickname from members m inner join board b on m.id=b.id where b.content like ? ";
                        // 조건에 따라 SQL을 동적으로 구성
                        if (type == null || type.isEmpty()) {
                            sql = baseSql + "order by num desc limit ?,?";  // type 조건이 없을 때
                            pstmt = conn.prepareStatement(sql);
                            pstmt.setString(1, "%" + SearchText + "%");
                            pstmt.setInt(2, offset);
                            pstmt.setInt(3, pageSize);
                        } else {
                            sql = baseSql + "and type = ? order by num desc limit ?,?";  // type 조건이 있을 때
                            pstmt = conn.prepareStatement(sql);
                            pstmt.setString(1, "%" + SearchText + "%");
                            pstmt.setString(2, type);
                            pstmt.setInt(3, offset);
                            pstmt.setInt(4, pageSize);
                        }
                        break;

                    case "nickname" :
                        baseSql = "select b.num,\n" +
                                "(CASE\n" +
                                "WHEN b.type = 'Y' THEN '양도'\n" +
                                "WHEN b.type = 'qna' THEN 'Q&A'\n" +
                                "WHEN b.type = 'B' THEN '분실물'\n" +
                                "ELSE b.type\n" +
                                "END) AS type, \n" +
                                "b.title,\n" +
                                "b.content,\n" +
                                "b.readcount,\n" +
                                "b.writedate, m.nickname from members m inner join board b on m.id=b.id where m.nickname like ? ";

                        // 조건에 따라 SQL을 동적으로 구성
                        if (type == null || type.isEmpty()) {
                            sql = baseSql + "order by num desc limit ?,?";  // type 조건이 없을 때
                            pstmt = conn.prepareStatement(sql);
                            pstmt.setString(1, "%" + SearchText + "%");
                            pstmt.setInt(2, offset);
                            pstmt.setInt(3, pageSize);
                        } else {
                            sql = baseSql + "and type = ? order by num desc limit ?,?";  // type 조건이 있을 때
                            pstmt = conn.prepareStatement(sql);
                            pstmt.setString(1, "%" + SearchText + "%");
                            pstmt.setString(2, type);
                            pstmt.setInt(3, offset);
                            pstmt.setInt(4, pageSize);
                        }
                        break;
                }//switch
            } else {
                // 전체 리스트 조회
                baseSql = "select b.num,\n" +
                        "(CASE\n" +
                        "WHEN b.type = 'Y' THEN '양도'\n" +
                        "WHEN b.type = 'qna' THEN 'Q&A'\n" +
                        "WHEN b.type = 'B' THEN '분실물'\n" +
                        "ELSE b.type\n" +
                        "END) AS type, \n" +
                        "b.title,\n" +
                        "b.content,\n" +
                        "b.readcount,\n" +
                        "b.writedate, m.nickname from members m inner join board b on m.id=b.id ";

                // 조건에 따라 SQL을 동적으로 구성
                if (type == null || type.isEmpty()) {
                    sql = baseSql + "order by num desc limit ?,?";  // type 조건이 없을 때
                    pstmt = conn.prepareStatement(sql);
                    pstmt.setInt(1, offset);
                    pstmt.setInt(2, pageSize);
                } else {
                    sql = baseSql + "and type = ? order by num desc limit ?,?";  // type 조건이 있을 때
                    pstmt = conn.prepareStatement(sql);
                    pstmt.setString(1, type);
                    pstmt.setInt(2, offset);
                    pstmt.setInt(3, pageSize);
                }
            }

            rs = pstmt.executeQuery();

            while(rs.next()) {
                BoardVO board = new BoardVO();
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
}
