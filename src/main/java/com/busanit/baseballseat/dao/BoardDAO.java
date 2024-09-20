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
    public List<BoardVO> selectAllBoard() {
        String sql = "select num, type, title, content, readcount, writedate, (select nickname from members mm where mm.id = b.id) AS nickname from board b order by num desc";

        List<BoardVO> boardList = new ArrayList();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = Manager.getConnection();
            pstmt = conn.prepareStatement(sql);
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
    public BoardVO selectOneBoard(String num, String id) {
        String sql = "select * from board where num = ?, id = ?";

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
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            Manager.close(conn, pstmt, rs);
        }
        return board;
    }

}
