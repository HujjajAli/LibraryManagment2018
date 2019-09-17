<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<title>LMS | Home</title>

<!-- Project Starting Date 9-4-2018 -->
<!-- This Project is Part of Software Engineering Subject Course BIST Part III -->

<!-- JQuery Library -->
<script type="text/javascript" src="bootstrap/js/jquery-3.2.1.min.js"></script>
<!-- Bootstrap JavaScript Library -->
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<!-- Bootstrap CSS Library -->
<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">

<script type="text/javascript" src="js/authorajax.js"></script>

</head>
<%if(!(request.getSession().getAttribute("loginUser") == null)){
	request.getRequestDispatcher("profilepage.jsp").forward(request, response);
} %>
<body>
	<nav class="navbar navbar-inverse"><!-- Other Styeles default-->
		<div class="container-fluid">
			<div class="navbar-header">
				<a href="#" class="navbar-brand">LMS System</a>
			</div>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#" class="dropdown-toggle" data-toggle="dropdown">About <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#">Software</a></li>
						<li><a href="#">Developer</a></li>
						<li><a href="#">Version</a></li>
					</ul>
				</li>
				<li><a href="#">Help</a></li>
			</ul>
		</div>
	</nav>
	<div class="container-fluid">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<div class="jumbotron text-uppercase">
				<form action="LoginController" method="post">
					<div class="panel panel-info">
						<div class="panel-body">
							<div class="form-group row">
								<div class="col-md-2"></div>
								<div class="col-md-3">
									<label for="username" style="margin-top:8px">Username </label>
								</div>
								<div class="col-md-5">
									<input type="text" name="username" class="form-control" required>
								</div>
								<div class="col-md-2"></div>
							</div>
							<div class="form-group row">
								<div class="col-md-2"></div>
								<div class="col-md-3">
									<label for="password" style="margin-top:8px">Password </label>
								</div>
								<div class="col-md-5">
									<input type="password" name="password" class="form-control" required>
								</div>
								<div class="col-md-2"></div>
							</div>
							<div class="form-group row">
								<div class="col-md-2"></div>
								<div class="col-md-8">
									<input type="submit" value="Login" class="form-control btn btn-info">
								</div>
								<div class="col-md-2"></div>
							</div>
							<div class="form-group row">
								<div class="col-md-12">
									<a href="#" class="close" data-dismiss="alert" area-label="close">&times;</a>${logmsg}
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
		<div class="col-md-2"></div>
	</div>
</body>
</html>