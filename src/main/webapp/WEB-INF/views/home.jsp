<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
<script type="text/javascript">
 $(document).ready(function(){
	 loadBoard();
 });

 function loadBoard(){
	 $.ajax({
		 url: "boardList",
		 type: "get",
		 dataType: "json",
		 success: make,
		 error: function(){
			 alert("error");
		 }
	 });
 }
 
function make(data){
	
	var li="<table class='table table-bordered'>";
	li+="<tr>";
	li+="<td>글번호</td>";
	li+="<td>제목</td>";
	li+="<td>글쓴이</td>";
	li+="<td>작성일</td>";
	li+="<td>조회수</td>";
	li+="</tr>";
	
	$.each(data, function(index,obj){ //obj={"idx":1, "title":"제목1"...}
		li+="<tr>";
		li+="<td>"+obj.idx+"</td>";
		li+="<td>"+obj.title+"</td>";
		li+="<td>"+obj.writer+"</td>";
		li+="<td>"+obj.indate+"</td>";
		li+="<td>"+obj.count+"</td>";
		li+="</tr>";
	});
	
	li+="</table>";
	$("#view").html(li);
	
}
</script>
</head>
<body>
	<div class="container">
		<h2>Spring Legacy</h2>
		<div class="panel panel-default">
			<div class="panel-heading">게시판</div>
			<div class="panel-body" id="view">본문</div>
			<div class="panel-footer">비트캠프</div>
		</div>
	</div>
</body>
</html>