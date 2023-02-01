package jspexp.a01_mvc;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jspexp.vo.Emp;

/**
 * Servlet implementation class A04_MVC
 */
@WebServlet(name = "mvc04.do", urlPatterns = { "/mvc04.do" })
public class A04_MVC extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 2. model
		//
		request.setAttribute("emp", new Emp(7780, "홍길동", 3500));
		// 3. view
		String page = "WEB-INF\\a01_mvc\\a04_view.jsp"; // <h2>MVC 2단계(모델처리)</h2>
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
	}

}
