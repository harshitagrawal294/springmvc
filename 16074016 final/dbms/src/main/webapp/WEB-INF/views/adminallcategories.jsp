<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="adminbase.jsp" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="<c:url value="/css/search.css" />"/>
<link rel="stylesheet" type="text/css" href="<c:url value="/css/table.css" />"/>
<title>Categories</title>
</head>
<body>
	
	<h2 style="text-align:center">Categories</h2>
	<h4 style="text-align:center">${error}</h4>
	
	<form action = "/dbms/admin/searchcategories" method="post" class="search-container" id = "searchbar">
			<input type = "text" name="searchTerm" id="search-bar" placeholder = "Search Category"/>
			<input type = "submit" value="Search" style="visibility: hidden;"/>
	</form>

	<p  style="text-align:center"><a href="/dbms/admin/addnewcategory">Add a new category</a></p><br>${success}
<%-- 	<c:forEach items="${allcategories}" var="category">
		    <tr>   
		        <td><a href="/dbms/admin/allcategories/${category.categoryid}">${category.categoryname}</a></td>
		    </tr>
		    <br>
		</c:forEach>
	<h3>${message}</h3>
	
	<br>
	<a href="/dbms/admin/">Dashboard</a>
 --%>
<div class="container">
  <div class="row">
    <div class="col-xs-12">
      <table class="table table-bordered table-hover tablesaw tablesaw-stack" data-tablesaw-mode="stack">
        <thead>
          <tr>
            <th>Category ID</th>
            <th>Category Name</th>
            <th>Category Description</th>
            <th>Category Products</th>
          </tr>
        </thead>
        
        <tbody>
          <c:forEach items="${allcategories}" var="category">
		    <tr>      
		    	<td>${category.categoryid}</td>
		    	<td>${category.categoryname}</td>
		    	<td>${category.categorydescription}</td>
		        <td><a href="/dbms/admin/allcategories/${category.categoryid}">View Products</a></td>
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