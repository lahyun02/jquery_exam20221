<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	
<script src="../resources/jquery.js"></script>
<script>
	$(function() {
		
		/* $("#tr1 th[id=th1]").html("No.").css({"color":"blue"});
		var obj = $("#th7").text("Campus");
		
		var result = $("#body").attr("border");
		console.log(result);
		$("#body").attr({"border":result.replace("1", "0")}); */
		
		var copyobj = $("#tr1").clone();
		$("#tr1").before(copyobj);
		copyobj = $("#titlebody").clone(true);
		$("#titlebody").after(copyobj);
		$("#btn1").click(function() {
			$("#body").toggleClass("table table-bordered table-hover");
		});
			
	});
</script>
<style>
	* {
		margin: 0;
		padding: 0;
	}
</style>
</head>
<body>
<table id="body" border = "1">
	<thead>
		<tr id = "tr1" class="table">
			<th id="th1" >교수번호</th>
			<th>교수이름</th>
			<th>학과</th>
			<th>교수직위</th>
			<th>연봉</th>
			<th>임용일</th>
			<th>전공</th>
			<th id="th7">캠퍼스</th>
		</tr>
	</thead>
	<tbody id="titlebody">
		<c:forEach var="item" items="${list}">
		<tr id="title" >
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
<button id="btn1">버튼 1</button> 

</body>
</html>