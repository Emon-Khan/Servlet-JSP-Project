<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Register Page</title>
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
	<%@include file="navbar.jsp"%>
	<!-- registerForm -->
	<main
		class="align-items-center primary-background banner-background-clipping"
		style="padding-bottom: 80px;">
		<div class="container">
			<div class="row">
				<div class="col-md-6 offset-md-3">
					<div class="card">
						<div class="card-header primary-background">
							<h2>Register Here</h2>
						</div>
						<div class="card-body">
							<form id="reg-form" action="RegisterServlet" method="POST">
								<div class="mb-3">
									<label for="user_name" class="form-label">User Name </label> <input
										name="user_name" type="text" class="form-control"
										id="user_name" aria-describedby="emailHelp">
								</div>
								<div class="mb-3">
									<label for="exampleInputEmail1" class="form-label">Email
										address</label> <input name="user_email" type="email"
										class="form-control" id="exampleInputEmail1"
										aria-describedby="emailHelp">
								</div>
								<div class="mb-3">
									<label for="exampleInputPassword1" class="form-label">Password</label>
									<input name="user_password" type="password"
										class="form-control" id="exampleInputPassword1">
								</div>
								<div class="mb-3">
									<label for="gender">Select Gender</label> <br> <input
										type="radio" id="gender" name="gender" value="Male">
									Male <input type="radio" id="gender" name="gender"
										value="Female"> Female
								</div>
								<div class="mb-3">
									<textarea name="about" class="form-control" id="" row="5"
										placeholder="Enter Something About Yourself"></textarea>
								</div>
								<div class="mb-3 form-check">
									<input name="check" type="checkbox" class="form-check-input"
										id="exampleCheck1"> <label class="form-check-label"
										for="exampleCheck1">Agree Terms & Conditions</label>
								</div>
								<div class="container text-center" id="loader"
									style="Display: none">
									<span class="fa fa-refresh fa-spin fa-4x"></span>
									<h4>Please Wait...</h4>
								</div>
								<button id="submit-btn" type="submit" class="btn btn-danger">Submit</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	<!-- js -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>
	<!-- jquery -->
	<script src="https://code.jquery.com/jquery-3.7.0.min.js"
		integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g="
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js">
		
	</script>
	<script src="js/script.js" type="text/javascript">
		
	</script>
	<script>
		$(document).ready(function() {
			console.log("loaded...");
			$('#reg-form').on('submit', function(event) {
				event.preventDefault();

				let form = new FormData(this);
				$("#submit-btn").hide();
				$("#loader").show();

				$.ajax({
					url : "RegisterServlet",
					type : 'POST',
					data : form,
					success : function(data, textStatus, jqXHR) {
						console.log(data)
						$("#submit-btn").show();
						$("#loader").hide();
						if(data.trim() === 'Done'){
							swal("Registered Successfully, we are redirecting you to the login page...")
							.then((value) => {
							  window.location="login_page.jsp"
							});
						} else{
							swal(data);
						}
						
					},
					error : function(jqXHR, textStatus, errorThrown) {
						$("#submit-btn").show();
						$("#loader").hide();
						swal("Something went wrong, try again...")
					},
					processData : false,
					contentType : false
				});
			});
		});
	</script>
</body>
</html>