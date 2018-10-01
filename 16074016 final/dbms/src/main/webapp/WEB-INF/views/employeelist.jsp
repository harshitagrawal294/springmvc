<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="adminbase.jsp" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employees</title>
</head>
<body>
<br>
	<a href="<c:url value="/admin/allorders" />" style="font-size:15px;margin-left:40px">Back</a>
<h2 style="text-align:center">Assign Order to Employee</h2>
	<h4 style="text-align:center">Username : ${order.username}</h4>
	<h4 style="text-align:center">Date : ${order.orderdate}</h4>
	<%-- 	<c:forEach items="${employees}" var="employee">
		    <tr>
		    	<td>Employee Name : ${employee.employeename}</td><br>
		    	<td> Employee Phone : ${employee.employeephone}</td><br>
		    	
		    	<a href="/dbms/admin/assignorder/${orderid}/${employee.employeeid}">Assign</a>
		     </tr>
		     <br><br>
		</c:forEach>
	<br>
	<h3>${message}</h3>
	<a href="/dbms/admin/allorders/">All Orders</a><br> --%>
	
	<div class="container">

  <div class="row">
    <div class="col-xs-12">
      <table class="table table-bordered table-hover tablesaw tablesaw-stack" data-tablesaw-mode="stack">
        <thead>
          <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Password</th>
            <th>Salary</th>
            <th>Phone</th>
            <th>View Orders</th>
            <th>Assign Order</th>
          </tr>
        </thead>
        
        <tbody>
          <c:forEach items="${employees}" var="employee">
		    <tr>      
		        <td>${employee.employeeid}</td>
		        <td>${employee.employeename}</td>
		        <td>${employee.employeepassword}</td>
		        <td>${employee.employeesalary}</td>
		        <td>${employee.employeephone}</td>
		        <td><a href="/dbms/admin/employeeorders/${employee.employeename}">View Orders</a></td>
		        <td><a href="/dbms/admin/assignorder/${orderid}/${employee.employeeid}">Assign</a></td>
		    </tr>
		</c:forEach>
        </tbody>
        <tfoot>
          <!-- <tr>
            <td colspan="7"><a href="/dbms/myproducts">My Cart</a><br></td>
          </tr> -->
        </tfoot>
      </table>
    </div>
  </div>
</div>
	
</body>
</html>