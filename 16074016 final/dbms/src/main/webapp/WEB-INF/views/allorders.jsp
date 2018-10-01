<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="adminbase.jsp" />
<title>Orders</title>
</head>
<%-- <body>
	<h3>Orders</h3>
	
	<a href="/dbms/admin/allorders/Completed">Completed</a>
	<a href="/dbms/admin/allorders/Pending">Pending</a>
	<a href="/dbms/admin/allorders/Cancelled">Cancelled</a>
	<a href="/dbms/admin/allorders/Assigned">Assigned</a>
		<c:forEach items="${allorders}" var="order">

			<p>
				OrderID : ${order.orderid}<br>
				Username : ${order.username}<br>
				Status : ${order.status}
			</p>
		    <a href="/dbms/admin/assignorder/${order.orderid}">Assign</a>
		    <a href="/dbms/admin/vieworder/${order.orderid}">View</a>
		    <a href="/dbms/admin/viewfeedbacks/${order.orderid}">Feedbacks</a>
		    	
		    <br><br>
		</c:forEach>
	<br>
	<h3>${message}</h3>
	<a href="/dbms/admin">Dashboard</a>
</body>
</html> --%>

<body>

<br>
<a href="<c:url value="/admin" />" style="font-size:15px;margin-left:40px">Back</a>
	
	<a href="/dbms/admin/allorders/Pending">Pending</a>
	<a href="/dbms/admin/allorders/Completed">Completed</a>
	<a href="/dbms/admin/allorders/Cancelled">Cancelled</a>
	<a href="/dbms/admin/allorders/Assigned">Assigned</a>
 
<div class="dropdown" style="margin-left:1000px;margin-top:-25px">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Employees</a>
          <ul class="dropdown-menu">
          
            <c:forEach items="${employees}" var="employee">
            	<li><a href="/dbms/admin/employeeorders/${employee.employeename}">${employee.employeename}</a></li>
            </c:forEach>
   </ul>
 </div>     
 
 <h2 style="text-align:center">All Orders</h2>         
 <br>                         
<!--   <div class="dropdown">
    <button class="btn btn-primary dropdown-toggle" style="margin-left:500px;" type="button" data-toggle="dropdown">Dropdown Example</button>
    <ul class="dropdown-menu">
      <li><a href="#">HTML</a></li>
      <li><a href="#">CSS</a></li>
      <li><a href="#">JavaScript</a></li>
    </ul>
  </div> -->
  
    
  
  
<div class="container">
  <div class="row">
    <div class="col-xs-12">
      <table class="table table-bordered table-hover tablesaw tablesaw-stack" data-tablesaw-mode="stack">
      <c:set var="total" value="${0}"/>
        <thead>
          <tr>
            <th>OrderID</th>
            <th>Username</th>
            <th>Status</th>
            <th>Order Date</th>
            <th>Order Time</th>
            <th>Amount</th>
            <th>Address</th>
            <th>View Order</th>
            <th>Feedbacks</th>
            <th>Assign Order</th>
            <th>Employee</th>
          </tr>
        </thead>
        
        <tbody>
          <c:forEach items="${allorders}" var="order">
				<tr>
					<td>${order.orderid}</td>
					<td>${order.username}</td>
					<td>${order.status}</td>
					<td>${order.orderdate}</td>
					<td>${order.ordertime}</td>
					<td>${order.amount}</td>
					<td>${order.deliveryaddress}</td>
					<td><a href="/dbms/admin/vieworder/${order.orderid}">View Order</a></td>
					<td><a href="/dbms/admin/viewfeedbacks/${order.orderid}">Give Feedback</a></td>
					<td><a href="/dbms/admin/assignorder/${order.orderid}">Assign Order</a></td>
					<td>${order.employeename}</td>
					<c:set var="total" value="${total + order.amount}" />
				</tr>
		</c:forEach>
        </tbody>
        <tfoot>
          <h4>Total : ${total}</h4>
        </tfoot>
      </table>
    </div>
  </div>
</div>

</body>
</html>
