<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="base.jsp" />
<link rel="stylesheet" type="text/css" href="<c:url value="/css/cart.css" />"/>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cart</title>
</head>
<%-- <body>
	<br>
	<br>
	<h4>${error}</h4>
	<h3>My Cart</h3>
		<c:forEach items="${mycart.cartitems}" var="cartitem">
		    <tr>      
		    	<td>${cartitem.product.productname}</td>
		        <td>${cartitem.product.productprice}</td>
		        <td>${cartitem.quantity}</td>
		        <td><a href="/dbms/remove/${cartitem.product.productid}">REMOVE</a></td>
		    </tr>
		    <br>
		</c:forEach>
		Amount = ${amount}<br>
	<br>
	<a href="/dbms/confirmorder">Place Order</a><br>
	<a href="/dbms/emptycart">Empty Cart</a><br>
	<a href="/dbms/dashboard">Dashboard</a><br>
	<a href="/dbms/categories">All Products</a>
</body>
</html> --%>
<body>
	<br>
	<a href="<c:url value="/dashboard" />" style="font-size:15px;margin-left:40px">Back</a><br>
	<a href="<c:url value="/emptycart" />" style="font-size:15px;margin-left:40px">Empty Cart</a>
	
	<h4 style="margin-left:40px">${error}</h4>
	<h2 style="text-align:center">My Cart</h2>
<div class="container">
	<table id="cart" class="table table-hover table-condensed">
    				<thead>
						<tr>
							<!-- <th style="width:10%">Product ID</th>
 -->						<th style="width:50%">Product</th>
							<th style="width:10%">Price</th>
							<th style="width:8%">Quantity</th>
							<th style="width:22%" class="text-center">SubTotal</th>
							 <th style="width:10%"></th>
						</tr>
					</thead>
					<tbody>
						
						<c:forEach items="${mycart.cartitems}" var="cartitem">
							<tr>
								<td data-th="Product">
									<div class="row">
										<div class="col-sm-10">
											<h4 class="nomargin">${cartitem.product.productname}</h4>
											<p>${cartitem.product.description}</p>
										</div>
								</td>
								<td data-th="Price">${cartitem.product.productprice}</td>
								
								<td data-th="Quantity" class="text-center">
									<!-- <input type="number" class="form-control text-center" value="1"> -->
									${cartitem.quantity}
								</td>
								<c:set var = "price" scope = "session" value = "${cartitem.product.productprice}"/>
								<c:set var = "quantity" scope = "session" value = "${cartitem.quantity}"/>
								<td data-th="Subtotal" class="text-center">${price*quantity}</td>
								
								<td class="actions" data-th="">
									<a href="/dbms/addfromcart/${cartitem.product.productid}">ADD /</a>
									<a href="/dbms/remove/${cartitem.product.productid}">REMOVE</a>								
								</td>
							</tr>
						</c:forEach>

						
						
						
						
							<!-- <td data-th="Product">
								<div class="row">
									<div class="col-sm-10">
										<h4 class="nomargin">Product 1</h4>
										<p>Quis aute iure reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Lorem ipsum dolor sit amet.</p>
									</div>
							</td>
							<td data-th="Price">$1.99</td>
							
							<td data-th="Quantity">
								<input type="number" class="form-control text-center" value="1">
							</td>
							
							<td data-th="Subtotal" class="text-center">1.99</td>
							
							<td class="actions" data-th="">
								<button class="btn btn-info btn-sm"><i class="fa fa-refresh"></i></button>
								<button class="btn btn-danger btn-sm"><i class="fa fa-trash-o"></i></button>								
							</td>
							
						</tr> -->
						
					</tbody>
					
					<tfoot>
						<tr class="visible-xs">
							<td class="text-center"><strong >Total ${amount}</strong></td>
						</tr>
						<tr>
							<td><a href="/dbms/categories" class="btn btn-warning" style="background-color:black; border: black; margin-top:10px;"><i class="fa fa-angle-left"></i> Continue Shopping</a></td>
							<td colspan="2" class="hidden-xs"></td>
							<td class="hidden-xs text-center" style="margin-top:14px"><strong>Total ${amount}</strong></td>
							
							<td><a href="/dbms/confirmorder" class="btn btn-success btn-block" style="background-color:black; border: black;margin-top:10px">Checkout<i class="fa fa-angle-right"></i></a></td>
						
						</tr>
						
						<!-- <tr>
							<th><a href="/dbms/emptycart" class="btn btn-success btn-block" style="width:26%;background-color:black; border: black;margin-top:10px">Empty Cart<i class="fa fa-angle-right"></i></a></th>
						</tr> -->
					</tfoot>
				</table>
				
		</div>
</body>
</html>