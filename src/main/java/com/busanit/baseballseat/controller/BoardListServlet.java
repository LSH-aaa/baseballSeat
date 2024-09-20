package com.busanit.baseballseat.controller;

import com.busanit.baseballseat.dao.BoardDAO;
import com.busanit.baseballseat.dto.BoardVO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/board/list")
public class BoardListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = "/board/boardJung/boardList.jsp";

        BoardDAO dao = new BoardDAO();

        List<BoardVO> boardList = dao.selectAllBoard();

        request.setAttribute("boardList", boardList);
        request.getRequestDispatcher(url).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        doGet(request, response);
    }
}
