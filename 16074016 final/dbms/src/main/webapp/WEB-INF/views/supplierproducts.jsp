<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="adminbase.jsp" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Suppliers</title>
</head>
<body>
	<p style="text-align:center"><h3>Suppliers for ${product.productname}</h3></p>
			
			<a href="/dbms/admin/addsupplier/${product.productid}">Add Supplier</a>
		<c:forEach items="${suppliers}" var="supplier">

			<p>
				SupplierID : ${supplier.supplierid}<br>
				Name : ${supplier.suppliername}<br>
				Phone : ${supplier.supplierphone}<br>
				Address : ${supplier.supplieraddress}
			</p>
		    <br>
		</c:forEach>
	<h3>${message}</h3>
	<a href="/dbms/admin/allcategories/${categoryid}">Back</a>
	
</body>
</html>