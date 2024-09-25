package com.busanit.baseballseat.controller;

import com.busanit.baseballseat.dao.BoardDAO;
import com.busanit.baseballseat.dao.QnADAO;
import com.busanit.baseballseat.dto.BoardVO;
import com.busanit.baseballseat.dto.MembersVO;
import com.busanit.baseballseat.dto.QnAVO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/QnAWrite")
public class QnAWriteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/board/boardLee/qnaWrite.jsp")
                .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 한글 깨짐 방지
        request.setCharacterEncoding("utf-8");

        QnAVO board = new QnAVO();

        board.setTitle(request.getParameter("title"));
        board.setContent(request.getParameter("content"));
        board.setName(request.getParameter("name"));

        QnADAO dao = new QnADAO();
        dao.insertBoard(board);

        // 게시글 작성완료 후 목록 화면으로 이동
        response.sendRedirect("/QnAList");
    }
}