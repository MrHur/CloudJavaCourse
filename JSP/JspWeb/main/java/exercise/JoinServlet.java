package exercise;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/JoinServlet")
public class JoinServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
    	response.setContentType("text/html; charset=UTF-8");
        // 입력한 데이터 가져오기
        String name = request.getParameter("name");
        String residentNumber1 = request.getParameter("residentNumber1");
        String residentNumber2 = request.getParameter("residentNumber2");
        String userId = request.getParameter("userId");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String email1 = request.getParameter("email1");
        String emailDomain = request.getParameter("emailDomain");
        String zipCode = request.getParameter("zipCode");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String job = request.getParameter("job");
        String receive = request.getParameter("receive");
        String[] interests = request.getParameterValues("interest");
        
        // HTML로 결과 출력
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h2>회원가입 결과</h2>");
        out.println("<p>이름: " + "<b>"+ name + "</b>" + "</p>");
        out.println("<p>주민등록번호: " + "<b>"+ residentNumber1 + "</b>" + "-" + "<b>" + residentNumber2 +  "</b>" + "</p>");
        out.println("<p>아이디: " + "<b>"+ userId + "</b>" + "</p>");
        out.println("<p>비밀번호: " + "<b>"+ password + "</b>" + "</p>");
        out.println("<p>이메일: " + "<b>"+ email1 + "@" + emailDomain + "</b>" +"</p>");
        out.println("<p>우편번호: " + "<b>"+ zipCode + "</b>" + "</p>");
        out.println("<p>주소: " + "<b>"+ address + "</b>" + "</p>");
        out.println("<p>핸드폰번호: " + "<b>"+ phone + "</b>" + "</p>");
        out.println("<p>직업: " + "<b>"+ job + "</b>" + "</p>");
//        out.println("<p>메일/SMS 정보 수신: " + "<b>"+ receive + "</b>" + "</p>");
        out.println("<p>관심분야: ");
        if (interests != null) {
            for (String interest : interests) {
                out.println("<b>"+interest+"</b>" + " ");
            }
        }
        out.println("</p>");
		out.println("<br><a href='javascript:history.go(-1)'>다시</a>");
        out.println("</body></html>");
    }

}