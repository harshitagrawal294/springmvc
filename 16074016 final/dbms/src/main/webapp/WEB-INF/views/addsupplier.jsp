<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="adminbase.jsp" />
	<form:form method="post" modelAttribute="supplier" action="/dbms/admin/addsupplier/${productid}">
		<table>
		
		<tr><td>
		Supplier Name</td><td>
		<form:input path="suppliername" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="suppliername" /></td></tr>
		
		<tr><td>
		Supplier Phone</td><td>
		<form:input path="supplierphone" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="supplierphone" /></td></tr>
		
		<tr><td>
		Supplier Salary</td><td>
		<form:input path="supplieraddress" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="supplieraddress" /></td></tr>
		
			<tr>
			<td><input type="submit" value="Submit" /></td>
			 <td><input type="reset" value="Reset"/> </td><br>
			</tr>
		<tr><td>${error}</td></tr>
		</table>
	</form:form>
			 <a href="/dbms/admin"> Back</a>