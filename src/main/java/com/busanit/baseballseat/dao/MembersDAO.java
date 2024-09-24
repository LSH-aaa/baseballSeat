package com.busanit.baseballseat.dao;

import com.busanit.baseballseat.dto.MembersVO;
import util.Manager;

import java.sql.*;


public class MembersDAO {
    //아이디 중복 확인
    public String checkId (String check_id){
        String sql = "SELECT * FROM members WHERE id= ?";
        String return_id = "";

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try{
            conn = Manager.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, check_id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                //아이디 중복인 경우
                return_id = "1";
            } else {
                //아이디 사용 가능한 경우
                return_id = "0";
            }
        } catch(Exception e){
            e.printStackTrace();
        } finally {
            Manager.close(conn, pstmt, rs);
        }

        return return_id;
    }

    //회원가입
    public void joinMembers(MembersVO members) {
        String sql = "INSERT INTO members(id, name, pass, email, nickname) VALUES(?,?,?,?,?)";

        Connection conn = null;
        PreparedStatement pstmt = null;

        try{
            conn = Manager.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, members.getId());
            pstmt.setString(2, members.getName());
            pstmt.setString(3, members.getPass());
            pstmt.setString(4, members.getEmail());
            pstmt.setString(5, members.getNickname());
            pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            Manager.close(conn,pstmt);
        }
    }

    //로그인
    public String loginMembers(String id, String pass) {
        String sql = "SELECT * FROM members WHERE id= ? AND pass = ?";
        String return_rs = "";

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = Manager.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.setString(2, pass);
            rs = pstmt.executeQuery();

            if(rs.next()) {
                return_rs = rs.getString("pass");
            }
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
            Manager.close(conn, pstmt, rs);
        }
        return return_rs;
    }

    //로그아웃

}
