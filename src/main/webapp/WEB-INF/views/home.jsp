<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<jsp:include page="include/top.jsp" />
		<div class="panel panel-default">
			<div class="panel-body">
				<ul class="nav nav-tabs">
					<li class="active"><a data-toggle="tab" href="#home">Home</a></li>
					<li><a href="MainBoard">게시판</a></li>
					<li><a href="#" data-toggle="tab" >공지</a></li>
				</ul>
				
				<div class="tab-content">
					 <div class="tab-pane fade show active" id="home">
					 	<h4>Home</h4>
					 	<p>content</p>
					 </div>
					 
					 <div class="tab-pane fade" id="home1">
					 	<h4>게시판</h4>
					 	<p>content</p>
					 </div>
					 
					 <div class="tab-pane fade" id="home2">
					 	<h4>공지</h4>
					 	<p>content</p>
					 </div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>












