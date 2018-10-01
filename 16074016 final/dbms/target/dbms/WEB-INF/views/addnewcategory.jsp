<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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


<jsp:include page="adminbase.jsp" />
	<%-- <br>
	<form:form method="post" modelAttribute="category" action="/dbms/admin/addnewcategory/">
		<table>
		
		<tr><td>
		Category Name</td><td>
		<form:input path="categoryname" type="text" /> </td>
		<td><form:errors path="categoryname" /></td></tr>
		<tr><td>
		Category Description</td><td>
		<form:input path="categorydescription" type="text" /> </td>
		<td><form:errors path="categorydescription" /></td></tr>
			<tr>
			<td><input type="submit" value="Submit" /></td>
			</tr>
		<tr><td>${error}</td></tr>
		</table>
	</form:form>
	<a href="/dbms/admin/allcategories"> Back</a> --%>
	
	<br>
<a href="/dbms/admin/allcategories" style="font-size:15px;margin-left:40px">Back</a>

<div class="signup-form">
    <form:form action="/dbms/admin/addnewcategory/" modelAttribute="category" method="post">
		<h2 style="text-align:center">Add Category</h2>
		
        <div class="form-group">
        	<form:input type="text" path="categoryname" class="form-control" name="categoryname" placeholder="Name" required="required"/>
        </div>
        
        <div class="form-group">
            <form:input type="text" path="categorydescription" class="form-control" name="categorydescription" placeholder="Description" required="required"/>
        </div>  
		
<%--         <div class="form-group">
            <form:input type="text" path="employeesalary" class="form-control" name="employeesalary" placeholder="Salary" required="required"/>
        </div>
         <div class="form-group">
            <form:input type="text" path="employeepassword" class="form-control" name="employeepassword" placeholder="Password" required="required"/>
        </div> --%>
               
                
		<div class="form-group" style="margin-top:20px">
            <button type="submit" class="btn btn-primary btn-lg">Add Category</button>
        </div>

        <p style="text-align:center; color:red">${error}</p>
    </form:form>
	<!-- <div class="text-center">Already have an account? <a href="/dbms/login">Login here</a></div> -->
</div>
	
	