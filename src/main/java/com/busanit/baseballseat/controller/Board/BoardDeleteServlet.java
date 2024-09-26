
import com.busanit.baseballseat.dao.BoardDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/board/delete")
public class BoardDeleteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String num = request.getParameter("num");

        BoardDAO dao = new BoardDAO();
        dao.deleteBoard(num);

        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();

        out.println("<script language='javascript'>");
        out.println("alert('삭제가 완료되었습니다');");
        out.println("location.href='/board/list';"); // alert 창이 닫힌 후 리다이렉트
        out.println("</script>");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
