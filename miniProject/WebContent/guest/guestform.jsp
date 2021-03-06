<%@page import="data.dao.GuestDao"%>
<%@page import="data.dto.GuestDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	span.camera{
		cursor: pointer;
		margin-left: 10px;
		font-size: 22px;
	}
	
	#showimg{
		position: absolute;
		left: 600px;
		max-width: 150px;
	}
</style>
<script type="text/javascript">
$(function(){
	$("span.camera").click(function(){
		// #photo의 클릭 이벤트 강제발생
		$("#photo").trigger('click');
	});
});

function readUrl(input){
	if(input.files[0]){
		var reader = new FileReader();
		reader.onload = function(e){
			$("#showimg").attr("src",e.target.result);
		}
		reader.readAsDataURL(input.files[0]);
	}
}
</script>
</head>
<body>
<%
	// 세션으로부터 로그인한 사람의 아이디 얻기
	String id = (String)session.getAttribute("myid");
	// 로그인한 상태인지 세션을 얻는다.
	String loginok = (String)session.getAttribute("loginok"); 
	if(loginok!=null){
		%>
		<img id="showimg">
		
		<form action='guest/guestaction.jsp' method="post"
		enctype="multipart/form-data">
			<input type="hidden" name="myid" value="<%=id%>">
			<table class="table table-bordered" style="width: 600px;">
				<caption><H4>회원 방명록(<%=id %>)</H4></caption>
				<tr height="150">
					<td>
						<b>사진을 선택해주세요(1개만 가능)</b>
						<span class="camera glyphicon glyphicon-camera"></span>
						<input type="file" name="photo" id="photo"
						style="display: none;" onchange="readUrl(this)">
						<br>
						<textarea name="content" style="width: 400px; height: 130px;"
						required="required"></textarea>
						
						<button type="submit" class="btn btn-default"
						style="float: right; width: 80px; height: 100px;">저장</button>
					</td>
				</tr>
			</table>
		</form>
		<%
	}else{
		%>
		<b>방명록을 작성하려면 먼저 로그인을 해주세요</b>
		<%
	}
%>
</body>
</html>