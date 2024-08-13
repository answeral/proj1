<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="/css/top.css" />
	<link rel="stylesheet" type="text/css" href="/css/login/findPw.css" />
	<link rel="stylesheet" type="text/css" href="/css/footer.css" />
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<title>HappyPawPet 비밀번호찾기</title>
	<script>
		$(function(){
			$(".sBtn").click(function(){
				alert("이메일을 발송했습니다.");
				findpwFrm.submit(); //form 형태로 controller로 입력값을 보냄

			});//폼 전송
		});
	</script>
	<script>
		if (${chkFind}==0){
			alert("해당 정보로 가입된 아이디가 없습니다.");
			location.href="/login/findId";
		}
	</script>
</head>
<body id="findForm">
<%@ include file="../top/top.jsp" %>
<!-- ------------------------------------------------------------------------- -->
<section>
	<div class="subbanner"></div>
	<div class="main">
		<h2>비밀번호 찾기</h2>
		<form action="/login/emailSend" name="findpwFrm" method="post">
			<input type="hidden" name="id" id="id" value="${mDto.id }">
			<fieldset class="fieldset_class">
				<dl id="id">
					<dt>찾은 아이디</dt>
					<dd>${mDto.id }</dd>
				</dl>
				<dl id="name_t">
					<div></div>
					<dt><label for="name">이름</label></dt>
					<dd><input type="text" name="name" id="name" value="${mDto.name }" readonly="readonly" required></dd>
				</dl>
				<dl id="email_t">
					<div></div>
					<dt><label for="email">이메일</label></dt>
					<dd><input type="text" name="email" id="email" value="${mDto.email }" required></dd>
				</dl>
				<dl id="pw_send">
					<dd id="color">비밀번호가 기억나지 않으세요?</dd>
					<dd><button type="button" class="sBtn">임시비밀번호 발급받기</button></dd>
				</dl>

			</fieldset>
		</form>
	</div>
</section>
<!-- ------------------------------------------------------------------------------------------------ -->
<%@ include file="../footer/footer.jsp" %>
</body>
</html>