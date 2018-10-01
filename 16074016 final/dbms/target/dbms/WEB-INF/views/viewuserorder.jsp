<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="<c:url value="/css/table.css" />"/>
<jsp:include page="base.jsp" />
<title>Order</title>
 <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript">
        $("#btnPrint").live("click", function () {
            var divContents = $("#dvContainer").html();
            var printWindow = window.open('', '', 'height=400,width=800');
            printWindow.document.write('<html><head><title>Invoice</title>');
            printWindow.document.write('</head><body >');
            printWindow.document.write(divContents);
            printWindow.document.write('</body></html>');
            printWindow.document.close();
            printWindow.print();
        });
    </script>
</head>
<%--<body>
	<h3>Order Summary</h3>
		
		         
    	<h4>OrderID : ${order.orderid} <br>
    	    Username : ${order.username}
    	</h4>
    	<p>Date : ${order.orderdate}<br>
    	Time : ${order.ordertime}<br>
    	Amount : ${order.amount}</p>
    	<p>Employee : ${employee.employeename}</p>
    	<h4>Products : </h4>
  
    	<c:forEach items="${cart.cartitems}" var="cartitem">
    		<tr>	
    			<td>${cartitem.product.productname}</td>
    			<td>${cartitem.quantity}</td><br>
    		</tr>
    	</c:forEach>
		    	
	<h3>${message}</h3>
</body> --%>

<body>

<br>
<a href="<c:url value="/orderhistory" />" style="font-size:15px;margin-left:40px">Back</a>
<div id="dvContainer">

	<h2 style="text-align:center">Order Summary : ${order.status}</h2>	
	<h4 style="text-align:center">Username : ${order.username}</h4>
	<h4 style="text-align:center">Date : ${order.orderdate}</h4>
	<h4 style="text-align:center">Time : ${order.ordertime}</h4>
	<h4 style="text-align:center">Address : ${order.deliveryaddress}</h4>
	
	<h2 style="text-align:center">Products</h2>
	<br>
	<div class="container">
  <div class="row">
    <div class="col-xs-12">
    <br>
      <table class="table table-bordered table-hover tablesaw tablesaw-stack" data-tablesaw-mode="stack">
        <thead>
          <tr>
            <th>Product ID</th>
            <th>Product Name</th>
            <th>Product Description</th>
            <th>Product Price</th>
            <th>Quantity</th>
          </tr>
        </thead>
        
        <tbody>
          <c:forEach items="${cart.cartitems}" var="cartitem">
				<tr>
					<td>${cartitem.product.productid}</td>
					<td>${cartitem.product.productname}</td>
					<td>${cartitem.product.description}</td>
					<td>${cartitem.product.productprice}</td>
					<td>${cartitem.quantity}</td>
				</tr>
		</c:forEach>
        </tbody>
        <tfoot>
			<tr class="visible-xs">
				<td class="text-center"><strong >Total : ${order.amount}</strong></td>
			</tr>
			<tr>
			
<!-- 				<td><a href="/dbms/categories" class="btn btn-warning" style="background-color:black; border: black; margin-top:0px;"><i class="fa fa-angle-left"></i>Invoice</a></td> -->
				
			<%-- <td><button class="btn btn-warning" style="background-color:black; border: black;" type = "submit" name="orderid" value = "${order.orderid}" id="btnPrint" >Invoice</button></td> --%>	
				
				<td colspan="2" class="hidden-xs"></td>
				<td class="hidden-xs text-center" style="margin-top:10px"><strong>Total : ${order.amount}</strong></td>
				
				
			</tr>
		</tfoot>
		
      </table>
    </div>
  </div>
</div>
</div>
    <button class="btn btn-warning" style="margin-left:100px;background-color:black; border: black;" type = "submit" name="orderid" id="btnPrint" >Invoice</button>
	<c:if test = "${order.status == 'Pending'}">
					
				<td><form action = "/dbms/cancelorder" method="post">
		    			<button class="btn btn-warning" style="margin-left:1000px;margin-top:-40px;background-color:black; border: black;" type = "submit" name="orderid" value = "${order.orderid}" >Cancel Order</button>
		    		</form></td>	
				
				
				</c:if>

</body>
</html>