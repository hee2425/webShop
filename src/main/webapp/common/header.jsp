<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<div id="login-user-div" >${loginUser.getManager_name()} 님, 반갑습니다.</div>
<div>세션에서 로그인한 사용자 읽기(ScriptLet): <%=session.getAttribute("loginUser") %></div>

<img src="../images/umbrella.jpg" widht="30" height="30">	 