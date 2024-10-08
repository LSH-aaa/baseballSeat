package com.busanit.baseballseat.controller.QnABoard;

import com.busanit.baseballseat.dao.BoardDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/QnADelete")
public class QnADeleteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String num = request.getParameter("num");

        BoardDAO dao = new BoardDAO();
        dao.deleteBoard(num);

        // 게시글 삭제완료 후 게시글 목록으로 이동
        response.sendRedirect("/QnAList");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}