package examples;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HelloWorld2
 */
@WebServlet("/HelloWorld2")
public class HelloWorld2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    

	protected void doGet(HttpServletRequest resq, HttpServletResponse resp) throws ServletException, IOException {
	// 요청 객체의 getContext
//		response.getWriter().append("hello ").append(request.getContextPath());
		resp.setContentType("text/html"); //응답 방식은 text나 html으로 응답한다.
		PrintWriter out = resp.getWriter(); // resp객체의 getWriter 메소드를 통해 내용을 담아 out 객체가 전달.
		out.println("<html>");
		out.println("<head>");
		out.println("<title>Hello~");
		out.println("</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h1>Hello World~!!!</h1>");
		out.println("</body>");
		out.println("</html>");
		out.close();
	}

}
