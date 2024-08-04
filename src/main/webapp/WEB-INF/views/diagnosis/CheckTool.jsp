<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>HappyPawPet</title>
	<link rel="stylesheet" type="text/css" href="/css/top.css" />
	<link rel="stylesheet" type="text/css" href="/css/diagnosis/CheckTool.css" />
	<link rel="stylesheet" type="text/css" href="/css/diagnosis/diagnosisHistory.css" />
	<link rel="stylesheet" type="text/css" href="/css/footer.css" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css" integrity="sha512-10/jx2EXwxxWqCLX/hHth/vu2KY3jCF70dCQB8TSgNjbCVAC/8vai53GfMDrO2Emgwccf2pJqxct9ehpzG+MTw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
		$(document).ready(function() {
			$('#condition').change(function() {
				var selectedCondition = $(this).val();
				if (selectedCondition === 'eye') {
					$('#eye-condition').show();
					$('#skin-condition').hide();
					$('html, body').animate({
						scrollTop: $("#eye-condition").offset().top
					}, 1000);
				} else if (selectedCondition === 'skin') {
					$('#eye-condition').hide();
					$('#skin-condition').show();
					$('html, body').animate({
						scrollTop: $("#skin-condition").offset().top
					}, 1000);
				} else {
					$('#eye-condition').hide();
					$('#skin-condition').hide();
				}
			});
		});

		/*function handleSubmit(event) {
			event.preventDefault(); // 폼 제출 기본 동작 방지
			var condition = document.getElementById('condition').value;
			var form = document.getElementById('checkForm');

			if (condition === 'eye') {
				alert("안구질환결과페이지 이동")
				form.action = '/adoption/resultEye.jsp'; // 안구질환 결과 페이지로 리다이렉트
			} else if (condition === 'skin') {
				alert("피부질환결과페이지 이동")
				form.action = '/adoption/resultSkin.jsp'; // 피부질환 결과 페이지로 리다이렉트
			} else {
				alert('질병 유형을 선택해주세요.'); // 질병 유형을 선택하지 않은 경우 경고 메시지 표시
				return;
			}

			form.submit(); // 폼 제출
		}*/
	</script>
	<script>
		/*function sBtn(){
			confirm("'${sessionId}'님의 새로운 반려동물 정보를 저장할까요?");
				
		}*/
	</script>

</head>
<body>
<%@ include file="../top/top.jsp" %>
<!-- ---------------------------------------------------------------- -->
<section>
	<div id="blank"></div>
	<div class="container">
		<div class="sidebar">
			<%@ include file="diagnosisHistory.jsp" %>
		</div>
		<div class="main-content">
			<h2>반려견 정보</h2>
			<form action="/diagnosis/checkForm" method="post" enctype="multipart/form-data">
			<!-- <form id="/diagnosis/checkForm" onsubmit="handleSubmit(event)" method="post" enctype="multipart/form-data"> -->
				<input type="hidden" name="id" value="${sessionId }">
				<div class="form-group">
					<label for="name">이름</label>
					<input type="text" id="name" name="name" placeholder="반려견의 이름을 입력하세요">
				</div>
				<div class="form-group">
					<label for="age">생년월일</label>
					<input type="date" id="birth" name="birth" max="2024-12-31" min="1980-01-01" />
				</div>
				<div class="form-group">
					<label for="sex">성별</label>
					<select id="sex" name="sex">
						<option value="male">수컷</option>
						<option value="female">암컷</option>
					</select>
				</div>
				<div class="form-group">
					<label for="surgery">중성화여부</label>
					<select id="surgery" name="surgery">
						<option value="yes">예</option>
						<option value="no">아니오</option>
					</select>
				</div>
				<div class="form-group">
					<label for="weight">체중</label>
					<input type="text" id="weight" name="weight" placeholder="반려견의 체중을 입력하세요">
				</div>
				<div class="form-group">
					<label for="breed">견종</label>
					<input type="text" id="breed" name="breed" placeholder="반려견의 견종을 입력하세요">
				</div>
				<div class="form-group">
					<label for="condition">질병 유형</label>
					<select id="condition" name="condition">
						<option value="">선택하세요</option>
						<option value="eye">안구</option>
						<option value="skin">피부</option>
					</select>
				</div>
	
				<div id="questionnaire-section">
					<div id="eye-condition" style="display: none;">
						<%@ include file="../conditions/eyeCondition.jsp" %>
					</div>
					<div id="skin-condition" style="display: none;">
						<%@ include file="../conditions/skinCondition.jsp" %>
					</div>
				</div>
	
				<div class="form-group">
					<label for="file-upload">파일명:</label>
					<input type="file" id="file-upload" name="files" class="upload-button">
				</div>
	
				<div class="form-group">
					<button type="submit" class="submit-button" onclick="sBtn()">제출</button>
				</div>
			</form>
		</div>
	</div>
</section>
<%@ include file="../footer/footer.jsp" %>
</body>
</html>
