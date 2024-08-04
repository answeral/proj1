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
	<link rel="stylesheet" type="text/css" href="/css/admin/adminPet.css" />
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
				<h2><span>반려동물관리</span></h2>
				<div class="petlist">
					<h4>등록 반려동물 현황 (총 ${plist.size()} 마리)</h4>
					<table id="pet">
						<colgroup> 
					    	<col style="width: 10%;"/> 
					        <col style="width: 10%;"/> 
					        <col style="width: 10%;"/> 
					        <col style="width: 15%;"/> 
					        <col style="width: 10%;"/> 
					        <col style="width: 13%;"/> 
					        <col style="width: 12%;"/> 
					    </colgroup> 
					    <thead>
							<tr>
								<th>회원아이디</th>
								<th>반려동물 이름</th>
								<th>무게(kg)</th>
								<th>생일</th>
								<th>성별</th>
								<th>중성화여부</th>
								<th>보호자정보</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${ plist}" var="pDto">
									<tr>
										<td>${pDto.id }</td>
										<td>${pDto.pname}</td>
										<td>${pDto.pweight }</td>
										<td><fmt:formatDate value="${pDto.pbirth }" pattern="yyyy-MM-dd"/></td>
										<td>${pDto.pgender }</td>
										<td>${pDto.psurgery }</td>
										<td id="button"><div id="memInfo"><a href="/admin/memDetail?id=${pDto.id }">확인</a></div></td>
									</tr>
							</c:forEach>
						</tbody>
					</table>
					</div>
				</div>
				<!-- ----------------------------------------------------------------------------- -->
		</section>
	</body>
</html>