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
			url:"/sample/getList2/222.json",
			dataType: "JSON",
			success: function(data) {
				if(data.length > 0) {
					var tb=$(".wrap").html(); //html방식
					
					var tb=$('<table class="table table-striped table-bordered table-hover"/>');
					var head=$("<tr/>").append($("<td/>").text("학생번호"),$("<td/>").text("학생이름"),$("<td/>").text("학과"),$("<td/>").text("생일"),$("<td/>").text("성별"),$("<td/>").text("지도교수"));
					console.log(tb);
					tb.append(head);
					
 					$(".wrap").empty();	//html방식
 					
 					var html="";
 					for(var i in data) {
 						//html방식
 						html+="<tr>";
 						html+="<td>"+data[i].sid+"</td>";
 						html+="<td>"+data[i].sname+"</td>";
 						html+="<td>"+data[i].dept+"</td>";
 						var $birth=new Date(data[i].birth);
 						html+="<td>"+$birth.getFullYear()+'-'+($birth.getMonth()+1)+'-'+$birth.getDate()+"</td>";
 						html+="<td>"+data[i].sex+"</td>";
 						html+="<td>"+data[i].pid+"</td>";
 						html+="</tr>";
 						
//  						var $sid=data[i].sid;
//  						var $sname=data[i].sname;
//  						var $dept=data[i].dept;
//  						var $birth=new Date(data[i].birth).toLocaleDateString();
//  						var $sex=data[i].sex;
//  						var $pid=data[i].pid;
//  						var row=$("<tr/>").append($("<td/>").text($sid),$("<td/>").text($sname),$("<td/>").text($dept),$("<td/>").text($birth),$("<td/>").text($sex),$("<td/>").text($pid));
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
<h1>학생리스트</h1>
<table id="body" border = "1" class="table table-bordered">
	<thead>
		<tr id = "tr1" class="table">
			<th id="th1" >학생번호</th>
			<th>학생이름</th>
			<th>학과</th>
			<th>생일</th>
			<th id="th7">성별</th>
			<th>지도교수</th>
		</tr>
	</thead>
	<tbody id="titlebody">
		<c:forEach var="item" items="${list}">
		<tr id="title" >
			<td id="title1">${item.sid}</td>
			<td>${item.sname}</td>
			<td id="title2">${item.dept}</td>
			<td><fmt:formatDate value="${item.birth}" pattern="yyyy-MM-dd"/></td>
			<td id="title3">${item.sex}</td>
			<td id="title3">${item.pid}</td>
		</tr>
		</c:forEach>
	</tbody>


</table>
<!-- <button id="btn1">버튼 1</button>  -->
<div class="row">
	<div class="col-lg-12">
	<div class="panel panel-default">
	<div class="panel-heading">학생리스트</div>
		<div class="panel-body wrap"></div>	
	
	</div>
	</div>
</div>

</div>

</body>
</html>