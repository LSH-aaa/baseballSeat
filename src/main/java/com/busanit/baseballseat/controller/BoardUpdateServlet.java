package com.busanit.baseballseat.controller;

import com.busanit.baseballseat.dao.BoardDAO;
import com.busanit.baseballseat.dao.MembersDAO;
import com.busanit.baseballseat.dto.BoardVO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/board/update")
public class BoardUpdateServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String num = request.getParameter("num");
        String url = "/board/boardUpdate.jsp";

        BoardDAO dao = new BoardDAO();
        BoardVO board = dao.selectOneBoard(num);

        request.setAttribute("board", board);
        request.getRequestDispatcher(url).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 한글 깨짐 방지
        request.setCharacterEncoding("utf-8");

        BoardVO board = new BoardVO();
        board.setNum(Integer.parseInt(request.getParameter("num")));
        board.setTitle(request.getParameter("title"));
        board.setContent(request.getParameter("content"));

        BoardDAO dao = new BoardDAO();
        dao.updateBoard(board);

        // 게시글 수정완료 후 게시글 상세보기(view) 화면으로 이동
        response.sendRedirect("/board/view?num=" + board.getNum());
    }
}
