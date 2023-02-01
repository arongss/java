package jspexp.a01_mvc;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jspexp.vo.Dept;

/**
 * Servlet implementation class A09_DeptController
 */
@WebServlet(name = "deptList.do", urlPatterns = { "/deptList.do" })
public class A09_DeptController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private A10_DeptService service;
    public A09_DeptController() {
    	service = new A10_DeptService();
    }
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// post 방식 한글 요청값 처리시 필요합니다.
		request.setCharacterEncoding("utf-8");
		String dname = request.getParameter("dname");
		String loc = request.getParameter("loc");
		Dept sch = new Dept(dname,loc);
		// 모델 데이터 선언
		// 생성자를 통해서 서비스단 객체 생성
		request.setAttribute("getDeptList",
				service.getDeptList(sch));
		// 뷰단 호출
		String page = "WEB-INF/a01_mvc/a08_deptList.jsp";
		request.getRequestDispatcher(
			page).forward(request,response);
	}

}
