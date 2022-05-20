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
		$(".title4").closest("div").css("color","red").css("border", "1px solid #0000ff");
		
	});
	</script>
</head>
<body>
	<h3 id="title">JQuery 이해</h3>
	<div id="division">
	<h3 id="title1">선택자1</h3>
	<h3 id="title1-1">선택자2</h3>
	<div id="division1">
		<h4 id="title2">전체선택자</h4>
		<div>
			<h4 id="title3">아이디선택자</h4>
			<h4 class="title4">클래스선택자</h4>
		</div>
	</div>
	</div>



<P class="time">  The time on the server is ${serverTime}. </P>
</body>
</html>
