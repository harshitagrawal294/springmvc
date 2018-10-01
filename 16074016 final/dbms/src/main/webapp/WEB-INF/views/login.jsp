<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 

<head>
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
		margin-top:100px;
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
<body onload='document.loginForm.j_username.focus();'>
	
<%-- 
	<div class="login">
  	<h1 class="login-header">Log-in</h1>
		<form name='loginForm' action="/dbms/login" method='POST' class="login-container">
			<%
		String errorString = (String) request.getAttribute("error");
		if (errorString != null && errorString.trim().equals("true")) {
			out.println("<span class=\"errorblock\">Incorrect username / password. Please try again");
		}
	%>

			<p><input type="text" placeholder="Username" name='username' title="username"></p>
			<p><input type="password" placeholder="Password" name='password' title="password"></p>
			<p><input type="submit" value="Log in"><input type="reset" value="Reset"></p>
		
			<p style="text-align:center"><a  href="<c:url value="/register" />"> Register Here</a></p>
		</form>
		
	</div> --%>
	
	<div class="signup-form">
    <form action="/dbms/login" method="post">
		<h2 style="text-align:center">Login</h2>
		<%
		String errorString = (String) request.getAttribute("error");
		if (errorString != null && errorString.trim().equals("true")) {
			out.println("<span class=\"errorblock\">Incorrect username / password. Try again");
		}
	%>
		
        <div class="form-group">
        	<input type="text" path="username" class="form-control" name="username" placeholder="Username" required="required"/>
        </div>
		<div class="form-group">
            <input type="password"  class="form-control" name="password" placeholder="Password" required="required"/>
        </div>
		<!-- <div class="form-group">
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
            <form:input type="text" path="phone" class="form-control" name="phone" placeholder="Address" required="required"/>
        </div>         -->
                
		<div style="display:inline-block;margin-top:20px">
            <button type="submit" class="btn btn-primary btn-lg" >Login</button>
             <!-- <button type="reset" class="btn btn-primary btn-lg">Reset</button> -->
        </div>
        <%-- <p style="text-align:center; color:red">${error}</p> --%>
    </form>
	<div class="text-center">New account? <a href="/dbms/register">Register</a></div>
</div>
	
	
</body>
</html>