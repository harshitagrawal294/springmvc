<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="base.jsp" />
<link rel="stylesheet" type="text/css" href="<c:url value="/css/table.css" />"/>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Profile</title>

</head>
<%-- <body>

	<h3>Profile Details</h3>
	<table>   
		 <tr>
		 	<td>USERNAME : ${userinfo.username}</td>
		 </tr>
		 <tr>
		 	<td>NAME : ${userinfo.name}</td>
		 </tr>
		 <tr>
		 	<td>EMAILID : ${userinfo.mail}</td>
		 </tr>
		 <tr>
		 	<td>CITY : ${userinfo.city}</td>
		 </tr>
	</table>
	<br>
	<a href="/dbms/dashboard">Dashboard</a><br>
	<a href="/dbms/editprofile">Edit Profile</a>
</body> --%>

<body>
<br>
<a href="<c:url value="dashboard" />" style="font-size:15px;margin-left:40px">Back</a>
	<h2 style="text-align:center">Profile Details</h2>
	<br>
<div class="container" style="margin-left: 400px" align="center">
  <div class="row">
    <div class="col-xs-5">
      <table align="center" class="table table-bordered table-hover tablesaw tablesaw-stack" data-tablesaw-mode="stack"> 
       
        <tbody>
		    <tr>      
			    <tr>
			 	<td>USERNAME</td>
			 	<td>${userinfo.username}</td>
			 </tr>
			 <tr>
			 	<td>NAME
			 	<td>${userinfo.name}</td>
			 </tr>
			 <tr>
			 	<td>EMAILID</td>
			 	<td>${userinfo.mail}</td>
			 </tr>
			 <tr>
			 	<td>ADDRESS</td>
			 	<td>${userinfo.address}</td>
			 </tr>
			 <tr>
			 	<td>CITY</td>
			 	<td>${userinfo.city}</td>
			 </tr>
			 <tr>
			 	<td>Phone</td>
			 	<td>${userinfo.phone}</td>
			 </tr>
        </tbody>
        <tfoot>
          <!-- <tr>
            <td colspan="7"><a href="/dbms/myproducts">My Cart</a><br></td>
          </tr> -->
          
        </tfoot>
      </table>
      <td><a href="/dbms/editprofile" class="btn btn-warning" style="background-color:black; border: black; margin-top:10px;">Edit Profile</a></td>
    </div>
  </div>
</div>
</body>
</html>