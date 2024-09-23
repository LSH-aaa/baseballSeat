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

}
