package exercise;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/local")
public class LocalTestServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
    	int number = 0;
    	String str = req.getParameter("msg");
        res.setContentType("text/html; charset=utf-8");
        PrintWriter out = res.getWriter();
        out.print("<html><head><title>MultiThread Test</title></head>");
        out.print("<body><h2>처리 결과(지역 변수)</h2>");
        while (number++ < 10) {
        	out.print(str +" : " + number + "<br>");
        	out.flush();
        	System.out.println(str +" : " + number);
        	try {
        		Thread.sleep(1000);
        		
        	} catch (Exception e) {
        		System.out.println(e);
        	}
        }
        out.print("<h2>Done " + str + " !!</h2>");
        out.print("</body></html>");
        out.close();
    }
}