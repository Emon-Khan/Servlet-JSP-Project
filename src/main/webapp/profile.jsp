<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page errorPage="error_page.jsp"%>
<%
User user = (User) session.getAttribute("currentUser");
if (user == null) {
	response.sendRedirect("login_page.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome | <%=user.getName()%></title>
<!-- css -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<!-- font awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<!-- navbar -->
	<nav class="navbar navbar-expand-lg primary-background text-white">
		<div class="container-fluid text-white">
			<a class="navbar-brand" href="index.jsp">ShikbeTumio</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="#"><span class="fa fa-home"></span>
							Home</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false">Blog</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="#">Action</a></li>
							<li><a class="dropdown-item" href="#">Another action</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="#">Something else
									here</a></li>
						</ul></li>
					<li class="nav-item"><a class="nav-link" href="#"><span
							class="fa fa-group"></span> About Us</a></li>
					<li class="nav-item"><a class="nav-link " href="#"><span
							class="fa fa-address-book"></span> Contact </a></li>
				</ul>
				<ul class="navbar-nav mr-right">
					<li class="nav-item"><a class="nav-link " href="#"
						data-bs-toggle="modal" data-bs-target="#exampleModal"><span
							class="fa fa-user-circle"></span> <%=user.getName()%> </a></li>
				</ul>
				<ul class="navbar-nav mr-right">
					<li class="nav-item"><a class="nav-link " href="LogOutServlet"><span
							class="fa fa-sign-out "></span> Logout </a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- profile modal-->

	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header primary-background">
					<h5 class="modal-title" id="exampleModalLabel">ShikbeTumio</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="container text-center">
						<h5 class="modal-title" id="exampleModalLabel">
							<span class="fa fa-user-circle fa-5x"></span><br>
							<h3 class="fw-bold"><%=user.getName()%></h3>
						</h5>
						<!-- details about user -->
						<div id="profile-details">

							<table class="table">
								<tbody>
									<tr>
										<th scope="row">ID :</th>
										<td><%=user.getId()%></td>
									</tr>
									<tr>
										<th scope="row">Email :</th>
										<td><%=user.getEmail()%></td>
									</tr>
									<tr>
										<th scope="row">Gender :</th>
										<td><%=user.getGender()%></td>
									</tr>
									<tr>
										<th scope="row">About :</th>
										<td><%=user.getAbout()%></td>
									</tr>
									<tr>
										<th scope="row">Registered On :</th>
										<td><%=user.getDateTime().toString()%></td>
									</tr>
								</tbody>
							</table>
						</div>
						<div id="profile-edit" style="display: none">
							<h2>Edit</h2>
							<form action="EditServlet" method="POST">
								<table class="table">
									<tbody>
										<tr>
											<th scope="row">ID :</th>
											<td><%=user.getId()%></td>
										</tr>
										<tr>
											<th scope="row">Name :</th>
											<td><input type="text" class="form-control"
												name="user_name" value=<%=user.getName()%>></td>
										</tr>
										<tr>
											<th scope="row">Email :</th>
											<td><input type="email" class="form-control"
												name="user_email" value=<%=user.getEmail()%>></td>
										</tr>
										<tr>
											<th scope="row">Password :</th>
											<td><input type="password" class="form-control"
												name="user_password" value=<%=user.getPassword()%>></td>
										</tr>
										<tr>
											<th>Gender :</th>
											<td><%=user.getGender()%></td>
										</tr>
										<tr>
											<th scope="row">About :</th>
											<td><textarea rows="3" class="form-control"
													name="user_about"><%=user.getAbout()%></textarea></td>
										</tr>
									</tbody>
								</table>
								<div class="container">
									<button type="submit" class="btn btn-outline-danger">Save</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<button id="edit_profile_button" type="button"
						class="btn btn-primary">Edit</button>
				</div>
			</div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>
	<!-- jquery -->
	<script src="https://code.jquery.com/jquery-3.7.0.min.js"
		integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g="
		crossorigin="anonymous"></script>
	<script src="js/script.js" type="text/javascript">
		
	</script>
</body>
</html>