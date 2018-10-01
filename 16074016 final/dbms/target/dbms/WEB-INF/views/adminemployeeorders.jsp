<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="adminbase.jsp" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Orders</title>
</head>
<body>
<br>
<a href="<c:url value="/admin/allorders" />" style="font-size:15px;margin-left:40px">Back</a>
<h2 style="text-align:center">${employeename}</h2>
	<%-- <h3>Orders</h3>

		<c:forEach items="${allorders}" var="order">

			<p>
				OrderID : ${order.orderid}<br>
				Username : ${order.username}<br>
				Status : ${order.status}
			</p>

		    <br><br>
		</c:forEach>
	<br>
	<h3>${message}</h3>
	<a href="/dbms/admin/employees">Dashboard</a> --%>
	
	
	<div class="container">
  <div class="row">
    <div class="col-xs-12">
      <table class="table table-bordered table-hover tablesaw tablesaw-stack" data-tablesaw-mode="stack">
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