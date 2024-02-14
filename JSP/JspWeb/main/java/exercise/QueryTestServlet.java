package exercise;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class QueryTestServlet
 */
@WebServlet("/queryTest")
public class QueryTestServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        res.setContentType("text/html; charset=utf-8");
        PrintWriter out = res.getWriter();
        out.print("<html><head><title>Query 문자열 테스트</title></head>");
        out.print("<body>");
        out.print("<h1>GET 방식으로 요청되었습니다</h1>");
        

        String id = req.getParameter("id");
        String pwd = req.getParameter("pwd");
        String name = req.getParameter("name");
        String[] hobbies = req.getParameterValues("hobby");
        String gender = req.getParameter("gender");
        String religion = req.getParameter("religion");
        String intro = req.getParameter("introduction");


        out.print("ID: " + id + "<br/>");
        out.print("비밀번호: " + pwd + "<br/>");
        out.print("이름: " + name + "<br/>");
        out.print("취미: ");
            for (int i = 0; i < hobbies.length; i++) {
                out.print(hobbies[i] + " ");
        }
        out.print("<br/>");
        out.print("성별: " + gender + "<br/>");
        out.print("종교: " + religion + "<br/>");
        out.print("소개: " + intro + "<br/>");
        out.print("전체 Query 문자열 : " + req.getQueryString());
        out.print("</body></html>");
        out.close();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        res.setContentType("text/html; charset=utf-8");
        PrintWriter out = res.getWriter();
        out.print("<html><head><title>Query 문자열 테스트</title></head>");
        out.print("<body>");
        out.print("<h1>POST 방식으로 요청되었습니다</h1>");
        
        req.setCharacterEncoding("UTF-8");
        String id = req.getParameter("id");
        String pwd = req.getParameter("pwd");
        String name = req.getParameter("name");
        String[] hobbies = req.getParameterValues("hobby");
        String gender = req.getParameter("gender");
        String religion = req.getParameter("religion");
        String intro = req.getParameter("introduction");


        out.print("ID: " + id + "<br/>");
        out.print("비밀번호: " + pwd + "<br/>");
        out.print("이름: " + name + "<br/>");
        out.print("취미: ");
            for (int i = 0; i < hobbies.length; i++) {
                out.print(hobbies[i] + " ");
        }
        out.print("<br/>");
        out.print("성별: " + gender + "<br/>");
        out.print("종교: " + religion + "<br/>");
        out.print("소개: " + intro + "<br/>");
        
        out.print("</body></html>");
        out.close();
    }
}