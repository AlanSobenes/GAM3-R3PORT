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
<body style="background-image: url('https://wallpaperaccess.com/full/403150.jpg');height:100%;width:100%" >
	<div style="background-image: url('https://wallpaperaccess.com/full/403250.jpg');width:1200px;height:700px; margin-left:10%;margin-top:90px">
	<a href="/"><button class="btn btn-warning" style="margin-top:5px ;margin-left:5%">Go Back</button></a>
		<div class="container"  >
			<div style="width:500px;margin-top:90px">
				<h4 style="color:#00bfff">Register</h4>
				<div class="shadow-lg p-3 mb-5 bg-body rounded" >
					<form:form action="/register" method="post" modelAttribute="newUser">
					        <div class="form-group">
					            <label style="color:#00bfff">UserName:</label>
					            <form:input path="userName" class="form-control" />
					            <form:errors path="userName" class="text-danger" />
					        </div>
					        <div class="form-group">
					            <label style="color:#00bfff">Email:</label>
					            <form:input path="email" class="form-control" />
					            <form:errors path="email" class="text-danger" />
					        </div>
					        <div class="form-group">
					            <label style="color:#00bfff">Password:</label>
					            <form:password path="password" class="form-control" />
					            <form:errors path="password" class="text-danger" />
					        </div>
					        <div class="form-group">
					            <label style="color:#00bfff">Confirm Password:</label>
					            <form:password path="confirm" class="form-control" />
					            <form:errors path="confirm" class="text-danger" />
					        </div>
					        <input type="submit" value="Register" class="btn btn-primary" />
					</form:form>
				</div>
			</div>
	
	
	</div>







	</div>
	
	

</body>
</html>