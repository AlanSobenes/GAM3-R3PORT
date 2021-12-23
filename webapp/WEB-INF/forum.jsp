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
<body>
	<div  style="background-image: url('https://wallpaperaccess.com/full/5327327.jpg');height:100%" >
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
			<h4 class="text-info shadow p-3 mb-5 bg-body rounded"> Welcome To The <span class="text-warning">GAM3 R3PORT</span> Community</h4>

		</div>
			
		<div class="d-flex">
			<div  class="shadow p-3 mb-5 bg-body rounded" style="height: 500px; width:220px;  margin-top: 200px; margin-left:5%;margin-right:5px">			
				<br />
				<br />
				<c:if test="${!comments.isEmpty() }">
					<a style="margin-left:35px" href="/addComment"><button class="btn btn-primary">Add a Comment</button></a>
				</c:if>
				<br />
				<br />
				
				<ul>
					<li style="list-style:none"><a href="/new/pc">Newest Games</a></li>
					<li style="list-style:none"><a href="/best/pc">Best Games</a></li>
					<li style="list-style:none"><a href="/forum">Forum</a></li>
				</ul>
				
				
			</div>
		<div style="margin-left:10%;margin-right:15%;margin-top:8%; width: 40%">
		<c:if test="${!comments.isEmpty() }">
		
				<c:forEach items="${comments }" var="comment">
					<div style=" margin-left:10%;margin-right:15%;margin-top:12%;height:200px;width:100% " class="shadow-lg p-3 mb-5 bg-body rounded" >
						<div style="margin-left:10%;margin-top:5%">
							<h6 class="text-warning">Game: <span class="text-info"><a href="/search/${comment.game.trim() }"><c:out value="${comment.game }"/></a></span></h6>
							<h6 class="text-warning">Comment: <span class="text-info"><c:out value="${comment.content }"/></span></h6>
							<h6 class="text-warning">User: <span class="text-info"><c:out value="${comment.user.userName }"/></span></h6>
							<c:if test="${comment.user.id == user.id }">
								<br />
								<div style="display:flex">
									<a style="margin-left:35px; margin-right:10px" href="/${comment.id }/editComment"><button class="btn btn-outline-warning">edit</button></a>
									<form action="/${comment.id }/delete" method="post">
									    	<input type="hidden" name="_method" value="delete">
									    	<input type="submit" value="Delete" class="btn btn-outline-danger">
									</form>
									<h6 class="text-primary" style="margin-left:20px; margin-top: 10px">Likes <c:out value="${comment.likes.size() }"/></h6>
								</div>
							</c:if>
							<c:if test="${comment.user.id != user.id }">
								<c:forEach items="${comment.likes }" var="like">
									<c:choose>
										<c:when test="${user.likes.contains(like)}">
										<div style="display:flex">
											<form action="/${like.id }/unlike" method="post">
												<input type="hidden" name="_method" value="delete">
												<button class="btn btn-primary">UnLike</button>
											</form>
											<h6 class="text-primary" style="margin-left:20px ; margin-top: 10px">Likes <c:out value="${comment.likes.size() }"/></h6>
											</div>
										</c:when>
									</c:choose>
								</c:forEach>
								<c:forEach items="${comment.likes }" var="like">
								<c:set var="isLiked" value="true"></c:set>
									<c:choose>
										<c:when test="${user.likes.contains(like) }">
											<c:set var="isLiked" value="false"></c:set>
									</c:when>
								</c:choose>
								</c:forEach>
								<c:if test="${isLiked||comment.likes.isEmpty()}">
								<div style="display:flex">
									<form:form action="/like" method="post" modelAttribute="like">
										<form:input type="hidden" path="user" value="${user.id }"/>
										<form:input type="hidden" path="comment" value="${comment.id }"/>
										<button class="btn btn-primary">Like</button>
									</form:form>
									<h6 class="text-primary" style="margin-left:20px; margin-top: 10px">Likes <c:out value="${comment.likes.size() }"/></h6>
									</div>
								</c:if>
							</c:if>
						</div>
					</div>
				</c:forEach>
		</c:if>
		<c:if test="${comments.isEmpty() }">
			<div style=" margin-left:10%;margin-right:15%;margin-top:12%" class="shadow-lg p-3 mb-5 bg-body rounded">
				<h4 class="text-danger">No Comments in the Forum at this time</h4>
				<a href="/addComment"><button class="btn btn-primary">add a comment</button></a>
			</div>
		</c:if>
		</div>	
	</div>
</div>

</body>
</html>