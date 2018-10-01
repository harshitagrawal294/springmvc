<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<head>
<jsp:include page="base.jsp" />
<%-- <link rel="stylesheet" type="text/css" href="<c:url value="/css/table.css" />"/> --%>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 

<style type="text/css">
	body {
		color: #999;
		background: #fafafa;
		
	}
	.form-control {
        min-height: 41px;
		box-shadow: none;
		border-color: #e6e6e6;
	}
	.form-control:focus {
		border-color: black;
	}
    .form-control, .btn {        
        border-radius: 3px;
    }
	.signup-form {
		width: 425px;
		margin: 0 auto;
		padding: 20px 0;
	}
	.signup-form h2 {
		color: #333;
        margin: 0 0 25px;
    }
    .signup-form form {
    	margin-bottom: 5px;
        background: #fff;
		border: 1px solid #f4f4f4;
        box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
        padding: 20px 50px;
    }
	.signup-form .form-group {
		margin-bottom: 5px;
	}
	.signup-form label {
		font-weight: normal;
		font-size: 13px;
	}  
    .signup-form .btn {        
        font-size: 16px;
		background: black;
		margin-left:90px;
		border: none;
		min-width: 140px;
        outline: none !important;
    }
	.signup-form .btn:hover, .signup-form .btn:focus {
		background: black;
	}
	.signup-form a {
		color: #00c1c0;
		text-decoration: none;
	}	
	.signup-form a:hover {
		text-decoration: underline;
	}
</style>


</head>
<!-- <h3>Edit Profile</h3> -->
<%-- <h4>${username}</h4>
	<form:form method="post" modelAttribute="user" action="/dbms/editprofile">
		<table>
		
		<form:hidden path="username"></form:hidden>
		<form:hidden path="password"></form:hidden>
		<form:hidden path="mpassword"></form:hidden>
		<form:hidden path="pin"></form:hidden>
		<form:hidden path="phone"></form:hidden>
		
		<tr><td>Name</td>
		<td>
		<form:input path="name" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="name" /></td></tr>
		
		<tr><td>Address</td>
		<td>
		<form:input path="address" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="address" /></td></tr>
		
		<tr><td>City</td>
		<td>
		<form:input path="city" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="city" /></td></tr>
		<tr>
		
		<tr><td>Mail</td>
		<td>
		<form:input path="mail" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="mail" /></td></tr>
		<tr>
			<td></td>
			<td><input type="submit" value="Submit" /></td>
			</tr>
		<tr><td>${error}</td></tr>
		</table>
	</form:form>
<body> --%>
	
<body>
<br>
<a href="/dbms/profile" style="font-size:15px;margin-left:40px">Back</a>
	<!-- <h2 style="text-align:center">Edit Profile</h2> -->
<%-- <div class="container" style="margin-left: 450px" align="center">
  <div class="row">
    <div class="col-xs-4">
    <form:form method="post" modelAttribute="user" action="/dbms/editprofile">
      <table align="center" class="table table-bordered table-hover tablesaw tablesaw-stack" data-tablesaw-mode="stack"> 
       
        <tbody>
		<form:hidden path="username"></form:hidden>
		<form:hidden path="password"></form:hidden>
		<form:hidden path="mpassword"></form:hidden>
		<form:hidden path="pin"></form:hidden>
		
		<tr><td>Name</td>
		<td>
		<form:input path="name" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="name" /></td></tr>
		
		<tr><td>Address</td>
		<td>
		<form:input path="address" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="address" /></td></tr>
		
		<tr><td>City</td>
		<td>
		<form:input path="city" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="city" /></td></tr>
		<tr>
		
		<tr><td>Mail</td>
		<td>
		<form:input path="mail" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="mail" /></td></tr>
		
		<tr><td>Phone</td>
		<td>
		<form:input path="phone" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="phone" /></td></tr>
		
		<tr><td>${error}</td></tr>
        </tbody>
        
      </table>
      	<tr>
			<td><input type="submit" value="Submit" class="btn btn-warning" style="background-color:black; border: black;" /></td>
			</tr>
      </form:form>
     <!--  <td><a href="/dbms/editprofile" class="btn btn-warning" style="background-color:black; border: black; margin-top:10px;">Edit Profile</a></td> -->
    </div>
  </div>
</div> --%>


<div class="signup-form">
    <form:form action="/dbms/editprofile" modelAttribute="user" method="post">
		<h2 style="text-align:center">Edit Profile</h2>
		
		
		<form:hidden path="username"></form:hidden>
		<form:hidden path="password"></form:hidden>
		<form:hidden path="mpassword"></form:hidden>
		<form:hidden path="pin"></form:hidden>
		
        
        <div class="form-group">
        	<form:input type="email" path="mail" class="form-control" name="email" placeholder="Email Address" required="required"/>
        </div>
		
        <div class="form-group">
            <form:input type="text" path="name" class="form-control" name="name" placeholder="Name" required="required"/>
        </div>
         <div class="form-group">
            <form:input type="text" path="address" class="form-control" name="address" placeholder="Address" required="required"/>
        </div>
         <div class="form-group">
            <form:input type="text" path="city" class="form-control" name="city" placeholder="City" required="required"/>
        </div>
         <div class="form-group">
            <form:input type="text" path="phone" class="form-control" name="phone" placeholder="Address" required="required"/>
        </div>        
                
		<div class="form-group" style="margin-top:20px">
            <button type="submit" class="btn btn-primary btn-lg">Edit Profile</button>
        </div>
       
        <form:errors path="mail" />
        <form:errors path="city" />
        <form:errors path="address" />
        <form:errors path="phone" />
        <p style="text-align:center; color:red">${error}</p>
    </form:form>
	<!-- <div class="text-center">Already have an account? <a href="/dbms/login">Login here</a></div> -->
</div>

</body>
</html>
	
	</body>
	