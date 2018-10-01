<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="base.jsp" />
<link rel="stylesheet" type="text/css" href="<c:url value="/css/table.css" />"/>
<!-- <body>
<br> -->
<!-- <h3>Notifications</h3> -->

	<%-- 
	<c:forEach items="${notifications}" var="notification">
	    <tr>
	    	<td>${notification.notification}</td>
	    	<td>${notification.notificationtime}</td>
	     </tr>
	     <br>
	</c:forEach>
	<a href="/dbms/dashboard">Back</a>
</body>
 --%>
<body>
<br>
<a href="<c:url value="dashboard" />" style="font-size:15px;margin-left:40px">Back</a>
	<h2 style="text-align:center">Notifications</h2>
<div class="container" style="margin-left: 60px" align="center">
  <div class="row">
    <div class="col-xs-12">
      <table align="center" class="table table-bordered table-hover tablesaw tablesaw-stack" data-tablesaw-mode="stack"> 
       <thead>
          <tr>
            <th>NotificationID</th>
            <th>Notification</th>
            <th>Date</th>
            <th>Time</th>
          </tr>
        </thead>
        
        <tbody>
          <c:forEach items="${notifications}" var="notification">
	    <tr>
	    	<td>${notification.notificationid}</td>
	    	<td>${notification.notification}</td>
	    	<td>${notification.notificationdate}</td>
	    	<td>${notification.notificationtime}</td>
	     </tr>
	</c:forEach>
        </tbody>
      </table>
      <!-- <td><a href="/dbms/editprofile" class="btn btn-warning" style="background-color:black; border: black; margin-top:10px;">Edit Profile</a></td> -->
    </div>
  </div>
</div>

</body>
	