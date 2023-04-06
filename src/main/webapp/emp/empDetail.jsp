<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원 상세 보기</title>
</head>
<style>
	#container{
		
		width: 55%;
		margin : 0 auto;
	}
	tr {
		border : 1px;
	}
	h1{
		font-size : 20px;
		font-style: italic;
	}
	input[name="email"],
	input[name="department_id"],
	input[name="job_id"],
	input[name="salary"],
	input[name="manager_id"],
	input[name="hire_date"] {
		background-color: lightyellow;
	}
</style>
<body>

<%-- ${} : getAttribute()
	${emp} <%=request.getAttribute("emp")%>
	${emp.employee_id} <%=request.getAttribute()%> --%>
<div id="container">
<h1>직원 상세 보기</h1>
<form method="post" class="all" action = "<%=request.getContextPath() %>/emp/empDetail.do">
<fieldset>
	<table>
	<tr>
		<td>1. 직원ID</td>
		<td><input type="number"  name="employee_id"  value=${emp.employee_id}></td>
	</tr>
	<tr>
		<td>2. first_name</td>
		<td><input type="text" name="first_name" value=${emp.first_name} ></td>
	</tr>
	<tr>
		<td>3. last_name</td>
		<td><input type="text" name="last_name" required value=${emp.last_name} ></td>
	</tr>
	<tr>
		<td>4. email</td>
		<td><input type="email" name="email" required value=${emp.email}></td>
	</tr>
	<tr>
		<td>5. phone number</td>
		<td><input type="tel" name="phone_number" pattern="010-[0-9]{4}-[0-9]{4}" value=${emp.phone_number}></td>
	</tr>
	<tr>
		<td>6. 입사 날짜</td>
		<td><input type="date" name="hire_date" required value=${emp.hire_date}><br></td>
	</tr>
	<tr>
		<td>7. job_id</td>
		<td><input type="text" name="job_id" required value=${emp.job_id}><br></td>
	</tr>
	<tr>
		<td>8. salary</td>
		<td><input type="number" name="salary" value=${emp.salary}><br></td>
	</tr>
	<tr>
		<td>9. commission_pct</td>
		<td><input type="text" name="commission_pct" value=${emp.commission_pct}><br></td>
	</tr>
	<tr>
		<td>10. manager_id</td>
		<td><input type="number" name="manager_id" value=${emp.manager_id}><br></td>
	</tr>
	<tr>
		<td>11. department_id</td>
		<td><input type="number" name="department_id" value=${emp.department_id}><br></td>
	</tr>
	<tr>
		<td clospan="2">
			<input type="submit" value="직원 정보 수정">
		</td>
	</tr>
	</table>
	</fieldset>
	</form>
	</div>
	
</body>
</html>