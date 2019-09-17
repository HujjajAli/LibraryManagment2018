<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>LMS | Add Author</title>

<!-- JQuery Library -->
<script type="text/javascript" src="bootstrap/js/jquery-3.2.1.min.js"></script>
<!-- Bootstrap JavaScript Library -->
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<!-- Bootstrap CSS Library -->
<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
</head>
<body>

	<nav class="navbar navbar-inverse"><!-- Other Styeles default-->
		<div class="container-fluid">
			<div class="navbar-header">
				<a href="index.jsp" class="navbar-brand">LMS System</a>
			</div>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="index.jsp">Home</a></li>
				<li class="dropdown"><a href="menu.html" class="dropdown-toggle" data-toggle="dropdown">Hujaj Ali <span class="caret"></span></a>
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
				<li><a href="addbook.jsp"><span class="glyphicon glyphicon-plus"></span> New Book</a></li>
				<li><a href="addcategory.jsp" ><span class="glyphicon glyphicon-edit"></span> Add Book Catogory</a></li>
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
			<form action="InsertController" method="post">
				<div class="panel panel-danger">
					<div class="panel-heading">
						<h1>Add New Author</h1>
					</div>
					<div class="panel-body">
						<div class="form-group row">
							<div class="col-md-3">
								<label>Author</label>
							</div>
							<div class="col-md-9">
								<input type="text" name="author"  class="form-control" placeholder="Enter Author Name..." required>
							</div>
						</div>
						<div class="form-group row">
							<div class="col-md-3">
								<label>Gender</label>
							</div>
							<div class="col-md-9">
								<select  name="gender" class="form-control" required>
									<option value="">Select Author Gender...</option>
									<option value="MALE">MALE</option>
									<option value="FEMALE">FEMALE</option>
								</select>
							</div>
						</div>
						<div class="form-group row">
							<div class="col-md-3">
								<label>Date of Birth</label>
							</div>
							<div class="col-md-9">
								<input type="date" name="authordob" placeholder="Choose Date..." class="form-control">
							</div>
						</div>
						<div class="form-group row">
							<div class="col-md-3">
								<label>Life Status</label>
							</div>
							<div class="col-md-9">
								<select  name="lifestatus" class="form-control" required>
									<option value="">Choose Life Status...</option>
									<option value="Alive">Alive</option>
									<option value="Died">Died</option>
								</select>
							</div>
						</div>
						<div class="form-group row">
							<div class="col-md-3">
								<label>Country</label>
							</div>
							<div class="col-md-9">
								<select  name="authorcountry" class="form-control" required>
									<option value="">Choose Country...</option>
									<option value="Pakistan">Pakistan</option>
									<option value="India">India</option>
									<option value="Iran">Iran</option>
									<option value="Japan">Japan</option>
									<option value="USA">USA</option>
									<option value="England">England</option>
								</select>
							</div>
						</div>
						<div class="form-group row">
							<div class="col-md-4">
							</div>
							<div class="col-md-4">
								<input type="submit" name="action" value="Save Author" class="form-control btn-success">
							</div>
							<div class="col-md-4">
								<input type="reset" value="Reset"  class="form-control btn-success">
							</div>
						</div>
					</div>
					<div class="panel-footer text-lowercase">
						 <div class="alert alert-success text-uppercase fade in">
							<a href="#" class="close" data-dismiss="alert" area-label="close">&times;</a>${authmsg}
						</div>
					</div>
				</div>
				
			</form>
		</div>
	</div>

</body>
</html>