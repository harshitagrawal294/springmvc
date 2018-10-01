<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="employeebase.jsp" />

<title>Orders</title>
</head>
<body>
	<%-- <h3>Orders</h3>
	<a href="/dbms/employee/orders">Assigned</a>
	<a href="/dbms/employee/orders/Completed">Completed</a>
	
		<c:forEach items="${employeeorders}" var="order">

			<p>
				OrderID : ${order.orderid}<br>
				Username : ${order.username}<br>
				Status : ${order.status}
			</p>
			<c:if test = "${order.status == 'Assigned'}">
				<form action = "/dbms/employee/complete" method="post">
			    	<button type = "submit" name="orderid" value = "${order.orderid}" >Complete</button>
			    </form>
			</c:if>
		    
		    <form action = "/dbms/employee/vieworder" method="post">
		    	<button type = "submit" name="orderid" value = "${order.orderid}" >View Order</button>
		    </form>
		    	
		    <br><br>
		</c:forEach>
	<br>
	<h3>${message}</h3>
	<a href="/dbms/employee">Dashboard</a> --%>
	<br>
	<a href="<c:url value="/employee" />" style="font-size:15px;margin-left:40px">Back</a>
	<a href="/dbms/employee/orders">Assigned</a>
	<!-- <a href="/dbms/employee/orders/Completed">Completed</a> -->
<h2 style="text-align:center">${employeename}</h2>

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
            <th>Delivery Address</th>
            <th>View Order</th>
            <th>Complete Order</th>
          </tr>
        </thead>
        
        <tbody>
          <c:forEach items="${employeeorders}" var="order">
				<tr>
					<td>${order.orderid}</td>
					<td>${order.username}</td>
					<td>${order.status}</td>
					<td>${order.orderdate}</td>
					<td>${order.ordertime}</td>
					<td>${order.amount}</td>
					<td>${order.deliveryaddress}</td>
					<td>
						<form action = "/dbms/employee/vieworder" method="post">
		    				<button type = "submit" name="orderid" value = "${order.orderid}" >View Order</button>
		    			</form>
		    		</td>
					<td>
						<c:if test = "${order.status == 'Assigned'}">
							<form action = "/dbms/employee/complete" method="post">
			    				<button type = "submit" name="orderid" value = "${order.orderid}" >Complete</button>
			    			</form>
						</c:if>
					</td>
				</tr>
		</c:forEach>
        </tbody>
        <tfoot>
        </tfoot>
      </table>
    </div>
  </div>
</div>

	
</body>
</html>