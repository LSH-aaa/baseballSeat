package com.busanit.baseballseat.controller.Memebers;

import com.busanit.baseballseat.dao.MembersDAO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/board/login")
public class Login extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String pass = request.getParameter("pwd");

        MembersDAO mdao = new MembersDAO();

        String login_pass = mdao.loginMembers(id, pass);

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

            if (login_pass != null && login_pass.equals(pass)) {
                out.print("true");
                HttpSession session = request.getSession();
                session.setAttribute("id", id);

                response.sendRedirect("/baseballGive");
            } else {
                response.sendRedirect("/board/login");

            }
    }


}

