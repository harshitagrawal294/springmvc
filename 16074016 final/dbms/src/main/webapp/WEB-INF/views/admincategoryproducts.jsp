<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="adminbase.jsp" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">


<link rel="stylesheet" type="text/css" href="<c:url value="/css/search.css" />"/>


<title>Products</title>
</head>
<body>
<%-- 		<h2>${category.categoryname}</h2>
		
			<form action = "/dbms/admin/searchproducts/${categoryid}" method="post">
			<input type = "text" name="searchTerm" />
			<input type = "submit" value="Search" />
	</form> --%>
	
	<a href="/dbms/admin/allcategories" style="font-size:15px;margin-left:40px">Back</a>
	<h2 style="text-align:center">Products in ${category.categoryname}</h2>
	<h4 style="text-align:center">${error}</h4>
	
	<form action = "/dbms/admin/searchproducts/${categoryid}" method="post" class="search-container" id = "searchbar">
			<input type = "text" name="searchTerm" id="search-bar" placeholder = "Search Category"/>
			<input type = "submit" value="Search" style="visibility: hidden;"/>
	</form>
	
	<p  style="text-align:center"><a href="/dbms/admin/addproduct/${categoryid}">Add a new product</a></p><br>${success}
	<%-- <br>
		<c:forEach items="${admincategoryproducts}" var="product">
		    <tr>      
		        <td>${product.productname}</td>
		        <td>${product.productprice}</td>
		        <td>${product.availablequantity}</td>
		        <td>${product.description}</td>
		        
		        <td><a href="/dbms/admin/supplier/${product.productid}">View Supplier</a></td>
		     	<td><form method="post" action="/dbms/admin/allcategories/${categoryid}">
		        	<input type = "hidden" name="productid" value="${product.productid}"/>
		        	<input type = "text" name="updatequantity" placeholder = "Add Quantity"/>
		        </form></td>
		    </tr>
		   </c:forEach>
	<a href="/dbms/admin/allcategories">Back</a> --%>
	
	
	<div class="container">
  <div class="row">
    <div class="col-xs-12">
      <table class="table table-bordered table-hover tablesaw tablesaw-stack" data-tablesaw-mode="stack">
        <thead>
          <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Description</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Update Quantity</th>
            <th>View Supplier</th>
          </tr>
        </thead>
        
        <tbody>
          <c:forEach items="${admincategoryproducts}" var="product">
		    <tr>      
		        <td>${product.productid}</td>
		        <td>${product.productname}</td>
		        <td>${product.description}</td>
		        <td>${product.productprice}</td>
		        <td>${product.availablequantity}</td>
		        <td>
		        	<form method="post" action="/dbms/admin/allcategories/${categoryid}">
		        	<input type = "hidden" name="productid" value="${product.productid}"/>
		        	<input type = "text" name="updatequantity"/>
					</form>
				</td>
		        <td><a href="/dbms/admin/supplier/${product.productid}">View Supplier</a></td>
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