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
<%-- <body>
	<h2>My Orders</h2>
	<a href="/dbms/orderhistory/Pending">Placed</a>
	<a href="/dbms/orderhistory/Completed">Completed</a>
	<a href="/dbms/orderhistory/Cancelled">Cancelled</a>
	<a href="/dbms/orderhistory/Assigned">Assigned</a>
	<br>
	<c:forEach items="${orderlist}" var="order">
	<tr>
		<td>${order.orderid}</td>
		<td>${order.orderdate}</td>
		<td>${order.ordertime}</td>
		<td>${order.amount}</td>
	</tr>
	
		<c:forEach items="${order.cart.cartitems}" var="cartitem">
		    <tr>      
		    	<td>${cartitem.product.productname}</td>
		    </tr>
		    <br>
		</c:forEach>
		<c:if test = "${order.status == 'Pending'}">
		
			
			<form action = "/dbms/cancelorder" method="post">
		    	<button type = "submit" name="orderid" value = "${order.orderid}" >Cancel Order</button>
		    </form>
			
			<a href="/dbms/feedback/${order.orderid}">Give Feedback</a><br>
			
			<a href="/dbms/invoice/${order.orderid}">Download Invoice</a>
			
		</c:if>
		<c:if test = "${order.status == 'Cancelled'}">
			<h4>Order Cancelled</h4>
		</c:if>
		<c:if test = "${order.status == 'Assigned'}">
			<h4>Order Assigned</h4>
		</c:if>
		<c:if test = "${order.status == 'Completed'}">
			<h4>Order Completed</h4>
		</c:if>
		<br>
	</c:forEach>
	<br>
	<h3>${message}</h3>
	<a href="/dbms/dashboard">Dashboard</a>
</body>
</html>
 --%>
<body>
<br>
<a href="<c:url value="/dashboard" />" style="font-size:15px;margin-left:40px">Back</a>
	
	<a href="/dbms/orderhistory/Pending">Placed</a>
	<a href="/dbms/orderhistory/Completed">Completed</a>
	<a href="/dbms/orderhistory/Cancelled">Cancelled</a>
	<a href="/dbms/orderhistory/Assigned">Assigned</a>
<h2 style="text-align:center">My Orders</h2>
<br>
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
            <th>Feedbacks</th>
            <th>Cancel Order</th>
          </tr>
        </thead>
        
        <tbody>
          <c:forEach items="${orderlist}" var="order">
				<tr>
					<td>${order.orderid}</td>
					<td>${order.username}</td>
					<td>${order.status}</td>
					<td>${order.orderdate}</td>
					<td>${order.ordertime}</td>
					<td>${order.amount}</td>
					<td>${order.deliveryaddress}</td>
					<%-- <td><a href="/dbms/viewuserorder/${order.orderid}">View Order</a></td> --%>
					<td>
						<form action = "/dbms/viewuserorder" method="post">
		    				<button style="background-color:black; border: black;" class="btn btn-warning" type = "submit" name="orderid" value = "${order.orderid}" >View Order</button>
		   	 			</form>
					</td>
					<td><a href="/dbms/feedback/${order.orderid}">Give Feedback</a></td>
					<td>
					<c:if test = "${order.status == 'Pending'}">
						<form action = "/dbms/cancelorder" method="post">
		    				<button style="background-color:black; border: black;" class="btn btn-warning" type = "submit" name="orderid" value = "${order.orderid}" >Cancel Order</button>
		   	 			</form>
		   	 		</c:if>
					</td>
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
