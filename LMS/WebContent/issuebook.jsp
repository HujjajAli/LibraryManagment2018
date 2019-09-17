<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.lms.model.*" %>
<%@ page import="com.lms.daoimplement.*" %>
<%@ page import="java.util.List" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
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
<!-- Ajax Call for Book Issue Details -->
<script type="text/javascript" src="js/bookissueservice.js"></script>
<!-- Ajax Call For Member Info Data -->
<script type="text/javascript" src="js/memberinfoservicejs.js"></script>

<title>LMS | Issue Book</title>
</head>
<body>
<%
Librarian loginuser  =(Librarian)request.getSession().getAttribute("loginUser");
CategoryDaoImplement catdao = new CategoryDaoImplement();
List<Category> categories = catdao.getAllCategory();
request.setAttribute("catlist",categories);
PublisherDaoImplement pubdao = new PublisherDaoImplement();
List<Publisher> publishers = pubdao.getAllPublisher();
request.setAttribute("publist",publishers);
AuthorDaoImplement authdao = new AuthorDaoImplement();
List<Author> authors = authdao.getAllAuthors();
request.setAttribute("authlist",authors);
%>
<nav class="navbar navbar-inverse"><!-- Other Styeles default-->
		<div class="container-fluid">
			<div class="navbar-header">
				<a href="index.jsp" class="navbar-brand">LMS System</a>
			</div>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="index.jsp">Home</a></li>
				<li class="dropdown"><a href="index.jsp" class="dropdown-toggle" data-toggle="dropdown">hello<span class="caret"></span></a>
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
				<li><a href="#"><span class="glyphicon glyphicon-dashboard"></span> Dashboard</a></li>
				<li><a href="addbook.jsp"><span class="glyphicon glyphicon-book"></span> New Book</a></li>
				<li><a href="addcategory.jsp" ><span class="glyphicon glyphicon-edit"></span> Add Book Catogory</a></li>
				<li><a href="addauthor.jsp"><span class="glyphicon glyphicon-pencil"></span> New Author</a></li>
				<li><a href="addpublisher.jsp"><span class="glyphicon glyphicon-file"></span> New Publisher</a></li>
				<li><a href="registerationpage.jsp"><span class="glyphicon glyphicon-user"></span> New Staff</a></li>
				<li><a href="addmember.jsp"><span class="glyphicon glyphicon-plus"></span> New Member</a></li>
				<li><a href="bookdetails.jsp"><span class="glyphicon glyphicon-plus"></span> Book Details</a></li>
				<li><a href="#cats" data-toggle="collapse"><span class="glyphicon glyphicon-tasks"></span> Books</a>
					<ul id="cats" class="nav collapse" style="background-color:#D9EDF7">
					   <c:forEach var="row" items="${catlist}">
							<li><a href="#"><div class="col-md-1"></div><span> <c:out value="${row.category}"></c:out></span></a></li>
						</c:forEach>
					</ul>
				</li>
			</ul>
		</div>
		<div class="col-md-9">
			<div class="panel panel-info">
				<div class="panel-heading">
					<h4>Issue Book To Member</h4>
				</div>
				<div class="panel-body">
					<form action="#">
						<table class="table table-strip">
							<tr>
								<th colspan="3">Book Details:</th>
							</tr>
							<tr>
								<td>
									<select id="categoryvalue" name="h" class="form-control" required>
											<option value="">Select Category</option>
										<c:forEach var="row" items="${catlist}">
											<option value="${row.id}">${row.category}</option>
										</c:forEach>
									</select>
								</td>
								<td>
									<select id="publishervalue" class="form-control">
											<option value="">Select Publisher</option>
										<c:forEach var="row" items="${publist}">
											<option value="${row.id}">${row.publisher}</option>
										</c:forEach>
									</select>
								</td>
								<td>
									<select id="authorvalue" class="form-control">
											<option value="">Select Author</option>
										<c:forEach var="row" items="${authlist}">
											<option value="${row.id}">${row.author}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<select id="bookvalue" name="book" class="form-control">
										<option>Select Book</option>
									</select>
								</td>
								<td colspan="2">
									<select id="editionvalue" name="edition" class="form-control">
										<option>Select Edition</option>
										<option value="1st">1st</option>
										<option value="2nd">2nd</option>
										<option value="3rd">3rd</option>
										<option value="4th">4th</option>
										<option value="5th">5th</option>
										<option value="6th">6th</option>
										<option value="7th">7th</option>
										<option value="8th">8th</option>
										<option value="9th">9th</option>
										<option value="10th">10th</option>
									</select>
								</td>
							</tr>
							<tr>
								<th colspan="3">Student Details:</th>
							</tr>
							<tr>
								<td colspan="1">
									<select name="faculty"class="form-control" id="faculties">
										<option value="">Select Faculty or Institute</option>
										<option value="FASS">Faculty of Agriculture and Social Sciences</option>
										<option value="CPD">Faculty of Crop Production</option>
										<option value="CPT">Faculty of Crop Protection</option>
										<option value="AE">Faculty of Agriculture Engineering</option>
										<option value="IT">Information Technology Center</option>
										<option value="FST">Food Science and Technology</option>
									</select>
								</td>
								<td colspan="2">
									<select name="department" class="form-control" id="departments">
									
									</select>
								</td>
							</tr>
							<tr>
								<td colspan="1">
									<select name="batch"  class="form-control" id="batches">
										<option value="">Select Batch..</option>
										<option value="2k14">2k14</option>
										<option value="2k15">2k15</option>
										<option value="2k16">2k16</option>
										<option value="2k17">2k17</option>		
									</select>
								</td>
								<td colspan="2">
									<select name="rollNo" class="form-control" id="rollNumbers">
										<option>Select Roll Number</option>
									</select>
								</td>
							</tr>
							<tr id="member">
								<!-- here -->
								<td colspan="3">
										<div class='panel panel-success'>
											<div class='panel-heading'>
												<h5>Student Information</h5>
											</div>
											<div class='panel-body'>
												<div class='form-group row'>
													<div class='col-md-4'>
														<input type="text" placeholder="Student Name" class="form-control" readonly>
													</div>
													<div class='col-md-4'>
														<input type="text" placeholder="Fathername" class="form-control" readonly>
													</div>
													<div class='col-md-4'>
														<input type="text" placeholder="Gender" class="form-control" readonly>
													</div>
												</div>
												<div class='form-group row'>
													<div class='col-md-4'>
														<input type="text" class="form-control" placeholder="CNIC Number" readonly>
													</div>
													<div class='col-md-4'>
														<input type="text" value="" class="form-control" placeholder="Number of Borrwed Books" readonly>
													</div>
													<div class='col-md-4'>
														<input type="text"  class="form-control" placeholder="Fines" readonly>
													</div>
												</div>
												<div class='form-group row'>
													<div class='col-md-12'>
														<input type="text"  class="form-control" placeholder="Address" readonly>
													</div>
												</div>
											</div>
										</div>
								<td>
								<!-- here -->
							</tr>
							<tr>
								<td colspan="1">
									<input type="submit" value="Issue Book"  class="form-control btn-success">
								</td>
								<td colspan="2">
									<input type="reset" value="Reset"  class="form-control btn-success">
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>	
		</div>
	</div>

</body>
</html>