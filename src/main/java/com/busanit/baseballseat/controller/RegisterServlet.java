package com.busanit.baseballseat.controller;

import com.busanit.baseballseat.dao.MembersDAO;
import com.busanit.baseballseat.dto.MembersVO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/board/register")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        MembersVO members = new MembersVO();
        members.setName(request.getParameter("name"));
        members.setId(request.getParameter("id"));
        members.setPass(request.getParameter("pwd"));
        members.setEmail(request.getParameter("email"));
        members.setNickname(request.getParameter("nickname"));

        MembersDAO mdao = new MembersDAO();
        mdao.joinMembers(members);

        response.sendRedirect("/board/boardLogin.jsp");
    }
}
