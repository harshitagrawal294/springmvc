<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="adminbase.jsp" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Users</title>
</head>
<body>
<br>
<a href="/dbms/admin/" style="font-size:15px;margin-left:40px">Back</a>
<h2 style="text-align:center">Users</h2>

	<%-- <h3>Users</h3>
		<c:forEach items="${allusers}" var="user">
		    <tr>
		    	<td>Username: ${user.username}</td>
		    	<br>
		    	<td> Phone:${user.phone}</td>
		     </tr>
		    <br>
		    <br>
		</c:forEach>
	<br>
	<h3>${message}</h3>
	<a href="/dbms/admin/">Dashboard</a><br>
</body>
</html> --%>

<div class="container">
  <div class="row">
    <div class="col-xs-12">
      <table class="table table-bordered table-hover tablesaw tablesaw-stack" data-tablesaw-mode="stack">
        <thead>
          <tr>
            <th>Username</th>
          </tr>
        </thead>
        
        <tbody>
          <c:forEach items="${allusers}" var="user">
	    <tr>
	    	<td>${user.username}</td>
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