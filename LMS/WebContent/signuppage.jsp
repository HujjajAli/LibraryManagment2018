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

<title>Sign Up Page</title>
<script type="text/javascript">

var allowsubmit = false;
$(function(){
	//on keypress 
	$('#confpass').keyup(function(e){
		//get values 
		var pass = $('#pass').val();
		var confpass = $(this).val();
		
		//check the strings
		if(pass == confpass){
			//if both are same remove the error and allow to submit
			$('.error').text('');
			allowsubmit = true;
		}else{
			//if not matching show error and not allow to submit
			$('.error').text('Password not matching');
			allowsubmit = false;
		}
	});
	
	//jquery form submit
	$('#form').submit(function(){
	
		var pass = $('#pass').val();
		var confpass = $('#confpass').val();

		//just to make sure once again during submit
		//if both are true then only allow submit
		if(pass == confpass){
			allowsubmit = true;
		}
		if(allowsubmit){
			return true;
		}else{
			return false;
		}
	});
});
</script>

</script>
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
			<div class="jumbotron text-uppercase">
				<form action="RegistrationController" method="post" id="form">
					<div class="panel panel-info">
						<div class="panel-body">
							<div class="form-group row">
								<div class="col-md-2"></div>
								<div class="col-md-3">
									<label for="username" style="margin-top:8px">Password </label>
								</div>
								<div class="col-md-5">
									<input type="text" name="password" placeholder="Enter a Password" id="pass" class="form-control" required>
								</div>
								<div class="col-md-2"></div>
							</div>
							<div class="form-group row">
								<div class="col-md-2"></div>
								<div class="col-md-3">
									<label for="password" style="margin-top:8px">Conferm Password</label>
								</div>
								<div class="col-md-5">
									<input type="text" name="conpass" placeholder="Enter Conferm Password" id="confpass" class="form-control" required>
								</div>
								<div class="col-md-2"></div>
							</div>
							<div class="form-group row">
								<div class="col-md-2"></div>
								<div class="col-md-8">
									<input type="submit" value="Sign Up" class="form-control btn btn-info">
									<input type="hidden" name="event" value="signup">
								</div>
								<div class="col-md-2"></div>
							</div>
							<div class="form-group row">
								<div class="col-md-12">
									<a href="#" class="close" data-dismiss="alert" area-label="close">&times;</a><p class="error"></p>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		
		</div>
	</div>
</body>
</html>