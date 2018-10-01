<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="base.jsp" />
<link rel="stylesheet" type="text/css" href="<c:url value="/css/table.css" />"/>
<link rel="stylesheet" type="text/css" href="<c:url value="/css/search.css" />"/>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Products</title>
</head>
<%-- <body>
	<h2 style="text-align:center">${category.categoryname}</h2>
	
	<form action = "/dbms/categories/searchproducts/${categoryid}" method="post" class="search-container">
			<input type = "text" name="searchTerm" id="search-bar" placeholder = "Search"/>
			<input type = "submit" value="Search" style="visibility: hidden;"/>
	</form>
	
		<c:forEach items="${productQuantity}" var="entry">
		    <tr>      
		        <td>${entry.key.productname}</td>
		        <td>${entry.key.productprice}</td>
		        <td>${entry.key.description}</td>
		        <td>${entry.value}</td>
		        <td><a href="/dbms/add/${entry.key.productid}">ADD </a></td><br>
		    </tr>
		</c:forEach>
	<br>
	<a href="/dbms/myproducts">My Cart</a><br>
	<a href="/dbms/categories">Back</a>
</body>
</html> --%>

<body>
<a href="/dbms/categories" style="font-size:15px;margin-left:40px">Back</a>
	<h2 style="text-align:center">Products in ${category.categoryname}</h2>
	<form action = "/dbms/categories/searchproducts/${categoryid}" method="post" class="search-container">
			<input type = "text" name="searchTerm" id="search-bar" placeholder = "Search"/>
			<input type = "submit" value="Search" style="visibility: hidden;"/>
	</form>

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
            <th>In Cart</th>
            <th>Add to Cart</th>
            <th>Likes</th>
            <th>Like / Dislike</th>
          </tr>
        </thead>
        
        <tbody>
          <c:forEach items="${productQuantity}" var="entry">
		    <tr>      
		        <td>${entry.key.productid}</td>
		        <td>${entry.key.productname}</td>
		        <td>${entry.key.description}</td>
		        <td>${entry.key.productprice}</td>
		        <td>${entry.value}</td>
		        <td><a href="/dbms/add/${entry.key.productid}">Add</a></td>
		        <td>${entry.key.productlikes} </td>
		        <td>
		        	<a href="/dbms/like/${entry.key.productid}">Like</a>
		        	<a href="/dbms/dislike/${entry.key.productid}">DisLike</a>
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