package com.busanit.baseballseat.controller;

import com.busanit.baseballseat.dao.BoardDAO;
import com.busanit.baseballseat.dto.BoardVO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/QnAView")
public class BoardViewServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String num = request.getParameter("num");
        String url = "/board/boardLee/qnaView.jsp";

        BoardDAO dao = new BoardDAO();

        // 조회수 증가시키기
        dao.updateReadCount(num);
        // 상세 페이지 불러오기
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
        board.setName(request.getParameter("name"));
        board.setTitle(request.getParameter("title"));
        board.setContent(request.getParameter("content"));

        BoardDAO dao = new BoardDAO();
        dao.updateBoard(board);

        // 게시글 수정완료 후 게시글 상세보기(view) 화면으로 이동
        response.sendRedirect("/QnAView?num=" + board.getNum());
    }
}
