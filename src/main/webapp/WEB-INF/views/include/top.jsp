<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
		   uri="http://www.springframework.org/security/tags"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<c:set var="memberVo"
	   value="${SPRING_SECURITY_CONTEXT.authentication.principal }" />
<c:set var="auth"
	   value="${SPRING_SECURITY_CONTEXT.authentication.authorities }" />

<script>
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";

	function logout(){
		$.ajax({
			url: "${root}/logout",
			type: "post",
			beforeSend: function(xhr){
				xhr.setRequestHeader(csrfHeaderName,csrfTokenValue)
			},
			success: function(){
				location.href="${root}/";
			},
			error: function(){
				alert("error");
			}
		});
	}
</script>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	<div class="container-fluid">
		<div class="navbar-header">
			<button class="navbar-toggle" type="button" data-toggle="collapse"
					data-target="#Navbar">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="${root }/">SPRING LEGACY BOARD</a>
		</div>

		<div class="collapse navbar-collapse" id="Navbar">
			<ul class="nav navbar-nav">
				<li><a href="MainBoard">게시판</a></li>
			</ul>


			<security:authorize access="isAnonymous()">
				<!-- 권한이 없는 익명 사용자일 경우 -->
				<ul class="nav navbar-nav navbar-right">
					<li><a href="${root }/memberLoginForm"> <span
							class="glyphicon glyphicon-heart">로그인</span>
					</a></li>

					<li><a href="${root }/memberJoin"> <span
							class="glyphicon glyphicon-user">회원가입</span>
					</a></li>
				</ul>
			</security:authorize>

			<security:authorize access="isAuthenticated()">
				<!-- 로그인 인증을 받은 경우  -->
				<ul class="nav navbar-nav navbar-right">
					<li><a href="${root }/memberUpdateForm"> <span
							class="glyphicon glyphicon-check">회원수정</span></a></li>
					<li><a href="${root }/memberImageForm"> <span
							class="glyphicon glyphicon-picture">사진</span>
					</a></li>
					<li><a href="javascript:logout()"><span
							class="glyphicon glyphicon-log-out">로그아웃</span>
					</a></li>
					<!-- 시큐리티에서 로그아웃은 get방식으로 가지 않는다 -->
					<c:if test="${empty memberVo.member.memberProfile }">
					<li><img src="${root }/resources/images/empty_profile.png"
							 style="width: 50px; height: 50px; border-radius: 25%; border: none;" /> ${memberVo.member.memberName}님
						</c:if>

						<c:if test="${!empty memberVo.member.memberProfile }">
					<li><img
							src="${root }/resources/upload/${memberVo.member.memberProfile}"
							style="width: 50px; height: 50px;border-radius: 25%; border: none;" />
						</c:if>
							${memberVo.member.memberName}  <!-- 해당권한이 있을경우 -->
						<security:authorize access="hasRole('ROLE_USER')">
							일반회원
						</security:authorize>
						<security:authorize access="hasRole('ROLE_MANAGER')">
							매니저
						</security:authorize>
						<security:authorize access="hasRole('ROLE_ADMIN')">
							관리자
						</security:authorize>
					</li>
						<%-- <c:forEach
                                        var="authVo" items="${memberVo.authLi }">
                                        <c:if test="${authVo.auth eq 'ROLE_USER' }">일반회원</c:if>
                                        <c:if test="${authVo.auth eq 'ROLE_MANAGER' }">매니저</c:if>
                                        <c:if test="${authVo.auth eq 'ROLE_ADMIN' }">관리자</c:if>

                                            안녕하세요~</li>
                                </c:forEach> --%>

				</ul>
			</security:authorize>
		</div>
	</div>
</nav>