package com.busanit.baseballseat.controller.Seat;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/seatDetail")
public class SeatDetailServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String team = request.getParameter("team");

        if(team != null){
            switch (team) {
                case "Lotte" : response.sendRedirect("/Seat/seat_detail_Lotte.jsp");
                break;
                case "Samsung" : response.sendRedirect("/Seat/seat_detail_Samsung.jsp");
                break;
                case "KIA" : response.sendRedirect("/Seat/seat_detail_Kia.jsp");
                break;
                case "Hanhwa" : response.sendRedirect("/Seat/seat_detail_Hanhwa.jsp");
                break;
                case "NC" : response.sendRedirect("/Seat/seat_detail_NC.jsp");
                break;
                case "Kium" : response.sendRedirect("/Seat/seat_detail_Kium.jsp");
                break;
                case "SSG" : response.sendRedirect("/Seat/seat_detail_SSG.jsp");
                break;
                case "KT" : response.sendRedirect("/Seat/seat_detail_KT.jsp");
                break;
                case "LD" : response.sendRedirect("/Seat/seat_detail_LD.jsp");
                break;
            }
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
