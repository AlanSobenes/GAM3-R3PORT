<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<meta charset="ISO-8859-1">

<title>GAM3 R3PORT</title>
</head>
<body >
	<img src="https://wallpaperaccess.com/full/130544.jpg" alt="background" style="height:100%; width:100%"/>
	<div class="d-flex justify-content-around" style="margin-top:-60%">
	
		<div style="width:75% ">
			<img src="/pix/logotext.png" alt="logo" style="width:400px;margin-left:40%" />
			<img  src="https://wallpaperaccess.com/full/319195.jpg" alt="gamerbanner" style="width:100%;height:95%; margin-right:0px ; border-radius:1%" />
			<div style="text-align:center; margin-top:px">
		</div>
		
		</div>
			 <div style="margin-top:10%">
			    <h4 style="color:lime">Sign In</h4>
			    <div class="shadow-lg p-3 mb-5 bg-body rounded">	
			    	<form:form action="/login" method="post" modelAttribute="newLogin">
				        <div class="form-group">
				        	<form:errors path="*"  class="text-danger"/>
				        	<br/>
				            <label style="color:lime">Email:</label>
				            <form:input path="email" class="form-control" />
				        </div>
				        <div class="form-group">
				            <label style="color:lime">Password:</label>
				            <form:password path="password" class="form-control" />
				        </div>
				        <input type="submit" value="Login" class="btn btn-success" />
			    	</form:form>
			    	<br />
			    	<p style="color:orange">Not a member? Click <a href="/letsRegister">Here</a> to Register</p>
				</div>
			</div>
	</div>

</body>
</html>