<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
 <%@ page isErrorPage="true" %> 
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>GAM3 R3PORT</title>
</head>
<body>
	<div  style="background-image: url('https://wallpaperaccess.com/full/5327327.jpg');height: 900px" >
		<div class="d-flex justify-content-between" style="align-items:start;background-color:black">
		<div class="d-flex justify-content" style="align-items:start">
			<a href="/home" style="margrin-right:30px"><img src="/pix/logotext.png" alt="logo" style="width:150px; border-radius:3%;margin-right:10%;margin-left:10%;margin-top:5px"/></a>
		
			<h6 style="color:white;margin-left:30px;margin-top:15px" >Welcome, <c:out value="${user.userName }"/></h6>
		</div>
		<div style="margin-top:10px; margin-bottom:5px">
			<form action="/search" method="post">
				<label for="search" style="color:orange">Find a game</label>
				 <input type="text" name="gameSearch" class="search" placeholder="Search here!">
				<button style="background-color:#32CD32; border-radius:50px;margin-left:5px">Go!</button>
			</form>
		</div>
		<div style="margin-right:5%">
			<a href="/logout"><button class="btn btn-primary" style="margin-top:5px; margin-bottom:5px">Logout</button></a>
		</div>
		</div  >
		<div class="d-flex justify-content-center" style="margin-bottom:-150px; margin-top:30px">	
			<h4 class="text-info shadow p-3 mb-5 bg-body rounded"><span class="text-warning"><c:out value="${user.userName }"/></span> edit your comment</h4>

		</div>
			
		<div class="d-flex">
			<div  class="shadow p-3 mb-5 bg-body rounded" style="height: 500px; width:220px;  margin-top: 200px; margin-left:5%;margin-right:5px">			
				
				
				<br />
				<br />
				
				
				<ul>
					<li style="list-style:none"><a href="/new/pc">Newest Games</a></li>
					<li style="list-style:none"><a href="/best/pc">Best Games</a></li>
					<li style="list-style:none"><a href="/forum">Forum</a></li>
				</ul>
				
				
			</div>
			<div class="shadow-lg p-3 mb-5 bg-body rounded" style="width: 30%;margin-left:15%;margin-right:15%;margin-top:12%">
			
			
			<div class="form-group"  >
			
			<form:form action="/${comment.id}/edit" method="post" modelAttribute="comment">
				<input type="hidden" name="_method" value="put" />
			  	<form:input type="hidden" path="user" value="${user.id }" /> 
			  
				<p>
			       <form:label path="game" class="text-info">GAME NAME</form:label>
			       <form:errors path="game" class="text-danger"/>
			       <form:input path="game" class="form-control"/>
			   </p>
			   <p>
			       <form:label path="content" class="text-info">COMMENT</form:label>
			       <form:errors path="content" class="text-danger"/>
			       <form:textarea path="content" class="form-control"/>
			   </p>
			 
			   <p style="display:flex; justify-content:center">
			   		<button  class="btn btn-outline-info">Edit</button>
			   </p>
			   
			</form:form> 
		</div>  
		</div> 
		</div>	
		
	</div>

</body>
</html>