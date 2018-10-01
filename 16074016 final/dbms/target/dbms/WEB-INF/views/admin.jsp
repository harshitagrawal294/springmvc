<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<html>
<jsp:include page="adminbase.jsp" />
<link rel="stylesheet" type="text/css" href="<c:url value="/css/parallax.css" />"/>
<body>
    
   
<%--         <h2>
            Welcome : ${user} | 
        </h2>
        <!-- <a href="/dbms/admin/addproduct">Add a new Product</a><br> -->
        <a href="/dbms/admin/allcategories">Update Products</a><br>
        <a href="/dbms/admin/manageusers">Manage users</a><br>
        <a href="/dbms/admin/allorders">View all orders</a><br>
        <a href="/dbms/admin/addnotification">Add New Notification</a><br>
        <a href="/dbms/admin/employees">Manage Employees</a><br>
        <a href="<c:url value="/j_spring_security_logout" />"> Logout</a> --%>
    
     <c:if test="${pageContext.request.userPrincipal.name != null}">
<!--     <div class="block">
  <img src="https://unsplash.it/1920/1920/?image=1080" data-speed="0.25" class="img-parallax">
  <h2>Sarada General Stores</h2>
  </div> -->
  <div class="block">
  <img src="https://images.unsplash.com/photo-1485381473713-c6131409c0be?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=b4a7612415f6780eb09a06affbdcbd66&auto=format&fit=crop&w=1920&q=60" data-speed="0.25" class="img-parallax">
  <h2>Sarada General Stores</h2>
  
</div>
</c:if>
</body>
</html>
