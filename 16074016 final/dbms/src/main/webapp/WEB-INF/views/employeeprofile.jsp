<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="employeebase.jsp" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Profile</title>
</head>
<body>
	<h3>Profile Details</h3>
	<table>   
		 <tr>
		 	<td>NAME/USERNAME : ${employee.employeename}</td>
		 </tr>
		 <tr>
		 	<td>PASSWORD : ${employee.employeepassword}</td>
		 </tr>
		 <tr>
		 	<td>PHONE : ${employee.employeesalary}</td>
		 </tr>
		 <tr>
		 	<td>SALARY : ${employee.employeesalary}</td>
		 </tr>
	</table>
	<br>
	<a href="/dbms/employee">Dashboard</a><br>
</body>
</html>