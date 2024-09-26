package com.busanit.baseballseat.controller.Location;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/locationDetail")
public class LocationDetailServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String team = request.getParameter("team");
        String url;

        if(team != null){
            switch (team) {
                case "Lotte" : url = "/location/location_detail_Lotte.jsp";

                    request.getRequestDispatcher(url).forward(request, response);
                    break;
                case "Samsung" : url = "/location/location_detail_Samsung.jsp";

                    request.getRequestDispatcher(url).forward(request, response);
                    break;
                case "KIA" : url = "/location/location_detail_Kia.jsp";

                    request.getRequestDispatcher(url).forward(request, response);
                    break;
                case "Hanhwa" : url = "/location/location_detail_Hanhwa.jsp";

                    request.getRequestDispatcher(url).forward(request, response);
                    break;
                case "NC" : url = "/location/location_detail_NC.jsp";

                    request.getRequestDispatcher(url).forward(request, response);
                    break;
                case "Kium" : url = "/location/location_detail_Kium.jsp";

                    request.getRequestDispatcher(url).forward(request, response);
                    break;
                case "SSG" : url = "/location/location_detail_SSG.jsp";

                    request.getRequestDispatcher(url).forward(request, response);
                    break;
                case "KT" : url = "/location/location_detail_Kt.jsp";

                    request.getRequestDispatcher(url).forward(request, response);
                    break;
                case "LD" : url = "/location/location_detail_LD.jsp";

                    request.getRequestDispatcher(url).forward(request, response);
                    break;
            }
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
