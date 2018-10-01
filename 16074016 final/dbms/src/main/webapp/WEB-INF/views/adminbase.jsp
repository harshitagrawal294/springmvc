<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
  pageEncoding="ISO-8859-1"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head lang="en">
    <!-- {% load static %} -->
    <meta charset="UTF-8">
    <title>General Store</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script>
    $(document).ready(function () {
        $('.dropdown-toggle').dropdown();
    });
</script>
	<!-- <link rel="stylesheet" type="text/css" href="css/search.css"/> -->

	
</head>
<style>
    body
    {
        background-color: #F8F8F8;
    }
    .caption
    {
        text-align: center;
        text-transform: uppercase;
    }
    .dropdown:hover .dropdown-menu
    {
        display: block;
    }

</style>

<body>
    <nav class="navbar navbar-inverse bg-inverse navbar-fixed-top">
        <div class="container-fluid">
            <!-- <div class="navbar-header">
                <img src="https://image.ibb.co/m1uAxQ/iBooks.png" width="30" height="30" style="margin-left:5px;margin-top:10px" alt="">
            </div> -->
            <ul class="nav navbar-nav">
            	<c:if test="${pageContext.request.userPrincipal.name != null}">
                	<li><a href="/dbms/admin">Dashboard</a></li>
                	<li><a href="/dbms/admin/allorders">Orders</a></li>
                	<li><a href="/dbms/admin/employees">Employees</a></li>
                	<li><a href="/dbms/admin/allcategories">Categories</a></li>
                	<!-- <li><a href="/dbms/admin/addproduct">Products</a></li> -->
            	</c:if>
            	<c:if test="${pageContext.request.userPrincipal.name == null}">
            		<!-- <li><a href="/dbms/admin/addproduct">Products</a></li> -->
                </c:if>
                <li><a href="/dbms/admin/addnotification">Notification</a></li>
                <li><a href="/dbms/admin/manageusers">Users</a></li>
                <!-- <a href="/dbms/admin/manageusers">users</a><br> -->
                 <li><a href="/dbms/j_spring_security_logout">Logout</a></li>
            </ul>
            
            <c:if test="${pageContext.request.userPrincipal.name != null}">
            
           <!--  <ul class="nav navbar-nav navbar-right">
                 <li class="dropdown">
              <a href="/dbms/myproducts" role="button" aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-shopping-cart"></span></a>
                </li> -->
          <!-- <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-bell"></span></a>
          <ul class="dropdown-menu">
              <li><a href="/home/messages/">Inbox</a></li>
              <li><a href="/home/messages/write/">Send Messages</a></li>
              <li><a href="/home/messages/trash/">Deleted Messages</a></li>
          </ul>
        </li> -->
     <!--  <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-user"></span></a>
          <ul class="dropdown-menu">
            <li><a href="/dbms/admin/notifications">Notifications</a></li>
               <li><a href="/dbms/profile">My profile</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="/dbms/j_spring_security_logout">Logout</a></li>
          </ul>
        </li> -->
    </ul>
    </c:if>
    	<c:if test="${pageContext.request.userPrincipal.name == null}">
    		<ul class="nav navbar-nav navbar-right">
                <li><a href="/dbms/login"><span class="glyphicon glyphicon-user"></span> Login</a></li>
                <li><a href="/dbms/register"><span class="glyphicon glyphicon-log-in"></span> Register</a></li>
            </ul>
    	</c:if>
        </div>
    </nav><br><br>
</body>
</html>