package com.shinhan.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shinhan.model.AdminService;
import com.shinhan.vo.AdminVO;

/**
 * http://localhost:9090/webShop/loginCheck
 */
@WebServlet("/auth/loginCheck.do")  //url mapping주소 정의
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//<input name="email">
		//<input name="pass">
		String email = request.getParameter("email");
		String pass = request.getParameter("pass");
		AdminService service = new AdminService();
		AdminVO admin = service.loginCheck(email, pass);
		System.out.println(admin==null?"로그인실패":admin);
		
		//응답문서 만들기
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if(admin==null) {
			response.setHeader("refresh", "3;login.jsp");  //로그인 실패시 3초후 다시 로그인화면으로 이동
			out.print("<h1>Login Fail</h1>");
			return;
		}
		
		out.print("<h1>Login Information</h1>");
		out.printf("<h1>이메일은 %s</h1>", email);
		out.printf("<h1>이름은 %s</h1>", admin.getManager_name());
		out.print("<p>왜안돼!!!!!!</p>");
		out.print("<p>왜안돼!!!!!!</p>");
		out.print("<p>왜안돼!!!!!!</p>");

	}

	
}
