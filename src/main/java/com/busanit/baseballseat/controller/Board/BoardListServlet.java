package com.busanit.baseballseat.controller;

import com.busanit.baseballseat.dao.BoardDAO;
import com.busanit.baseballseat.dto.BoardVO;
import com.busanit.baseballseat.dto.SearchVO;
import util.PageHandler;

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

        // 검색 정보
        String searchType = request.getParameter("searchType");
        String searchText = request.getParameter("searchText");
        SearchVO searchVO = new SearchVO();
        searchVO.setSearchType(searchType);
        searchVO.setSearchText(searchText);

        String type = request.getParameter("type");

        // 페이지 정보
        int currPage = 1; // 현재 페이지 1로 초기화
        String req_page = request.getParameter("currPage");
        if (req_page == null || req_page.equals("")) {
            currPage = 1;
        } else {
            currPage = Integer.parseInt(req_page);
        }
        BoardDAO dao = new BoardDAO();
        // 전체 게시글 수
        int totalCnt = dao.selectAllBoardCount(searchType, searchText, type);

        // 페이징 관련 값 계산(생성자 호출)
        PageHandler pageHandler = new PageHandler(totalCnt, currPage);

        // 페이지 시작 값 계산
        int offset = (currPage - 1) * pageHandler.getPageSize();

        //List<BoardVO> boardList = dao.selectAllBoard(type);
        //List<BoardVO> boardList = dao.selectSearchBoard(searchType, searchText);
        List<BoardVO> boardList = dao.selectPagingBoard(offset, pageHandler.getPageSize(), searchType, searchText, type);

        request.setAttribute("boardList", boardList);
        request.setAttribute("searchVO", searchVO);
        request.setAttribute("pageHandler", pageHandler);
        request.setAttribute("type", type);
        request.getRequestDispatcher(url).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        doGet(request, response);
    }
}
