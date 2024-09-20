package com.busanit.baseballseat.controller;

import com.busanit.baseballseat.dao.MembersDAO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/board/checkId")
public class CheckIdServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String input_id = request.getParameter("id");

        MembersDAO mdao = new MembersDAO();

        String checkId = mdao.checkId(input_id);

        PrintWriter out = response.getWriter();
        out.print(checkId);
    }
}
