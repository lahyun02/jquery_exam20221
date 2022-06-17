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
		var obj1 = $("#index1").children().clone();
		$("#index2").remove();
		$("#index3").empty();
		$("#index3").append(obj1);
		
	});
	</script>
	
</head>
<body>
	<h3 id="title">JQuery 이해</h3>
	<div id="index1">
	<section name="sec1" id="sec1">
		<h3>선택1</h3>
		<h3>선택2</h3>
		<h3>선택3</h3> 
	</section>
	</div>
	<div id="index2">
		<section nam="sec2" id="sec2">
			<h3>선택4</h3>
			<h3>선택5</h3>
			<h3>선택6</h3>
		</section>
	</div>
	<div id="index3">
		<section nam="sec3" id="sec3">
			<h3>선택7</h3>
			<h3>선택8</h3>
			<h3>선택9</h3>
		</section>
	</div>

<P class="time">  The time on the server is ${serverTime}. </P>
</body>
</html>
