package exercise;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/checkboxServlet")
public class checkboxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public checkboxServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=utf-8");
		String items[] = request.getParameterValues("item");

		PrintWriter out = response.getWriter();
		out.print("<html><body>");
		out.println("<h2>당신이 선택한 항목입니다.</h2><hr>");
		// 향상된 for 문 사용.
		for(String item : items) {
		out.println(item + " ");
		}
		// 다음은 개행을 위해 사용되었습니다.
		out.println("<br>");
		// 일반 for 문 사용.
		for(int i = 0; i<items.length; i++) {
			out.println(items[i] + " ");
		}
		//자바스크립트로 이전 페이지로 이동하는 링크를 만들어 줌
		out.println("<br><a href='javascript:history.go(-1)'>다시</a>");
		out.print("</body></html>");
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
