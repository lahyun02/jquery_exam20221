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
		$("#id, #pass").on("focus", function(){
			$(this).css("background-color", "red")
		});
		$("#id, #pass").on("blur", function(){
			$(this).css("background-color", "blue")
		});
		$("#title").on("focusin", function(){
			$(this).css("background-color", "red")
		});
		$("#title").on("focusout", function(){
			$(this).css("background-color", "blue")
		});
		
	});
	</script>
	
</head>
<body>
	<div id="title">
	<label for="btn1">사용자</label>
	<button id="btn1">버턴 1</button>
	<h3 id="content1">내용1</h3>
	<label for="btn2">비 번</label>
	<button id="btn2">버턴 2</button>
	<h3 id="content2">내용2</h3>


<P class="time">  The time on the server is ${serverTime}. </P>
</body>
</html>
