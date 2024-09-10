<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="/css/admin/adminTop.css" />
	<link rel="stylesheet" type="text/css" href="/css/admin/subbanner.css" />
	<link rel="stylesheet" type="text/css" href="/css/admin/adminQna.css" />
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<title>HappyPawPet 관리자페이지</title>
	</head>
	<body id="admin">
		<%@ include file="../top/adminTop.jsp" %>
		<!-- ------------------------------------------------------------------------- -->
		<section>
			<%@ include file="../admin/subbanner.jsp" %>
			<div class="main">
				<h2><span>진단내역관리</span></h2>
				<div class="boardlist">
					<div id="comment">
						<h4>안구질환</h4>
						<!-- <button id="Canalyst" class="Total">키워드분석하기</button> -->
					</div>
					<table id="board">
						<colgroup> 
					    	<col style="width: 7%;"/> 
					        <col style="width: 10%;"/> 
					        <col style="width: 10%;"/> 
					        <col style="width: 10%;"/> 
					        <col style="width: 10%;"/> 
					        <col style="width: 33%;"/> 
					        <col style="width: 10%;"/> 
					    </colgroup> 
					    <thead>
							<tr>
								<th>진단번호</th>
								<th>보호자ID</th>
								<th>반려동물이름</th>
								<th>진단일자</th>
								<th>질병종류</th>
								<th>진단메모</th>
								<th>보호자정보</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${ diagnosisHistory}" var="pdDto">
								<tr>
									<td id="qno">${pdDto.dno }</td>
									<td>${pdDto.id}</td>
									<td id ="content">${pdDto.pname }</td>
									<td>${pdDto.diagnosisdate }</td>
									<td>${pdDto.condition }</td>
									<td>${pdDto.additionalNotes }</td>
									<td id="button"><div id="QnaOne"><a href="/admin/memDetail?id=${pdDto.id }">바로가기</a></div></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<!-- ----------------------------------------------------------------------------- -->
				<!-- 차트분석 -->
				<div class="chart">
					<div id="chart_g">
						<canvas id="myChart"></canvas>
					</div>
					<div id="chart_a">
						<canvas id="myChart2"></canvas>
					</div>
				</div>
				<div class="totalChart">
					<div id="chartT1">
						<canvas id="tChart"></canvas>
					</div>
					<div id="chartT2">
						<canvas id="tChart2"></canvas>
					</div>
				</div>
			</div>
		</section>
	</body>
</html>