package com.busanit.baseballseat.controller;

import com.busanit.baseballseat.dao.BoardDAO;
import com.busanit.baseballseat.dao.QnADAO;
import com.busanit.baseballseat.dto.BoardVO;
import com.busanit.baseballseat.dto.QnAVO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/QnAUpdate")
public class QnAUpdateServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String num = request.getParameter("num");
        String url = "/board/boardLee/qnaUpdate.jsp";

        QnADAO dao = new QnADAO();
        QnAVO board = (QnAVO) dao.selectOneBoard(num);

        request.setAttribute("board", board);
        request.getRequestDispatcher(url).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 한글 깨짐 방지
        request.setCharacterEncoding("utf-8");

        QnAVO board = new QnAVO();
        board.setNum(Integer.parseInt(request.getParameter("num")));
        board.setId(request.getParameter("id"));
        board.setName(request.getParameter("name"));
        board.setTitle(request.getParameter("title"));
        board.setContent(request.getParameter("content"));

        QnADAO dao = new QnADAO();
        dao.updateBoard(board);

        // 게시글 수정완료 후 게시글 상세보기(view) 화면으로 이동
        response.sendRedirect("/QnAView?num=" + board.getNum());
    }
}