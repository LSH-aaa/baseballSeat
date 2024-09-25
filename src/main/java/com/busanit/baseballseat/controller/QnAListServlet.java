package com.busanit.baseballseat.controller;

import com.busanit.baseballseat.dao.BoardDAO;
import com.busanit.baseballseat.dao.QnADAO;
import com.busanit.baseballseat.dto.BoardVO;
import com.busanit.baseballseat.dto.QnAVO;
import com.busanit.baseballseat.dto.SearchVO;
import util.PageHandler;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/QnAList")
public class QnAListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = "/board/boardLee/qnaList.jsp";

        // 검색 정보
        String searchType = request.getParameter("searchType");
        String searchText = request.getParameter("searchText");
        SearchVO searchVO = new SearchVO();
        searchVO.setSearchType(searchType);
        searchVO.setSearchText(searchText);

        // 페이지 정보
        int currentPage = 1;
        String req_page = request.getParameter("currPage");
        if (req_page == null) {
            currentPage = 1;
        } else {
            currentPage = Integer.parseInt(req_page);
        }
        QnADAO dao = new QnADAO();

        // 전체 게시글 수
        int totalCnt = dao.selectAllBoardCount(searchType, searchText);

        // 페이징 관련값 계산(생성자 호출)
        PageHandler pageHandler = new PageHandler(totalCnt, currentPage);

        // 페이지 시작값 계산
        int offset = (currentPage - 1) * pageHandler.getPageSize();

        // list<QnAVO> boardList = dao.selectAllBoard();
        // List<QnAVO> boardList = dao.selectSearchBoard(searchType, searchText);
        List<QnAVO> boardList =
                dao.selectPagingBoard(offset, pageHandler.getPageSize(),
                        searchType, searchText);

        request.setAttribute("id", boardList.get(0).getId());
        request.setAttribute("qna", boardList);
        request.setAttribute("searchVO", searchVO);
        request.setAttribute("pageHandler", pageHandler);
        request.getRequestDispatcher(url).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        doGet(request, response);


    }
}