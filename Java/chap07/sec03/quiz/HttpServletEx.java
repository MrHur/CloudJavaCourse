package quiz;

public class HttpServletEx {
	public static void main(String[] args) {
		LoginServlet ls = new LoginServlet();
		FileDownloadServlet fds = new FileDownloadServlet();
		
		ls.service();
		fds.service();
	}
}
