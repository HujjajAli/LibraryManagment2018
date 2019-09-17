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
<!-- Ajax Call For Member Info Data -->
<script type="text/javascript" src="js/memberinfoservicejs.js"></script>

<title>Add Member | LMS</title>
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
						<h1>Add New Library Member</h1>
					</div>
					<div class="panel-body">
						<div class="form-group row">
							<div class="col-md-3">
								<label>Member</label>
							</div>
							<div class="col-md-9">
								<input type="text" name="member"  class="form-control" placeholder="Enter Member Name..." required>
							</div>
						</div>
						<div class="form-group row">
							<div class="col-md-3">
								<label>Father's Name</label>
							</div>
							<div class="col-md-9">
								<input type="text" name="father"  class="form-control" placeholder="Enter Member Fathername..." required>
							</div>
						</div>
						<div class="form-group row">
							<div class="col-md-3">
								<label>Gender</label>
							</div>
							<div class="col-md-9">
								<select name="gender" class="form-control" required>
									<option value="">Select Gender..</option>
									<option value="MALE">MALE</option>
									<option value="FEMALE">FEMALE</option>		
								</select>
							</div>
						</div>
						<div class="form-group row">
							<div class="col-md-3">
								<label>CNIC</label>
							</div>
							<div class="col-md-9">
								<input type="text" name="cnic"  class="form-control" placeholder="Enter CNIC Number" required>
							</div>
						</div>
						<div class="form-group row">
							<div class="col-md-3">
								<label>Roll No.</label>
							</div>
							<div class="col-md-9">
								<input type="number" name="rollNo"  class="form-control" placeholder="Enter Roll Number..." required>
							</div>
						</div>
						<div class="form-group row">
							<div class="col-md-3">
								<label>Batch</label>
							</div>
							<div class="col-md-9">
								<select name="batch" class="form-control" required>
									<option value="">Select Batch..</option>
									<option value="2k14">2k14</option>
									<option value="2k15">2k15</option>
									<option value="2k16">2k16</option>
									<option value="2k17">2k17</option>		
								</select>
							</div>
						</div>
						<div class="form-group row">
							<div class="col-md-3">
								<label>Faculty</label>
							</div>
							<div class="col-md-9">
								<select name="faculty"class="form-control" id="faculties">
									<option value="">Select Faculty or Institute</option>
									<option value="FASS">Faculty of Agriculture and Social Sciences</option>
									<option value="CPD">Faculty of Crop Production</option>
									<option value="CPT">Faculty of Crop Protection</option>
									<option value="AE">Faculty of Agriculture Engineering</option>
									<option value="IT">Information Technology Center</option>
									<option value="FST">Food Science and Technology</option>
								</select>
							</div>
						</div>
						<div class="form-group row">
							<div class="col-md-3">
								<label>Department</label>
							</div>
							<div class="col-md-9">
								<select name="department" class="form-control" id="departments">
									
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
										<input type="text" name="areaStreetHome"  class="form-control" placeholder="Enter Roll Number..." required>
									</div>
								</div>
							</div>
						</div>>
						<div class="form-group row">
							<div class="col-md-4">
							</div>
							<div class="col-md-4">
								<input type="submit" name="action" class="form-control btn-success" value="Save Member">
							</div>
							<div class="col-md-4">
								<input type="reset" value="Reset"  class="form-control btn-success">
							</div>
						</div>
					</div>
					<div class="panel-footer">
						<div class="alert alert-success text-uppercase fade in">
							<a href="#" class="close" data-dismiss="alert" area-label="close">&times;</a>${memmsg}
						</div>
					</div>
				</div>
			</form>
		</div>
					
	</div>

</body>
</html>