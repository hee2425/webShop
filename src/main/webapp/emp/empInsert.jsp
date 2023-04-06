<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원 등록</title>
</head>
<style>
	tr {
		border : 1px;
	}
	h1{
		font-size : 20px;
		font-style: italic;
	}
</style>
<body>
<h1>직원 정보 입력</h1>
<form method="post" class="all" action = "<%=request.getContextPath() %>/emp/empinsert.do">
<fieldset>
	<table>
	<tr>
		<td>1. 직원ID</td>
		<td><input type="number"  name="employee_id" required placeholder="직원번호 필수" disabled="disabled"></td>
	</tr>
	<tr>
		<td>2. first_name</td>
		<td><input type="text" name="first_name" ></td>
	</tr>
	<tr>
		<td>3. last_name</td>
		<td><input type="text" name="last_name" required></td>
	</tr>
	<tr>
		<td>4. email</td>
		<td><input type="email" name="email" required></td>
	</tr>
	<tr>
		<td>5. phone number</td>
		<td><input type="tel" name="phone_number" pattern="010-[0-9]{4}-[0-9]{4}" ></td>
	</tr>
	<tr>
		<td>6. 입사 날짜</td>
		<td><input type="date" name="hire_date" required><br></td>
	</tr>
	<tr>
		<td>7. job_id</td>
		<td><input type="text" name="job_id" required><br></td>
	</tr>
	<tr>
		<td>8. salary</td>
		<td><input type="number" name="salary"><br></td>
	</tr>
	<tr>
		<td>9. commission_pct</td>
		<td><input type="text" name="commission_pct"><br></td>
	</tr>
	<tr>
		<td>10. manager_id</td>
		<td><input type="number" name="manager_id"><br></td>
	</tr>
	<tr>
		<td>11. department_id</td>
		<td><input type="number" name="department_id"><br></td>
	</tr>
	<tr>
		<td clospan="2">
			<input type="submit" value="직원등록">
		</td>
	</tr>
	</table>
	</fieldset>
	</form>
	
</body>
</html>