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
<script type="text/javascript">
$(document).ready(function(){
	
	if(${!empty msg1}){
		$("#msgType").attr("class","modal-content panel-warning");
		$("#failModal").modal("show");
	}	
});
</script>
</head>

<body>
	<div class="container">
		<jsp:include page="../include/top.jsp" />
		<div class="panel panel-default">
			<div class="panel-heading">사진 등록</div>
			<div class="panel-body">
				<form action="${root }/memberImageUpdate?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
					<input type="hidden" name="memberID" value="${memberVo.memberID }">
					<table class='table table-bordered' style="text-align: center;">
						<tr>
							<td style="width: 100px; vertical-align: middle;">아이디</td>
							<td>${memberVo.memberID }</td>
						</tr>

						<tr>
							<td style="width: 100px; vertical-align: middle;" />사진 업로드
							</td>
							<td colspan="2">
								<span class="btn btn-default">사진 업로드
									<input type="file" name="memberProfile"/>
								</span>
							</td>
						</tr>

						<tr>
							<td colspan="2"><input type="submit"
								class="btn btn-primary btn-sm pull-right" value="사진 등록"></td>
						</tr>
					</table>
					
				</form>
			</div>
			
		<!--모달-->
			<div class="modal fade" id="failModal" role="dialog">
				<div class="modal-dialog">
					<div class="modal-content" id="msgType">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h3>${msg1 }</h3>
						</div>
						<div class="modal-body">
							<p>${msg2 }</p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
</body>
</html>
