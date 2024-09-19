package com.busanit.baseballseat.controller;

import com.busanit.baseballseat.dao.BoardDAO;
import com.busanit.baseballseat.dto.BoardVO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/board/signup")
public class SignupServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        BoardVO board = new BoardVO();
        board.setName(request.getParameter("name"));
        board.setPass(request.getParameter("pwd"));
        board.setEmail(request.getParameter("email"));
        board.setNickname(request.getParameter("nickname"));

        BoardDAO dao = new BoardDAO();
        dao.signupBoard(board);

        response.sendRedirect("/board/login");
    }
}
