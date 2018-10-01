<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="base.jsp" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Order History</title>
</head>
<body>
	<h2>My Orders</h2>
	<a href="/dbms/orders/Pending">Placed</a>
	<a href="/dbms/orders/Completed">Completed</a>
	<a href="/dbms/orders/Cancelled">Cancelled</a>
	<br>
	<c:forEach items="${orderlist}" var="order">
	<tr>
		<td>${order.key.orderid}</td>
		<td>${order.key.orderdate}</td>
		<td>${order.key.ordertime}</td>
		<td>${order.deliveryaddress}</td>
		
	</tr>
	<p>Amount : ${order.value}</p>
		<c:forEach items="${order.key.cart.cartitems}" var="cartitem">
		    <tr>      
		    	<td>${cartitem.product.productname}</td>
		    </tr>
		    <br>
		</c:forEach>
		<c:if test = "${order.key.status == 'Pending'}">
		
			
			<form action = "/dbms/cancelorder" method="post">
		    	<button type = "submit" name="orderid" value = "${order.key.orderid}" >Cancel Order</button>
		    </form>
			
			<a href="/dbms/feedback/${order.key.orderid}">Give Feedback</a><br>
			
			<a href="/dbms/invoice/${order.key.orderid}">Download Invoice</a>
			
		</c:if>
		<c:if test = "${order.key.status == 'Cancelled'}">
			<h4>Order Cancelled</h4>
		</c:if>
		<c:if test = "${order.key.status == 'Assigned'}">
			<h4>Order Assigned</h4>
		</c:if>
		<br><br><br>
	</c:forEach>
	<br>
	<h3>${message}</h3>
	<a href="/dbms/dashboard">Dashboard</a>
</body>
</html>