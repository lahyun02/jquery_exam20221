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
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js" integrity="sha512-jGsMH83oKe9asCpkOVkBnUrDDTp8wl+adkB2D+//JtlxO4SrLoJdhbOysIFQJloQFD+C4Fl1rMsQZF76JjV0eQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js" integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz" crossorigin="anonymous"></script>

<script>
$(function(){
	
	var modal = $(".modal");
	var modalSid = modal.find("input[name='sid']");
	var modalSname = modal.find("input[name='sname']");
	var modalDept = modal.find("input[name='dept']");
	var modalBirth = modal.find("input[name='birth']");
	var modalSex = modal.find("input[name='sex']");
	var modalPid = modal.find("input[name='pid']");
	
	var modalModBtn =  $("#modalModBtn");
	var modalRemoveBtn = $("#modalRemoveBtn");
	var modalRegisterBtn = $("#modalRegisterBtn");
	var modalCloseBtn = $("#modalCloseBtn"); 
	
	$(".wrap").empty();
	getList({pid: '${item.pid}'});   
	function getList(param){
		var pid = param.pid;
		$.ajax({
			url: "reply/getList/"+pid+".json",
			dataType: "JSON",
			success: function(data){
				if(data.length > 0){
					var tb = $('<table class="table table-striped table-bordered table-hover chat" />');
					var head = $("<tr/>").append($("<td />").text("학생번호"), $("<td/>").text("학생이름"), $("<td/>").text("학과"), $("<td/>").text("생년월일"), $("<td/>").text("성별"), $("<td/>").text("지도교수번호"));
					console.log(tb);
					tb.append(head);
					$(".wrap").empty();
					for(var i in data){
						var $sid = data[i].sid;
						var $sname = data[i].sname;
						var $dept = data[i].dept;
						var $birth = new Date(data[i].birth).toLocaleDateString();
						var $sex = data[i].sex;
						var $pid = data[i].pid;
						var row = $("<tr/>").append($("<td class=move/>").text($sid), $("<td/>").text($sname), $("<td/>").text($dept), $("<td/>").text($birth), $("<td/>").text($sex), $("<td/>").text($pid));
						tb.append(row);
					}
					$(".wrap").append(tb);
				}
			}
		});
		
	}
	
	
	function get(param){
		var sid = param.sid;
		$.ajax({
			url: "reply/"+sid+".json",
			dataType: "JSON",
			success: function(vo){
				modalSid.val(vo.sid);
				modalSname.val(vo.sname);
				modalDept.val(vo.dept);
				modalBirth.val(vo.birth);
				var $birth = new Date(vo.birth);
				modalBirth.val($birth.getFullYear()+'-'+($birth.getMonth()+1)+'-'+$birth.getDate());
				modalSex.val(vo.sex);
				modalPid.val(vo.pid);
				modal.modal("show");
			}
		});
	}
	
	
	
	//랜더링 후에 추가된 ajax테이블에 대한 이벤트 처리
	$(".wrap").on("click", "tr", function(e){
		var sidno = $(this).index();
		
		console.log("sidno"+sidno);
		sidno = $(".move").eq(sidno-1).text();
		console.log("sidno"+sidno);
		get({sid:sidno}); 
	})
	
	
	var formObj = $("#operForm");
	$("button[data-oper='modify']").on("click", function(e){
		formObj.attr("action", "update").submit();
	});
	
	$("button[data-oper='list']").on("click", function(){
		formObj.find("#pid").remove();
		formObj.attr("action", "getajax").submit();
	});
		
});

</script>
  
</head>
<body>
<div class="row">
	 <div class="col-lg-12">
		<h1 class="page-header">교수추가</h1>
		</div>
	</div>	
		
		<div class="row">
		 <div class="col-lg-12">
		  <div class="panel panel-default">
		    <div class="panel-heading">교수추가</div>
		    
		    <div class="panel=body">
		  	
			
				<div class="form-group">
					<label>교수번호:</label>
					<input class="form-control" type="number" name ="pid" value="${item.pid}" readonly/>
					
				</div>
				<div class="form-group">
					<label>교수이름:</label>
					<input class="form-control" type="text" name ="pname" value="${item.pname}" readonly/>
					
				</div>
				<div class="form-group">
					<label>학과:</label>
					<input class="form-control" type="text" name ="dept" value="${item.dept}" readonly/>
					
				</div>
			    <div class="form-group">
					<label>직위:</label>
					<input class="form-control" type="text" name ="post" value="${item.post}" readonly/>
					
				</div>
				<div class="form-group">
					<label>월급:</label>
					<input class="form-control" type="number" name ="pay" value="${item.pay}" readonly/>
					
				</div>
				<div class="form-group">
					<label>임용날짜:</label>
					<input class="form-control" type="text" name ="hire" value='<fmt:formatDate value="${item.hire}" pattern="yyyy-MM-dd" />' readonly/>
					
				</div>
				<div class="form-group">
					<label>전공:</label>
					<input class="form-control" type="text" name ="major" value="${item.major}" readonly/>
					
				</div>
				<div class="form-group">
					<label>캠퍼스:</label>
					<input class="form-control" type="text" name ="campus" value="${item.campus}" readonly/>
					
				</div>
				<div>
<!-- 				<button data-oper="modify" class="btn btn-primary btn-default"><a href="update?pid=${item.pid}">수정</a></button> -->
<!-- 				<button data-oper="list" class="btn btn-info"><a href="list?pid=${item.pid}">목록</a></button> -->
				    <button data-oper="modify" class="btn btn-primary btn-default">수정</button>
				    <button data-oper="list" class="btn btn-info">목록</button>
				 	
				<form action="modify" id="operForm" method="get"> 
				 	<input type="hidden" type="number" id="pid" name="pid" value="${item.pid}" /> 
				</form>
				</div>	
		
		</div>
		</div>
		</div>
</div>	
	
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">학생리스트<button id="addStudentBtn" class="btn btn-primary btn-xs pull-right">등록</button></div>
				<div class="panel-body wrap">
				
				</div>
			</div>
		</div>
	</div>
	
	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h4 class="modal-title" id="myModalLabel">Add Modal</h4>
<!-- 	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> -->
	      </div>
	      <div class="modal-body">
	      	<div class="form-group">
				<label>학생번호:</label>
				<input class="form-control" type="number" name ="sid" required/>
	      	</div>
	      	<div class="form-group">
				<label>학생이름:</label>
				<input class="form-control" type="text" name ="sname" required/>
			</div>
			<div class="form-group">
				<label>학과:</label>
				<input class="form-control" type="text" name ="dept" required/>
			</div>
	      	<div class="form-group">
				<label>생년월일:</label>
				<input class="form-control" type="text" name ="birth" required/>
			</div>
			<div class="form-group">
				<label>성별:</label>
				<input class="form-control" type="text" name ="sex" required/>
			</div>
			<div class="form-group">
				<label>지도교수번호:</label>
				<input class="form-control" type="number" name ="pid" value="${item.pid }" required/>
			</div>
	      </div>
	      <div class="modal-footer">
	        <button id="modalModBtn" type="button" class="btn btn-warning">수정</button>
	        <button id="modalRemoveBtn" type="button" class="btn btn-danger">삭제</button>
	        <button id="modalRegisterBtn" type="button" class="btn btn-primary">등록</button>
	        <button id="modalCloseBtn" type="button" class="btn btn-info">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	
	
</body>
</html>