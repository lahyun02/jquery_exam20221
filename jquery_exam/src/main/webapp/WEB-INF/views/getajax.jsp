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
<style>
#container {
	max-width: 80%;
	margin: 0 auto;
}
</style>
<script type="text/javascript">
	$(function() {
		$.ajax({
			url:"/sample/getList/111.json",
			dataType: "JSON",
			success: function(data) {
				if(data.length > 0) {
					var tb=$(".wrap").html(); //html방식
					
					var tb=$('<table class="table table-striped table-bordered table-hover"/>');
					var head=$("<tr/>").append($("<td/>").text("교수번호"),$("<td/>").text("교수이름"),$("<td/>").text("학과"),$("<td/>").text("교수직위"),$("<td/>").text("연봉"),$("<td/>").text("임용일"),$("<td/>").text("전공"),$("<td/>").text("캠퍼스"));
					console.log(tb);
					tb.append(head);
					
 					$(".wrap").empty();	//html방식
 					
 					var html="";
 					for(var i in data) {
 						//html방식
 						html+="<tr>";
 						html+="<td>"+data[i].pid+"</td>";
 						html+="<td>"+data[i].pname+"</td>";
 						html+="<td>"+data[i].dept+"</td>";
 						html+="<td>"+data[i].post+"</td>";
 						html+="<td>"+data[i].pay+"</td>";
 						var $hire=new Date(data[i].hire);
 						html+="<td>"+$hire.getFullYear()+'-'+($hire.getMonth()+1)+'-'+$hire.getDate()+"</td>";
 						html+="<td>"+data[i].major+"</td>";
 						html+="<td>"+data[i].campus+"</td>";
 						html+="</tr>";
 						
//  						var $pid=data[i].pid;
//  						var $pname=data[i].pname;
//  						var $dept=data[i].dept;
//  						var $post=data[i].post;
//  						var $pay=data[i].pay;
//  						var $hire=new Date(data[i].hire).toLocaleDateString();
//  						var $major=data[i].major;
//  						var $campus=data[i].campus;
//  						var row=$("<tr/>").append($("<td/>").text($pid),$("<td/>").text($pname),$("<td/>").text($dept),$("<td/>").text($post),$("<td/>").text($pay),$("<td/>").text($hire),$("<td/>").text($major),$("<td/>").text($campus));
//  						tb.append(row);
 					}
 					
 					tb.append(html);	//html방식
 					
 					console.log(tb);
 					$(".wrap").append(tb);
				}
			}
		});
	});
</script>

</head>
<body>
<div id="container">
<h1>교수리스트</h1>
<table id="body" border = "1" class="table table-bordered">
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
<!-- <button id="btn1">버튼 1</button>  -->
<div class="row">
	<div class="col-lg-12">
	<div class="panel panel-default">
	<div class="panel-heading">교수리스트</div>
		<div class="panel-body wrap"></div>	
	
	</div>
	</div>
</div>

</div>

</body>
</html>