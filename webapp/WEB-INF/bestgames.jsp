<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>GAM3 R3PORT</title>
</head>
<body>
		<div  style="background-image: url('https://wallpaperaccess.com/full/5327327.jpg')" >
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
			<h4 class="text-info shadow p-3 mb-5 bg-body rounded" > Best Games On <span class="text-warning"><c:out value="${platform }"/></span></h4>

		</div>
			
		<div class="d-flex">
			<div  class="shadow p-3 mb-5 bg-body rounded" style="height: 500px; width:220px;  margin-top: 200px; margin-left:5%;margin-right:5px">				
				<h5 class="text-warning">Find The Best Games by Platform</h5>
			<form action="/bestgames" method="post">
				<div style="display:flex">
					<select class="form-select" name="best" aria-label="Default select example">
			 		 <option selected>Find!</option>
			 		  <option value="3ds">3DS</option>
					  <option value="pc">PC</option>
					  <option value="ps3">PS3</option>
					  <option value="ps4">PS4</option>
					  <option value="ps5">PS5</option>
					  <option value="xbox-360">XBOX 360</option>
					  <option value="xbox-one">XBOX One</option>
					  <option value="xbox-series-x">XBOX Series X</option>
					  <option value="switch">Switch</option>
					  <option value="android">Android</option>
					  <option value="ios">iOS</option>		  
				</select>
					<button style="background-color:#32CD32; border-radius:50px;margin-left:5px">Go!</button>
				</div>
				</form>
				
				
				<br />
				<br />
				
				
				<ul>
					<li style="list-style:none"><a href="/new/pc">Newest Games</a></li>
					<li style="list-style:none"><a href="/best/pc">Best Games</a></li>
					<li style="list-style:none"><a href="/forum">Forum</a></li>
				</ul>
				
				
			</div>
			<div class="d-flex flex-wrap" style="margin-top:200px">
				<c:forEach items="${games}" var="game">
					<div style="width:250px;margin:5px; text-align: center" class="shadow-lg p-3 mb-5 bg-body rounded">
						
						<h6 class="text-info"><a href="/game/<c:out value='${game.game_id }'/>"><c:out value="${game.game_name}"/></a></h6>
						<h6>GameScore: <c:out value="${game.gamerscore }"/></h6>
					 		<a href="/game/<c:out value='${game.game_id }'/>"><img src="${game.box_art }" alt="box art" style="width:150px; height:200px"/></a>
					 	<p class="text-danger">Release Date: <span class="text-warning"> <c:out value="${game.release_date }"/></span></p>
					 	
					</div>
				</c:forEach>
			</div>
		</div>	
	</div>

</body>
</html>