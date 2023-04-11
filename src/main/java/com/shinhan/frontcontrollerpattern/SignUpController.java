package com.shinhan.frontcontrollerpattern;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.shinhan.model.AdminService;
import com.shinhan.vo.AdminVO;

public class SignUpController implements CommonControllerInterface {

	@Override
	public String execute(Map<String, Object> data) throws Exception {
		HttpServletRequest request = (HttpServletRequest)data.get("request");
		String mname = request.getParameter("manager_name");
		//get 방식은 parameter가 넘어올때 URL에 encording되어 들어온다.
		//post방식은 parameter가 넘어올때 요청문서의 body에 들어온다. 한글이 깨짐
		System.out.println(mname);
		String email = request.getParameter("email");
		String pass = request.getParameter("pass");
		AdminVO vo = new AdminVO(email, mname, pass);
		AdminService service = new AdminService();
		int result = service.registerAdmin(vo);
		return "redirect:loginCheck.do";
		
	}

}
