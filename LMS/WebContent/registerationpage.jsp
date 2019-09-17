<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<!-- JQuery Library -->
<script type="text/javascript" src="bootstrap/js/jquery-3.2.1.min.js"></script>
<!-- Bootstrap JavaScript Library -->
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<!-- Bootstrap CSS Library -->
<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">

<!-- Ajax Call For Address Data -->
<script type="text/javascript" src="js/addressdataservicejs.js"></script>

<title>Librarian Registration Page</title>
</head>
<body>

<nav class="navbar navbar-inverse"><!-- Other Styeles default-->
		<div class="container-fluid">
			<div class="navbar-header">
				<a href="index.jsp" class="navbar-brand">LMS System</a>
			</div>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="index.jsp">Home</a></li>
				<li class="dropdown"><a href="index.jsp" class="dropdown-toggle" data-toggle="dropdown">Hujaj Ali <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a>Profile</a></li>
						<li><a>Logout</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</nav>
	<div class="container-fluid">
		<div class="col-md-3">
			<ul class="navbar navbar-default nav" style="height:100vh">
				<li><a href="index.jsp"><span class="glyphicon glyphicon-dashboard"></span> Dashboard</a></li>
				<li><a href="#"><span class="glyphicon glyphicon-plus"></span> New Book</a></li>
				<li><a href="addcategory.jsp" ><span class="glyphicon glyphicon-edit"></span>Add Book Catogory</a></li>
				<li><a href="addauthor.jsp"><span class="glyphicon glyphicon-pencil"></span> New Author</a></li>
				<li><a href="#"><span class="glyphicon glyphicon-list"></span>Post</a></li>
				<li><a href="#cats" data-toggle="collapse"><span class="glyphicon glyphicon-tasks"></span>Catogories</a>
					<ul id="cats" class="nav collapse">
						<li><a href="#"><div class="col-md-1"></div><span>Programming</span></a></li>
						<li><a href="#"><div class="col-md-1"></div>Computer</a></li>
					</ul>
				</li>
			</ul>
		</div>
		<div class="col-md-9">
			<form action="RegistrationController" method="post">
				<div class="panel panel-danger">
					<div class="panel-heading">
						<h1>Register a Librarian</h1>
					</div>
					<div class="panel-body">
						<div class="form-group row">
							<div class="col-md-3">
								<label>Name</label>
							</div>
							<div class="col-md-9">
								<input type="text" name="fullname" class="form-control" placeholder="Enter Full Name.." requird>
							</div>
						</div>
						<div class="form-group row">
							<div class="col-md-3">
								<label>Surname</label>
							</div>
							<div class="col-md-9">
								<input type="text" name="surname" class="form-control" placeholder="Enter Surname.." requird>
							</div>
						</div>
						<div class="form-group row">
							<div class="col-md-3">
								<label>CNIC #</label>
							</div>
							<div class="col-md-9">
								<input type="text" name="cnic" class="form-control" placeholder="Enter CNIC Number.." requird>
							</div>
						</div>
						<div class="form-group row">
							<div class="col-md-3">
								<label>Email</label>
							</div>
							<div class="col-md-9">
								<input type="email" name="email" class="form-control" placeholder="Enter Email Address.." requird>
							</div>
						</div>
						<div class="form-group row">
							<div class="col-md-3">
								<label>Joining Date</label>
							</div>
							<div class="col-md-9">
								<input type="date" name="dateoj" class="form-control" placeholder="Enter Date of Joining" requird>
							</div>
						</div>
						<div class="form-group row">
							<div class="col-md-3">
								<label>Gender</label>
							</div>
							<div class="col-md-9">
								<select name="gender" class="form-control" requird>
									<option value="">Select Your Gender</option>
									<option value="male">MALE</option>
									<option value="female">FEMALE</option>
								</select>
							</div>
						</div>
						<div class="form-group row">
							<div class="col-md-3">
								<label>Pay Scale</label>
							</div>
							<div class="col-md-9">
								<select name="payscale" class="form-control" >
									<option value="">Select Pay Scale</option>
									<option value="BS17">BS17</option>
									<option value="BS16">BS16</option>
									<option value="BS15">BS15</option>
									<option value="BS14">BS14</option>
					  			</select>
							</div>
						</div>
						<div class="form-group row">
							<div class="col-md-3">
								<label>Address</label>
							</div>
							<div class="col-md-9">
								<div class="form-group row">
									<div class="col-md-9">
										<label>Country</label>
										<select name="country" class="form-control" id="countries" requird>
											
										</select>
									</div>
									<div class="col-md-9">
										<label>Province</label>
										<select name="province" class="form-control" id="provinces" requird>
											
										</select>
									</div>
									<div class="col-md-9">
										<label>City</label>
										<select name="city" class="form-control" id="cities" required>
											
										</select>
									</div>
									<div class="col-md-9">
										<label>Area/Street/House#</label>
										<input type="text" name="areaStreetHome"  class="form-control" placeholder="Enter Area,Street,House" required>
										<input type="hidden" name="event" value="registration">
									</div>
								</div>
							</div>
						</div>
						<div class="form-group row">
							<div class="col-md-4">
							</div>
							<div class="col-md-4">
								<input type="submit" name="action" class="form-control btn-success" value="Register">
							</div>
							<div class="col-md-4">
								<input type="reset" value="Reset"  class="form-control btn-success">
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
		
</body>
</html>