<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>Home</title>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js" integrity="sha512-jGsMH83oKe9asCpkOVkBnUrDDTp8wl+adkB2D+//JtlxO4SrLoJdhbOysIFQJloQFD+C4Fl1rMsQZF76JjV0eQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="./resources/jquery.js"></script>

	<script>
	/* $(document).ready(function() {
	$("#title3").css("color","red");
	}); */
	$(function() {
		$("#index1 label:contains(사용자)").css({"border":"1px solid #0000ff"});
		$("#form div:has(input)").css({"color":"green"}).css({"border":"1px solid #0000ff"});
		$("#index select").contents().css({"color":"blue"}).css({"border":"1px solid #0000ff"});
		$("#index4 li").not(":first").css({"color":"orange"}).css({"border":"1px dashed #0000ff"});

	});
	</script>
</head>
<body>
	<h3 id="title">JQuery 이해</h3>
	<form action="#" id="form">
	<div id="index">
		<select name="option-kind" id="option-kind">
			<option value="opt1">선택1</option>
			<option value="opt2">선택2</option>
			<option value="opt3" selected>선택3</option>
		</select>
	</div>
	<div id="index1">
		<label for="id">사용자</label>
		<input type="text" name="id" id="id" />
		<label for="pass">비번</label>
		<input type="text" name="pass" id="pass" />		
	</div>
	<div id="index2">
		<input type="checkbox" name="chk1" value="체크1" />체크1
		<input type="checkbox" name="chk2" value="체크2" checked />체크2
	</div>
	<div id="index3">
		<input type="radio" name="rad1" value="선택1" checked />선택1
		<input type="radio" name="rad2" value="선택2" />선택2
	</div>
	</form>
	<ol id="index4">
		<li id="title1">선택자1</li>
		<li id="title2">선택자2</li>
		<li id="title3">전체선택자</li>
		<li id="title4">아이디선택자</li>
		<li class="title5">클래스선택자</li>
	</ol>


<P class="time">  The time on the server is ${serverTime}. </P>
</body>
</html>
