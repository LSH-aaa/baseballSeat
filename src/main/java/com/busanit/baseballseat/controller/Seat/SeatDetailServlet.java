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
        String url= "";

        if(team != null){
            switch (team) {
                case "Lotte" : url = "/Seat/seat_detail_Lotte.jsp";
                    request.getRequestDispatcher(url).forward(request, response);
                    break;
                case "Samsung" : url = "/Seat/seat_detail_Samsung.jsp";
                    request.getRequestDispatcher(url).forward(request, response);
                    break;
                case "KIA" : url = "/Seat/seat_detail_Kia.jsp";
                    request.getRequestDispatcher(url).forward(request, response);
                    break;
                case "Hanhwa" : url = "/Seat/seat_detail_Hanhwa.jsp";
                    request.getRequestDispatcher(url).forward(request, response);
                    break;
                case "NC" : url = "/Seat/seat_detail_NC.jsp";
                    request.getRequestDispatcher(url).forward(request, response);
                    break;
                case "Kium" : url = "/Seat/seat_detail_Kium.jsp";
                    request.getRequestDispatcher(url).forward(request, response);
                    break;
                case "SSG" : url = "/Seat/seat_detail_SSG.jsp";
                    request.getRequestDispatcher(url).forward(request, response);
                    break;
                case "KT" : url = "/Seat/seat_detail_KT.jsp";
                    request.getRequestDispatcher(url).forward(request, response);
                    break;
                case "LD" : url = "/Seat/seat_detail_LD.jsp";
                    request.getRequestDispatcher(url).forward(request, response);
                    break;
            }
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
