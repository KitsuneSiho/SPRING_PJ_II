<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	<div class="container-fluid">
		<div class="navbar-header">
			<button class="navbar-toggle" type="button" data-toggle="collapse"
				data-target="#Navbar">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="${root }/">Spring Legacy</a>
		</div>

		<div class="collapse navbar-collapse" id="Navbar">
			<ul class="nav navbar-nav">
				<li><a href="MainBoard">게시판</a></li>
			</ul>


			<c:if test="${empty memberVo }">
				<!-- 회원정보 비어있을 경우 -->
				<ul class="nav navbar-nav">
					<li class="dropdown"><a class="dropdown-toggle" href="#"
						data-toggle="dropdown">클릭!</a>
						<ul class="dropdown-menu dropdown-menu-dark">
							<li><a class="dropdown-item" href="${root }/memberLoginForm">
								<span class="glyphicon glyphicon-heart">로그인</span> </a></li>
							<li><a class="dropdown-item" href="${root }/memberJoin">
								<span class="glyphicon glyphicon-user">회원가입</span>
							</a></li>
						</ul>
				</ul>
			</c:if>

			<c:if test="${!empty memberVo }">
				<ul class="nav navbar-nav">
					<li class="dropdown"><a class="dropdown-toggle" href="#"
						data-toggle="dropdown"> 클릭! </a>
						<ul class="dropdown-menu dropdown-menu-dark">
							<li><a class="dropdown-item" href="${root }/memberUpdateForm">
								<span class="glyphicon glyphicon-check">회원수정</span></a></li>
							<li><a class="dropdown-item" href="${root }/memberImageForm">
								<span class="glyphicon glyphicon-picture">사진</span></a></li>
							<li><a class="dropdown-item" href="${root }/memberLogout">
								<span class="glyphicon glyphicon-log-out">로그아웃</span>
							</a></li>
						</ul></li>
				</ul>
			</c:if>









		</div>
	</div>
</nav>