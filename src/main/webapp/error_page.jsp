<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sorry! Something Went Wrong</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="container text-center">
		<img src="img/error.png" class="img-fluid">
		<h3 class="display-1">
			<strong>Ooopssss</strong>
		</h3>
		<h3>We can't seem to find a page your are looking for</h3>
		<%= exception%>
		<a href="index.jsp" class="btn btn-lg primary-background my-3">Home</a>
	</div>
</body>
</html>