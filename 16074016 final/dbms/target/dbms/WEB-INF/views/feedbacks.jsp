<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="base.jsp" />
<link rel="stylesheet" type="text/css" href="<c:url value="/css/search.css" />"/>
<body>
<a href="/dbms/orderhistory" style="font-size:15px;margin-left:40px">Back</a>
<h2 style="text-align:center">Feedbacks</h2>

<%-- 	<form:form method="post" modelAttribute="feedback" action="/dbms/feedback/${orderid}">
		<table>
		
		<tr><td>
		Feedback</td><td>
		<form:input path="feedback" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="feedback" /></td></tr>
		
		
		<tr>
			<td></td>
			<td><input type="submit" value="Submit" /></td>
			</tr>
			
		<tr><td>${error}</td></tr>
		</table>	
	</form:form>
	 --%>
	
	
	<form:form action ="/dbms/feedback/${orderid}" modelAttribute="feedback" method="post" class="search-container">
			<form:input path="feedback" type = "text" name="searchTerm" id="search-bar" placeholder = "Feedback"/>
			<form:errors path="feedback" />
			<input type = "submit" value="Submit" style="visibility: hidden;"/>
			${error}
	</form:form>
	
	<%-- <c:forEach items="${orderfeedbacks}" var="feedback">
	    <tr>
	    	<td>${feedback.feedback}</td>
	    	<td>${feedback.feedbacktime}</td>
	    	<td>${feedback.feedbackdate}</td>
	     </tr>
	     <br>
	</c:forEach>
	<a href="/dbms/orderhistory">Back</a> --%>
	
	<div class="container">
  <div class="row">
    <div class="col-xs-12">
      <table class="table table-bordered table-hover tablesaw tablesaw-stack" data-tablesaw-mode="stack">
        <thead>
          <tr>
            <th>Feedback ID</th>
            <th>Feedback</th>
            <th>Feedback Date</th>
            <th>Feedback Time</th>
          </tr>
        </thead>
        
        <tbody>
          <c:forEach items="${orderfeedbacks}" var="feedback">
	    <tr>
	    	<td>${feedback.feedbackid}</td>
	    	<td>${feedback.feedback}</td>
	    	<td>${feedback.feedbackdate}</td>
	    	<td>${feedback.feedbacktime}</td>
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


	