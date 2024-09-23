package com.busanit.baseballseat.dao;

import com.busanit.baseballseat.dto.BoardVO;
import util.DBManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class BoardDAO {

    // 전체 게시글 불러오기
    public List<BoardVO> selectAllBoard() {
        String sql = "SELECT * FROM board b, members m WHERE b.id = m.id AND" +
                " type = 'qna' ORDER BY num DESC";

        List<BoardVO> boardList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = DBManager.getConnection();
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while(rs.next()) {
                BoardVO board = new BoardVO();
                board.setNum(rs.getInt("num"));
                board.setName(rs.getString("name"));
                board.setType(rs.getString("type"));
                board.setTitle(rs.getString("title"));
                board.setContent(rs.getString("content"));
                board.setReadcount(rs.getInt("readcount"));
                board.setWritedate(rs.getTimestamp("writedate"));
                board.setId(rs.getString("id"));

                boardList.add(board);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(conn, pstmt, rs);
        }
        return boardList;
    }





    // 게시글 상세 내용 보기
    public BoardVO selectOneBoard(String num) {
        String sql = "SELECT * FROM board b, members m " +
                "WHERE b.id = m.id AND num = ? AND type = 'qna'";

        BoardVO board = null;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = DBManager.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, num);

            rs = pstmt.executeQuery();

            while(rs.next()) {
                board = new BoardVO();
                board.setNum(rs.getInt("num"));
                board.setName(rs.getString("name"));
                board.setType(rs.getString("type"));
                board.setTitle(rs.getString("title"));
                board.setContent(rs.getString("content"));
                board.setReadcount(rs.getInt("readcount"));
                board.setWritedate(rs.getTimestamp("writedate"));
                board.setId(rs.getString("id"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(conn, pstmt, rs);
        }
        return board;
    }





    // 게시글 입력
    public void insertBoard(BoardVO board) {
        String sql = "INSERT INTO board(title, content, type, id) " +
                " VALUES(?, ?, 'qna', 'dd')";

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = DBManager.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, board.getTitle());
            pstmt.setString(2, board.getContent());
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(conn, pstmt);
        }
    }





    // 게시글 수정
    public void updateBoard(BoardVO board) {
        String sql = "UPDATE board SET " +
                "title = ?, content = ? WHERE num = ? AND type = 'qna'";

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = DBManager.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, board.getTitle());
            pstmt.setString(2, board.getContent());
            pstmt.setInt(3, board.getNum());
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(conn, pstmt);
        }
    }





    // 게시글 삭제
    public void deleteBoard(String num) {
        String sql = "DELETE FROM board WHERE num = ? AND type = 'qna'";

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = DBManager.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, num);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(conn, pstmt);
        }
    }





    // 조회수 업데이트
    public void updateReadCount(String num) {
        String sql = "UPDATE board SET readcount = readcount + 1 WHERE num = ? AND type = 'qna'";

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = DBManager.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, num);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(conn, pstmt);
        }
    }





    // 게시글 검색 리스트 조회
    public List<BoardVO> selectSearchBoard(String searchType, String searchText) {
        String sql = "";

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<BoardVO> list = new ArrayList<>();

        try {
            conn = DBManager.getConnection();

            if (searchType != null && searchText.length() > 0) {
                // 검색 리스트 조회
                // type: all = 제목 + 내용
                //       title = 제목
                //       name = 작성자
                //       content = 내용
                switch (searchType) {
                    case "all":
                        sql = "SELECT * FROM board " +
                                "WHERE title LIKE ? OR content LIKE ? AND type = 'qna'" +
                                "ORDER BY num DESC";
                        pstmt = conn.prepareStatement(sql);
                        pstmt.setString(1, "%" + searchText + "%");
                        pstmt.setString(2, "%" + searchText + "%");
                        break;
                    case "title":
                        sql = "SELECT * FROM board " +
                                "WHERE title LIKE ? AND type = 'qna'" +
                                "ORDER BY num DESC";
                        pstmt = conn.prepareStatement(sql);
                        pstmt.setString(1, "%" + searchText + "%");
                        break;
                    case "name":
                        sql = "SELECT * FROM board " +
                                "WHERE name LIKE ? AND type = 'qna'" +
                                "ORDER BY num DESC";
                        pstmt = conn.prepareStatement(sql);
                        pstmt.setString(1, "%" + searchText + "%");
                        break;
                    case "content":
                        sql = "SELECT * FROM board " +
                                "WHERE content LIKE ? AND type = 'qna'" +
                                "ORDER BY num DESC";
                        pstmt = conn.prepareStatement(sql);
                        pstmt.setString(1, "%" + searchText + "%");
                        break;
                }
            } else {
                // 전체 리스트 조회
                sql = "SELECT * FROM board b, members m WHERE b.id = m.id AND b.type = 'qna' ORDER BY b.num DESC";
                pstmt = conn.prepareStatement(sql);
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
                board.setId(rs.getString("id"));

                list.add(board);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(conn, pstmt, rs);
        }
        return list;
    }





    // 전체 게시글 수
    public int selectAllBoardCount(String searchType, String searchText) {
        String sql = "";

        int boardCnt = 0;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = DBManager.getConnection();

            if (searchType != null && searchText.length() > 0) {
                // 검색 리스트 조회
                // type: all = 제목 + 내용
                //       title = 제목
                //       name = 작성자
                //       content = 내용
                switch (searchType) {
                    case "all":
                        sql = "SELECT COUNT(*) FROM board b, members m " +
                                "WHERE b.id = m.id AND b.title LIKE ? OR b.content LIKE ? AND b.type = 'qna'";
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
            DBManager.close(conn, pstmt, rs);
        }
        return boardCnt;
    }





    // 페이징
    public List<BoardVO> selectPagingBoard(int offset, int pageSize,
                                           String searchType, String searchText) {
        String sql = "";

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<BoardVO> boardList = new ArrayList<>();

        try {
            conn = DBManager.getConnection();

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
                BoardVO board = new BoardVO();
                board.setNum(rs.getInt("num"));
                board.setName(rs.getString("name"));
                board.setType(rs.getString("type"));
                board.setTitle(rs.getString("title"));
                board.setContent(rs.getString("content"));
                board.setReadcount(rs.getInt("readcount"));
                board.setWritedate(rs.getTimestamp("writedate"));
                board.setId(rs.getString("id"));

                boardList.add(board);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(conn, pstmt, rs);
        }
        return boardList;
    }
}