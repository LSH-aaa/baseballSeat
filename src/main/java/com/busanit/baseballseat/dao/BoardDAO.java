package com.busanit.baseballseat.dao;

import com.busanit.baseballseat.dto.BoardVO;
import com.busanit.baseballseat.util.DBManager;

import java.sql.*;
import java.util.*;


public class BoardDAO {
    //회원가입
    public void signupBoard(BoardVO board) {
        String sql = "INSERT INTO members(id, name, pass, email, nickname) VALUES(?,?,?,?,?)";

        Connection conn = null;
        PreparedStatement pstmt = null;

        try{
            conn = DBManager.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, board.getId());
            pstmt.setString(2, board.getName());
            pstmt.setString(3, board.getPass());
            pstmt.setString(4, board.getEmail());
            pstmt.setString(5, board.getNickname());
            pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(conn,pstmt);
        }
    }


}
