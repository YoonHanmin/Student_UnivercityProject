package examples;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/QueryString")
public class QueryString extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//	request.setCharacterEncoding("utf-8");
//	out 객체로 태그를 이용해서 웹 브라우저에 출력
		response.setContentType("text/text;charset=utf-8");
	PrintWriter out = response.getWriter();
	out.println("<html>");
	out.println("<head>");
	out.println("</head>");
	out.println("<body>");
	out.println("당신이 입력한 정보(get)방식 입니다.");
	out.print("<br><b>아이디 :</b> ");
	out.println(request.getParameter("id"));
	out.print("<br><b>비밀번호 :</b> ");
	out.println(request.getParameter("pw"));
	out.print("<br><b>이름 : </b>");
	out.println(request.getParameter("name"));
	out.print("<br><b>회원 : </b>");
	out.println(request.getParameter("class"));
	out.print("<br><b>전화번호 : </b>");
	out.print(request.getParameter("phone1")+"-");
	out.print(request.getParameter("phone2")+"-");
	out.print(request.getParameter("phone3"));
	out.println("</body>");
	out.println("</html>");
	
		
		
	}

	
}
