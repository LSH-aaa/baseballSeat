package com.busanit.baseballseat.controller;

import com.busanit.baseballseat.dao.BoardDAO;
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

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 한글 깨짐 방지
        request.setCharacterEncoding("utf-8");

    }
}
