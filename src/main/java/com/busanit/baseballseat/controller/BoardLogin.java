package com.busanit.baseballseat.controller;

import com.busanit.baseballseat.dao.MembersDAO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/board/login")
public class BoardLogin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 세션 체크
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("id") != null) {
            // 이미 로그인된 경우 alert 메시지를 띄우고 이전 페이지로 리다이렉트
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>");
            out.println("alert('이미 로그인 되어있습니다.');");
            out.println("window.history.back();"); // 이전 페이지로 돌아가기
            out.println("</script>");
            out.close();
        }

        // 로그인 페이지로 포워드
        String url = "/login.jsp";
        request.getRequestDispatcher(url).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String pass = request.getParameter("pwd");

        MembersDAO mdao = new MembersDAO();

        String login_pass = mdao.loginMembers(id, pass);

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

            if(login_pass != null || login_pass.equals(pass)) {
                out.print("true");
                HttpSession session = request.getSession();
                session.setAttribute("id",id);

                response.sendRedirect("/baseballGive");
            } else {
                response.sendRedirect("/board/login");

            }
    }


}

