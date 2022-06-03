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
		$("li:first-of-type").css("color","red").css("border", "1px solid #0000ff");
		$("li:last-of-type").css("color","yellow").css("border", "1px solid #0000ff");
	});
	</script>
</head>
<body>
	<h3 id="title">JQuery 이해</h3>
	<ol id="index">
		<li id="title1">선택자1</li>
		<li id="title2">선택자2</li>
		<li id="title3">전체선택자</li>
		<li id="title4">아이디선택자</li>
		<li id="title5">클래스선택자</li>
	</ol>
	<ul id="index1">
		<li id="title6">선택자1</li>
		<li id="title7">선택자2</li>
		<li id="title8">전체선택자</li>
		<li id="title9">아이디선택자</li>
		<li id="title10">클래스선택자</li>
	</ul>

<P class="time">  The time on the server is ${serverTime}. </P>
</body>
</html>
