<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<head>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 

	<style type="text/css">
	body {
		color: #999;
		background: #fafafa;
		font-family: 'Roboto', sans-serif;
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
	
<body>

	 <!-- <div class="login" style="margin-top:-80px">
  	<h1 class="login-header">Register/<a style="text-decoration:none;font-size:15px;" href="/dbms/login">Log-In</a></h1> -->
<%-- 		<form:form name='loginForm' action="/dbms/register" modelAttribute="user" method="post" class="login-container">

			<p><form:input type="text" placeholder="Username" name="username" title="username" path="username"/><form:errors path="username" /></p>
			<p><form:input type="password" placeholder="Password" name='password' title="password" path="username"/><form:errors path="password" /></p>
			<p><form:input type="password" placeholder="Confirm Password" name='mpassword' title="mpassword" path="mpassword"/><form:errors path="mpassword" /></p>
			<p><form:input type="text" placeholder="Name" name="name" title="name" path="name"/><form:errors path="name" /></p>
			<p><form:input type="text" placeholder="Address" name="address" title="address" path="address"/><form:errors path="address" /></p>
			<p><form:input type="text" placeholder="PIN" name="pin" title="pin" path="pin"/><form:errors path="pin" /></p>
			<p><form:input type="text" placeholder="City" name="city" title="city" path="city"/><form:errors path="city" /></p>
			<p><form:input type="text" placeholder="PAN" name="pan" title="pan" path="pan"/><form:errors path="pan" /></p>
			<p><form:input type="text" placeholder="Phone" name="phone" title="phone" path="phone"/><form:errors path="phone" /></p>
			<p><form:input type="text" placeholder="Mail" name="mail" title="mail" path="mail"/><form:errors path="mail" /></p>
			<p><input type="submit" value="Register"></p>
			${error}
		</form:form>
		
	</div> --%>

	<%-- <form:form method="post" modelAttribute="user" action="/dbms/register">
		<table>
		
		<tr><td>
		Username</td><td>
		<form:input required="true" path="username" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="username" /></td></tr>
		
		<tr><td>
		Password</td><td>
		<form:input required="true" path="password" type="password" /> </td><!-- bind to user.name-->
		<td><form:errors path="password" /></td></tr>
		
		<tr><td>Confirm Password</td>
		<td>
		<form:input required="true" path="mpassword" type="password" /> </td><!-- bind to user.name-->
		<td><form:errors path="mpassword" /></td></tr>
		
		<tr><td>Name</td>
		<td>
		<form:input required="true" path="name" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="name" /></td></tr>
		
		<tr><td>Address</td>
		<td>
		<form:input required="true" path="address" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="address" /></td></tr>
		
		<tr><td>PIN</td>
		<td>
		<form:input required="true" path="pin" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="pin" /></td></tr>
		
		<tr><td>City</td>
		<td>
		<form:input required="true" path="city" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="city" /></td></tr>
		<tr>
		
		<tr><td>Phone</td>
		<td>
		<form:input required="true" path="phone" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="phone" /></td></tr>
		<tr>
		<tr><td>Mail</td>
		<td>
		<form:input required="true" path="mail" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="mail" /></td></tr>
		<tr>
			<td><input type="submit" value="Submit" /></td>
			</tr>
		<tr><td></td></tr>
		</table>
	</form:form>
	</div> --%>
	
	<div class="signup-form">
    <form:form action="/dbms/register" modelAttribute="user" method="post">
		<h2 style="text-align:center">Register</h2>
        <div class="form-group">
        	<form:input type="text" path="username" class="form-control" name="username" placeholder="Username" required="required"/>
        </div>
        <div class="form-group">
        	<form:input type="email" path="mail" class="form-control" name="email" placeholder="Email Address" required="required"/>
        </div>
		<div class="form-group">
            <form:input type="password" path="password" class="form-control" name="password" placeholder="Password" required="required"/>
        </div>
		<div class="form-group">
            <form:input type="password" path="mpassword" class="form-control" name="confirm_password" placeholder="Confirm Password" required="required"/>
        </div>
        <div class="form-group">
            <form:input type="text" path="name" class="form-control" name="name" placeholder="Name" required="required"/>
        </div>
         <div class="form-group">
            <form:input type="text" path="address" class="form-control" name="address" placeholder="Address" required="required"/>
        </div>
         <div class="form-group">
            <form:input type="text" path="pin" class="form-control" name="pin" placeholder="Pin" required="required"/>
        </div>
         <div class="form-group">
            <form:input type="text" path="city" class="form-control" name="city" placeholder="City" required="required"/>
        </div>
         <div class="form-group">
            <form:input type="text" path="phone" class="form-control" name="phone" placeholder="Phone" required="required"/>
        </div>        
                
		<div class="form-group" style="margin-top:20px">
            <button type="submit" class="btn btn-primary btn-lg">Sign Up</button>
        </div>
        <form:errors path="username" />
        <form:errors path="password" />
        <form:errors path="mpassword" />
        <form:errors path="mail" />
        <form:errors path="pin" />
        <form:errors path="city" />
        <form:errors path="address" />
        <form:errors path="phone" />
        <p style="text-align:center; color:red">${error}</p>
    </form:form>
	<div class="text-center">Already have an account? <a href="/dbms/login">Login here</a></div>
</div>
	
	
	
	
</body>