
<%@page import="com.shinhan.vo.EmpVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	List<EmpVO> emplist = (List<EmpVO>)request.getAttribute("empAll");  
	//서블릿에서 읽어옴
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<style>
@import url(//fonts.googleapis.com/earlyaccess/kopubbatang.css);
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
	h1{
		font-family: 'KoPub Batang', serif;
		text-align: center;
	}
	table {
		margin-left : auto;
		margin-right: auto;
		text-align : center;
	}
	
	
	th {
		font-family: monospace;
		font:bold;
		background-color: lightblue;
		color: white;
		border-radius: 15px;
		padding: 15px;
		
	}
	
	tbody tr, td{
		border-bottom: 1px solid gray;
		padding : 3px;
		font-family: 'Jeju Gothic', sans-serif;
	}
	tr:hover{
		background-color: lightgray !important; 
	}
	td .index {
		background-color: rgb(210, 210, 210);
	}
	button {
		padding: 10px;
		font : bold;
		margin-bottom: 10px;
		border-radius: 10px;
	}
</style>
<script>
	$(function(){
		$(".btnDel").on("click", function(){
			location.href="empDelete.do?empid="+$(this).attr("data-del");
		});
	});

	$(function(){
		$("#btnLogout").on("click", function(){
			$.ajax({
				url:"../auth/logout.do",
				success:function(){
					alert("로그아웃 되었습니다...");
				},
				error:function(){
					alert(message);
					console.log(message);
				}
			});
		});
	});


	$(function(){
		$("thead tr th").click(function(e){
			var trNum = $(this).closest("th").prevAll().length;
			console.log(trNum);
			var a = $("tbody tr").each(function(index, item){
			var col = $(item).find("td:nth-child(" + (trNum+1) + ")");
			console.log(col);
			//되돌리기(기존선택을 clear)
			$(item).find("td").css("background-color", "white");
			//신규선택의 색깔 바꾸기
			$(col).css("background-color", "lightgray");
			});
		});
		
		//body > table > tbody > tr:nth-child(1) > td:nth-child(2)
		//body > table > tbody > tr:nth-child(17) > td:nth-child(2)
		
		$("button[id='btn1']").css("backgroundColor","lightyellow");
		$("button[id='btn2']").css("backgroundColor","lightgreen");
		$("button[id='btn3']").css("backgroundColor","#fff0f5");
		
		//body > table > tbody > tr:nth-child(2) > td:nth-child(2)
		//body > table > tbody > tr:nth-child(4) > td:nth-child(2)
		$('#btn1').click(function(){
			$("tbody>tr:nth-child(2n)").css("backgroundColor", "lightyellow");
		});
		$('#btn2').click(function(){
			var r = $("tr>td:nth-child(2):contains('S')");
			$(r).parent().css("backgroundColor", "lightgreen");
		});
		$('#btn3').click(function(){
			var r = $("tr>td:nth-child(2):");
			
			$(r).parent().css("backgroundColor", "#fff0f5");
			
			console.log(r);
			
		
		});
		
		
		var str = "";
		var arr=["IT_PROG", "AD_VP", "AD_PRES","ST_MAN","ST_CLERK"];
		$.each(arr, function(index, item){
			str += "<option>" + item + "</option>";
		});
		$("#jobs").html(str);  //html() : jquery 함수, innerHTML은 
		
		
		$("select").change(function(){
			var jobid = $(this).val();
			//init();
			$("tr td").css("color","black");
			$("tr td:contains('" + jobid + "')").css("color", "red");
			});
		//});
	});
</script>
</head>
<body>

	<h1>직원목록</h1>
	<!-- include 디렉티브는 소스를 합쳐서 컴파일한다. -->
	<%@ include file="../common/header.jsp" %>
		 <button id="btnLogout" style="margin-top:3px">로그아웃</button> 
	<!-- <input type="button" id="btnLogout" value="로그아웃"> -->
	<button onclick = "location.href='<%=request.getContextPath() %>/emp/empinsert.do'"
	type="button" class="btn btn-success">신규직원등록</button>
	<br><hr>
	<button id="btn1" class="btn btn-success">짝수row 선택</button>
	<button id="btn2" class="btn btn-success">이름 s로 시작하는 직원</button>
	<button id="btn3" class="btn btn-success">s문자 포함</button>
	
	
	<select>
		<option value="IT_PROG">IT_PROG</option>
		<option>AD_VP</option>
		<option>PU_CLERK</option>
		<option>ST_MAN</option>
	</select>
	<select id="jobs">
		
	</select>
	
	<table>
	<thead>
	<tr>
	<th>직원번호</th>
	<th>이름</th>
	<th>성</th>
	<th>이메일</th>
	<th>급여</th>
	<th>입사일</th>
	<th>전화번호</th>
	<th>직책</th>
	<th>매니저</th>
	<th>커미션</th>
	<th>부서</th>
	<th></th>
	</tr>
	</thead>
	<tbody>
	<%for(EmpVO emp:emplist){ %>
	<tr>
	<td class="index"><a href="empDetail.do?empid=<%=emp.getEmployee_id() %>"><%=emp.getEmployee_id() %></a></td>
	<td><a href="empDetail.do?empid=<%=emp.getEmployee_id() %>"><%=emp.getFirst_name() %></a></td>
	<td><%=emp.getLast_name() %></td>
	<td><%=emp.getEmail() %></td>
	<td><%=emp.getSalary() %></td>
	<td><%=emp.getHire_date() %></td>
	<td><%=emp.getPhone_number() %></td>
	<td><%=emp.getJob_id()%></td>
	<td><%=emp.getManager_id() %></td>
	<td><%=emp.getCommission_pct()%></td>
	<td><%=emp.getDepartment_id()%></td>
	<td><button class="btnDel" data-del="<%=emp.getEmployee_id() %>">삭제</button></td>
	</tr>
	<%} %>
	</tbody>
	</table>

</body>
</html>