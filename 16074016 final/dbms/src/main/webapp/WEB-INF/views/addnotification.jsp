<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="adminbase.jsp" />
<link rel="stylesheet" type="text/css" href="<c:url value="/css/search.css" />"/>
<body>
<a href="/dbms/admin" style="font-size:15px;margin-left:40px">Back</a>
<h2 style="text-align:center">Notification</h2>

	<%-- <form:form method="post" modelAttribute="notification" action="/dbms/admin/addnotification">
		<table>
		<tr><td>
		Notification</td><td>
		<form:input path="notification" type="text" /> </td>
		<td><form:errors path="notification" /></td></tr>
		
		
		<tr>
			<td></td>
			<td><input type="submit" value="Submit" /></td>
			</tr>
		<tr><td>${error}</td></tr>
		</table>
	</form:form>
	
	
	<c:forEach items="${notifications}" var="notification">
	    <tr>
	    	<td>${notification.notification}</td>
	    	<td>${notification.notificationtime}</td>
	     </tr>
	     <br>
	</c:forEach>
	<a href="/dbms/admin">Back</a> --%>
	
	
	<form:form action ="/dbms/admin/addnotification" modelAttribute="notification" method="post" class="search-container">
			<form:input path="notification" type = "text" name="searchTerm" id="search-bar" placeholder = "Notification"/>
			<form:errors path="notification" />
			<input type = "submit" value="Submit" style="visibility: hidden;"/>
			${error}
	</form:form>
	
	
	<div class="container">
  <div class="row">
    <div class="col-xs-12">
      <table class="table table-bordered table-hover tablesaw tablesaw-stack" data-tablesaw-mode="stack">
        <thead>
          <tr>
            <th>Notification ID</th>
            <th>Notification</th>
            <th>Notification Date</th>
            <th>Notification Time</th>
            <th>Delete</th>
          </tr>
        </thead>
        
        <tbody>
          <c:forEach items="${notifications}" var="notification">
	    <tr>
	    	<td>${notification.notificationid}</td>
	    	<td>${notification.notification}</td>
	    	<td>${notification.notificationdate}</td>
	    	<td>${notification.notificationtime}</td>
	    	<td><a href="/dbms/admin/deletenotification/${notification.notificationid}">Delete</a></td>
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
	