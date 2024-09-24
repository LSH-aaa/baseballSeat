package com.busanit.baseballseat.controller;

import com.busanit.baseballseat.dao.BoardDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/board/passCheck")
public class CheckPassServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pass = request.getParameter("pass"); // 비밀번호 확인값
        String num = request.getParameter("num");   // 게시글 번호

        BoardDAO dao = new BoardDAO();
        // DB에서 해당 게시글의 비밀번호가 일치하는지 여부 조회
        String db_pass = dao.checkPassword(pass, num);

        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();

        if (db_pass.equals(pass)) {
            // 비밀번호 일치
            out.print("true");
        } else {
            // 비밀번호 불일치
            out.print("false");
        }
    }
}
