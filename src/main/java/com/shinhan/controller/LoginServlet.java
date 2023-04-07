package com.shinhan.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shinhan.model.AdminService;
import com.shinhan.vo.AdminVO;

/**
 * http://localhost:9090/webShop
 */
@WebServlet("/auth/loginCheck.do")  //url mapping주소 정의
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServletContext app = request.getServletContext();
		Object obj = app.getAttribute("visitor");
		int count = 1;
		if(obj != null) {
			count = (Integer)obj;
			count++;
		}
		
		app.setAttribute("visitor", count);
		
		RequestDispatcher rd;
		rd = request.getRequestDispatcher("login.jsp");
		rd.forward(request, response);
		
	}
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//<input name="email">
		//<input name="pass">
		String email = request.getParameter("email");
		String pass = request.getParameter("pass");
		AdminService service = new AdminService();
		AdminVO admin = service.loginCheck(email, pass);
		System.out.println(admin==null?"로그인실패":admin);
		
		//응답문서 만들기 header + ResopnseBody에 문자열을 출력하기
		//<meta charset="UTF-8"> 한글 
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		//1)
		if(admin==null) {
			//응답문서에 header부분을 작성해서 내려간다. 아래부분 코드는 3초후 다시 재요청한다는 의미
			response.setHeader("refresh", "3;loginCheck.do");  //덮어쓴다
			//response.addHeader("refresh", "3;loginCheck.do");  //여러개 추가
			out.print("<h1 style='color: tomato'>Login Fail</h1>");
			return;
		}
		
		//로그인한 사람의 정보를 저장하기
		HttpSession session = request.getSession();
		session.setAttribute("loginUser", admin);
		
		
		//2)
		//응답문서에 주소창을 바꾼다.
		//http://localhost:9090/
		String path = request.getContextPath();
		//url 한글 encording
		String encodeName= URLEncoder.encode(admin.getManager_name(),"UTF-8");
				//admin.getManager_name().getBytes("utf-8").toString();
		response.sendRedirect(path + "/emp/emplist.do?myname="+encodeName);
		
		
		//3)
		//재요청 
		/*
		out.print("<script>"
				+ "alert('로그인 성공....업무화면으로 이동합니다.');"
				+ "location.href='"
				+ path
				+ "/emp/emplist.do';"
				+ "</script>");
				*/
		
		
		

	}

	
}
