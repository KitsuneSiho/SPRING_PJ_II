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

function doubleCheck(){
	
	let memberID=$("#memberID").val();  //폼에서 적은 id값 가져오기
	
	$.ajax({
		url: "${root}/memberRegisterCheck",
		type: "get",
		data: {"memberID":memberID},
		
		success: function(result){
			if(result==1){
				$("#checkMessage").html('사용할 수 있는 아이디입니다');
			}
			else{
				$("#checkMessage").html('사용할 수 없는 아이디입니다');
			}
			$("#exampleModal").modal("show");
		},
		
		error: function(){
			alert("error");
		}
	});
}

function goInsert(){
	
	let memberAge=$("#memberAge").val();
	if(memberAge==0 || memberAge==""){
		alert("나이 입력하세요!");
		return false;
	}
	document.frm.submit();  //서버에 전송
}

function passwordCheck(){
	
	let memberPw1=$("#memberPw1").val();
	let memberPw2=$("#memberPw2").val();
	
	if(memberPw1 != memberPw2){
		$("#passMessage").html("비밀번호가 일치하지 않습니다");
	}
	else{   //(비번, 비번확인이 일치한다면)
		$("#passMessage").html("비밀번호가 일치합니다").css("color", "yellowgreen");
		$("#memberPw").val(memberPw1); //히든 value값에 비번 넣음
		
	}
}

</script>
</head>
<body>
	<div class="container">
		<jsp:include page="../include/top.jsp" />
		<div class="panel panel-default">
			<div class="panel-heading">회원가입</div>
			<div class="panel-body">
				<form name="frm" action="${root }/memberRegister" method="post">
					<input type="hidden" id="memberPw" name="memberPw" value="" />
					<table class='table table-bordered' style="text-align: center;">
						<tr>
							<td style="width: 100px; vertical-align: middle;">아이디</td>
							<td><input type="text" class="form-control" id="memberID"
								name="memberID" placeholder="아이디 입력" /></td>
							<td><button class="btn btn-success btn-sm" type="button"
									onclick="doubleCheck()">중복확인</button></td>
						</tr>

						<tr>
							<td style="width: 100px; vertical-align: middle;" />비밀번호
							</td>
							<td colspan="2"><input class="form-control" type="password"
								id="memberPw1" name="memberPw1" onkeyup="passwordCheck()"
								placeholder="비밀번호를 입력" /></td>
						</tr>

						<tr>
							<td style="width: 100px; vertical-align: middle;" />비밀번호확인
							</td>
							<td colspan="2"><input class="form-control" type="password"
								id="memberPw2" name="memberPw2" onkeyup="passwordCheck()"
								placeholder="비밀번호 확인" /></td>
						</tr>

						<tr>
							<td style="width: 100px; vertical-align: middle;" />이름
							</td>
							<td colspan="2"><input class="form-control" type="text"
								id="memberName" name="memberName" placeholder="이름을 확인" /></td>
						</tr>

						<tr>
							<td style="width: 100px; vertical-align: middle;">나이</td>
							<td colspan="2"><input id="memberAge" name="memberAge"
								class="form-control" type="number" maxlength="10"
								placeholder="나이를 입력하세요." /></td>
						</tr>

						<tr>
							<td style="width: 100px; vertical-align: middle;">성별</td>
							<td colspan="2">
								<div class="form-group"
									style="text-align: center; margin: 0 auto;">
									<input type="radio" name="memberGender" autocomplete="off"
										value="남자" checked />남자 <input type="radio"
										name="memberGender" autocomplete="off" value="여자" />여자
								</div>
							</td>
						</tr>

						<tr>
							<td style="width: 100px; vertical-align: middle;">이메일</td>
							<td colspan="2"><input id="memberEmail" name="memberEmail"
								class="form-control" type="text" maxlength="20"
								placeholder="이메일을 입력하세요." /></td>
						</tr>
						
						<tr>
							<td style="width: 100px; vertical-align: middle;">권한</td>
								<td colspan="2">
								<input type="checkbox" name="authLi[0].auth" value="ROLE_USER">USER
								<input type="checkbox" name="authLi[1].auth" value="ROLE_MANAGER">MANAGER
								<input type="checkbox" name="authLi[2].auth" value="ROLE_ADMIN">ADMIN
								
								
						</tr>

						<tr>
							<td colspan="3" style="text-align: left;"><span
								id="passMessage" style="color: red"></span><input type="button"
								class="btn btn-primary btn-sm pull-right" value="등록"
								onclick="goInsert()" /></td>

						</tr>

					</table>
					<!-- parameterName에 token값(value)을 저장 -->
					<input type="hidden" name="${_csrf.parameterName }" 
					 value="${_csrf.token }"/>
					 
					
				</form>
			</div>
				
				<!-- 모달 -->
			<div class="modal fade" id="exampleModal" role="dialog">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h3>메시지 확인</h3>
						</div>
						<div class="modal-body">
							<p id="checkMessage"></p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>
			
			<!-- 실패 -->
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