package jspexp.a01_mvc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class A11_AjaxDept
 */
@WebServlet(name = "ajaxDept.do", urlPatterns = { "/ajaxDept.do" })
public class A11_AjaxDept extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private A12_DeptService service;
    public A11_AjaxDept() {
    	super();
        service = new A12_DeptService();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String dname = request.getParameter("dname");
		String loc = request.getParameter("loc");
		// 서비스 호출
		String json = service.getDeptAjax(dname,loc);
			
		// view( 초기화면/json데이터 )
		if(dname==null){
			request.getRequestDispatcher("WEB-INF\\a01_mvc\\a11_ajaxDept.html").forward(request, response);
		}else{
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
			out.print(json);
		}
	}
}