<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
<script src="../resources/jquery.js"></script>
<script>
	$(function() {
		$("#title td:first-of-type").css("color","red");
		$("tr:first-of-type").css("color","blue");
	});
</script>
</head>
<body>
<table border = "1">
	<thead>
		<tr>
			<th>교수번호</th>
			<th>교수이름</th>
			<th>학과</th>
			<th>교수직위</th>
			<th>연봉</th>
			<th>임용일</th>
			<th>전공</th>
			<th>캠퍼스</th>
		</tr>
	</thead>
	<tbody id="titlebody">
		<c:forEach var="item" items="${list}">
		<tr id="title">
			<td id="title1">${item.pid}</td>
			<td>${item.pname}</td>
			<td id="title2">${item.dept}</td>
			<td>${item.post}</td>
			<td>${item.pay}</td>
			<td><fmt:formatDate value="${item.hire}" pattern="yyyy-MM-dd"/></td>
			<td>${item.major}</td>
			<td id="title3">${item.campus}</td>
		</tr>
		</c:forEach>
	</tbody>


</table>
</body>
</html>