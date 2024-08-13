<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="/css/top.css" />
	<link rel="stylesheet" type="text/css" href="/css/login/findId.css" />
	<link rel="stylesheet" type="text/css" href="/css/footer.css" />
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<title>HappyPawPet 아이디찾기</title>
	<script>
		$(function(){
			$("select[name=domain_select]").on("change", function(){
				let addr = $(this).closest("#email").find("input[name=mail_tail]");
				if ($(this).val() == ""){
					addr.val('');
					addr.prop("readonly", false);
				} else{
					addr.val($(this).val());
					$(addr.prop("readonly",true));
				}
			});//이메일 클릭
		});
	</script>
	<script>
		function sBtn(){
			let fullEmail = $("#mail_id").val()+'@'+$("#mail_tail").val();
			$("#fullEmail").val(fullEmail);
			findFrm.submit();
		}
	</script>
</head>
<body id="findForm">
<!-- ------------------------------------------------------------------------- -->
<%@ include file="../top/top.jsp" %>
<section>
	<div class="subbanner"></div>
	<div class="main">
		<h2>아이디 찾기</h2>
		<form action="/login/findId" name="findFrm" method="post">
			<input type="hidden" name="fullEmail" id="fullEmail">
			<h4>
				본인 및 이메일확인
				<span>(* 항목은 필수 항목입니다.)</span>
			</h4>
			<fieldset class="fieldset_class">
				<dl id="name">
					<dt>
						<div></div>
						<label for="name_v">이름</label>
					</dt>
					<dd>
						<input type="text" id="name_v" name="name_v" required/>
					</dd>
				</dl>
				<dl id="email">
					<dt>
						<div></div>
						<label for="mail_id">이메일</label>
					</dt>
					<dd>
						<input type="text" id="mail_id" name="mail_id" required />
						<span>@</span>
						<input type="text" id="mail_tail" name="mail_tail" required value="" />
						<select name="domain_select">
							<option value="">직접입력</option>
							<option value="gmail.com">gmail.com</option>
							<option value="naver.com">naver.com</option>
							<option value="nate.com">nate.com</option>
							<option value="hanmail.net">hanmail.net</option>
							<option value="empal.com">empal.com</option>
							<option value="dreamwiz.com">dreamwiz.com</option>
						</select>
					</dd>
				</dl>

			</fieldset>
			<button type="button" onclick="sBtn()">아이디찾기</button>
		</form>

	</div>
</section>
<!-- ------------------------------------------------------------------------------------------------ -->
<%@ include file="../footer/footer.jsp" %>
</body>
</html>