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
<%-- <body>
<br>
	<h4>${error}</h4>
	<a href="/dbms/admin/addemployee">Add Employee</a>
	<h3>Employees</h3>
		<c:forEach items="${employees}" var="employee">
		    <tr>      
		    	<td>${employee.employeename}</td><br>
		    	<td>${employee.employeephone}</td><br>
		    	<td>${employee.employeesalary}</td>
		    	<form action = "/dbms/admin/removeemployee" method="post">
		  			<button type = "submit" name="employeename" value = "${employee.employeename}" >Fire</button>
				</form>
				<a href="/dbms/admin/employeeorders/${employee.employeename}">View Orders</a>
		    </tr>
		    <br>
		</c:forEach>
	<br>
	<h3>${message}</h3>
	<a href="/dbms/admin">Dashboard</a>
</body>
</html> --%>
<body>
<br>
<a href="<c:url value="/admin" />" style="font-size:15px;margin-left:40px">Back</a>
<h2 style="text-align:center">Employees</h2>
<h4 style="text-align:center;color:red">${error}</h4>
<p  style="text-align:center"><a href="/dbms/admin/addemployee">Add Employee</a></p><br>${success}
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
            <th>Delete</th>
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
		        <td><a href="/dbms/admin/removeemployee/${employee.employeename}">Fire</a></td>
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