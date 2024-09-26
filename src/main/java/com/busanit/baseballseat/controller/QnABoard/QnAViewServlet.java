package com.busanit.baseballseat.controller.QnABoard;

import com.busanit.baseballseat.dao.BoardDAO;
import com.busanit.baseballseat.dao.QnADAO;
import com.busanit.baseballseat.dto.BoardVO;
import com.busanit.baseballseat.dto.QnAVO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/QnAView")
public class QnAViewServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String num = request.getParameter("num");
        String url = "/board/boardLee/qnaView.jsp";

        QnADAO dao = new QnADAO();

        // 조회수 증가시키기
        dao.updateReadCount(num);
        // 상세 페이지 불러오기
        QnAVO board = dao.selectOneBoard(num);


        request.setAttribute("board", board);
        request.getRequestDispatcher(url).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}