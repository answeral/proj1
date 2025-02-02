<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Q&A 질문하기</title>
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap&subset=korean" rel="stylesheet">
  <link rel="stylesheet" href="/css/top.css">
  <link rel="stylesheet" href="/css/board/question.css">
  <link rel="stylesheet" href="/css/footer.css">
  <script>
  	function writeBtn(){
  		alert("작성이 완료되었습니다.");
  	}
  </script>
</head>
<body>
	<%@ include file="../top/top.jsp" %>
	<section>
	    <h1>Q&A 질문하기</h1>
	    <hr>
	
	    <form action="/board/question" name="write" method="post" enctype="multipart/form-data">
	      <table>
	        <colgroup>
	          <col width="15%">
	          <col width="85%">
	        </colgroup>
	        <tr>
	          <th>작성자</th>
	          <td>
	            <input type="text" name="id" value="${sessionId }" readonly="readonly">
	          </td>
	        </tr>
	        <tr>
	          <th>제목</th>
	          <td>
	            <input type="text" name="qtitle" required>
	          </td>
	        </tr>
	        <tr>
	          <th>내용</th>
	          <td>
	            <textarea name="qcontent" cols="50" rows="10"></textarea>
	          </td>
	        </tr>
	        <tr>
	          <th>이미지 표시</th>
	          <td>
	            <input type="file" name="files" id="qfile" accept=".jpg, .jpeg, .png, .gif">
	          </td>
	        </tr>
	      </table>
	      <hr>
	      <div class="button-wrapper">
	        <button type="submit" class="write" onclick="writeBtn()">작성완료</button>
	        <button type="button" class="cancel" onclick="window.history.back()">취소</button>
	      </div>
	    </form>
	
	  </section>
	  <!-- ----------------------------------------------------------------- -->
	  <%@ include file="../footer/footer.jsp" %>
</body>
</html>