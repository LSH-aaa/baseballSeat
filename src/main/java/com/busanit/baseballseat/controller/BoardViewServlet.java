package com.busanit.baseballseat.controller;

import com.busanit.baseballseat.dao.BoardDAO;
import com.busanit.baseballseat.dto.BoardVO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/board/view")
public class BoardViewServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String num = request.getParameter("num");

        String url = "/board/boardJung/boardView.jsp";

        BoardDAO dao = new BoardDAO();

        // num에 대한 게시글 조회수 증가
        dao.updateReadCount(num);

        // num에 대한 게시글 정보 가져오기
        BoardVO board = dao.selectOneBoard(num);

        request.setAttribute("board", board);
        request.getRequestDispatcher(url).forward(request, response);
    }
}