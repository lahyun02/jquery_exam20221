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
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js" integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk" crossorigin="anonymous"></script>

<style>
#container {
	max-width: 80%;
	margin: 0 auto;
}
</style>
<script type="text/javascript">
	$(function() { 		// --화면에 html을 다 뿌려준 후 그 다음에 리스너 발생시켜라는 함수. 
		
		
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
	
		
		
		
//		$(".pidNo").on("click", function(e) {   // 여기서 사용되는 function()은 위의 $(function() {}와 다름. 
			// 만약 이걸 위의 $(function() {} 밖으로 빼면, 아무것도 없는 상태에서 클릭이벤트를 발생시켜라는 의미가 되기 때문에 기능하지 못함. 
			
			//e.preventDefault(); --html에서 이벤트 작동x
//			console.log(sid);
//			alert("클릭이벤트 발생"); 

//----			var pidNo = $(this).text();
//			alert(pidNo); 

		function getList(param) {
			var pid=param.pid;

			//학생테이블
	 		$.ajax({
	 			url:"/sample/getList1/" + pid + ".json",
	 			dataType: "JSON",
	 			success: function(data) {
	 				if(data.length > 0) {
	 					var tb=$(".stu-wrap").html(); //html방식
						
	 					var tb=$('<table class="table table-striped table-bordered table-hover"/>');
	 					var head=$("<tr/>").append($("<td/>").text("학생번호"),$("<td/>").text("학생이름"),$("<td/>").text("학과"),$("<td/>").text("생일"),$("<td/>").text("성별"),$("<td/>").text("교수번호"));
	 					console.log(tb);
	 					tb.append(head);
						
	  					$(".stu-wrap").empty();	//html방식
	 					
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
	  					$(".stu-wrap").append(tb);
	 				}
	 			}
	 		});
			
		}	//	
		
		$("tr").on("click", function(e){
			//e.preventDefault();
			$(".stu-wrap").empty();
			var pidno = $(this).index();
			console.log("1"+pidno);
			pidno = $(".move").eq(pidno).text();
			console.log("pidno"+pidno);
			getList({pid:pidno});
		});
		
		$("#regBtn").on("click", function(){
			self.location="add";
		});
		
		
	});
	
	
</script>

</head>
<body>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>

<div id="container">
	<h1>교수리스트</h1>
	<button id="regBtn" type="button" class="btn btn-primary btn-xs pull-right">등록</button>
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
				<td id="p2" class="move pidNo">${item.pid}</td> 
				<td id="title1"><a href="get?pid=${item.pid}">${item.pname}</a></td> 
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
		<div class="panel-heading">학생리스트</div>
			<div class="panel-body stu-wrap"></div>	
		</div>
	</div>

</div>



</body>
</html>