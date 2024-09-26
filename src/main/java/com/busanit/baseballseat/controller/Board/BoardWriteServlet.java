package com.busanit.baseballseat.controller.Board;

import com.busanit.baseballseat.dao.BoardDAO;
import com.busanit.baseballseat.dto.BoardVO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/board/write")
public class BoardWriteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/board/boardJung/boardWrite.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        BoardVO board = new BoardVO();
        board.setId(request.getParameter("id"));
        board.setTitle(request.getParameter("title"));
        board.setContent(request.getParameter("content"));
        board.setType(request.getParameter("type"));

        BoardDAO dao = new BoardDAO();
        dao.insertBoard(board);

        response.sendRedirect("/board/list?type=" + request.getParameter("type"));
    }

}