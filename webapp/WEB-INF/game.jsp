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
	
		<div  style="background-image: url('https://wallpaperaccess.com/full/5327327.jpg');height:10000px" >
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
			<h4 class="text-info"><c:out value="${game.game_name}"/></h4>
		</div>
		<div class="d-flex">
			<div  class="shadow p-3 mb-5 bg-body rounded" style="height: 500px; width:15%;  margin-top: 200px; margin-left:5%">			
				
				
				<br />
				<br />
				<ul>
					<li style="list-style:none"><a href="/new/pc">Newest Games</a></li>
					<li style="list-style:none"><a href="/best/pc">Best Games</a></li>
					<li style="list-style:none"><a href="/forum">Forum</a></li>
				</ul>
			</div>
					<div style="margin-top:15%; margin-left:15%; display:flex" class="shadow-lg p-3 mb-5 bg-body rounded">
					<div>
						<img src="${game.box_art }" alt="box art" style="width:200px; height:250px"/>
						<h6 class="text-info"><c:out value="${game.platform}"/></h6>
					</div>
					<div style="margin-left:15px">
						<h5 class="text-danger">Release Date: <span class="text-info"><c:out value="${game.release_date }"/></span></h5>
						<h5 class="text-warning">Developer: <span class="text-info"><c:out value="${game.developer }"/></span></h5>
						<h5 class="text-warning">Game Themes: <span class="text-info"><c:out  value="${game.game_themes }"/>   </span></h5>
						
						
						
						<c:if test="${game.total_gamer_count != null }">
							<h5 class="text-warning">Total Gamer Count:<span class="text-info"> <c:out value="${game.total_gamer_count }"></c:out></span></h5>
						</c:if>
						<c:if test="${game.total_gamer_count == null }">
							<h5 class="text-warning">Total Gamer Count: <span class="text-danger"> Not available </span></h5>
						</c:if >
						
						<c:if test="${game.playscore != null }">
							<h5 class="text-warning">Play Score: <span class="text-info"><c:out value="${game.criticscore }"/></span></h5>
						</c:if>
						<c:if test="${game.playscore == null }">
								<h5 class="text-warning">Play Score: <span class="text-danger">Not available</span></h5>
						</c:if>
						
						<c:if test="${game.criticscore != null }">
							<h5 class="text-warning">Critic Score: <span class="text-info"><c:out value="${game.criticscore }"/></span></h5>
						</c:if>
						<c:if test="${game.criticscore == null }">
								<h5 class="text-warning">Critic Score: <span class="text-danger">Not available</span></h5>
						</c:if>
						
						<c:if test="${game.gamerscore != null }">
							<h5 class="text-warning">Game Score: <span class="text-info"><c:out value="${game.gamerscore }"/></span></h5>
						</c:if>
						<c:if test="${game.gamerscore == null }">
							<h5 class="text-warning">Game Score: <span class="text-danger">Not available</span></h5>
						</c:if>
					</div>
					</div>
		</div>	
		<div style=" margin-left:10%;margin-right:10%" class="shadow-lg p-3 mb-5 bg-body rounded">
	<h4 class="text-info">GAME REVIEW</h4>
	<c:if test="${!reviews.isEmpty() }">
		<c:forEach items="${ reviews }" var="critic">
			<div class="shadow-lg p-3 mb-5 bg-body rounded">
				<h5 class="text-warning"> <span class="text-info">Review: </span> <c:out value="${critic.quote }"/></h5>
				<h5 class="text-warning"> <span class="text-info">Author: </span> <c:out value="${critic.author }"/></h5>
				<h5 class="text-warning"> <span class="text-info">Published: </span> <c:out value="${critic.date_published}"/></h5>
				<h5 class="text-warning"> <span class="text-info">Publication: </span> <c:out value="${critic.publication }"/></h5>	
			</div>
		</c:forEach>	
	</c:if>
	<c:if test="${reviews.isEmpty() }">
		<h4 class="text-danger">No Official Game Reviews at this time</h4>
	</c:if>
	</div>
	
	
		</div>
</body>
</html>