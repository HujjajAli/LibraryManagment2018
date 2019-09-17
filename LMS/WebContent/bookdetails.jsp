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

<title>LMS | View Book Details </title>
</head>
<body>
<%
Librarian loginuser  =(Librarian)request.getSession().getAttribute("loginUser");
AuthorDaoImplement authdao = new AuthorDaoImplement();
List<Author> authors = authdao.getAllAuthors();
request.setAttribute("authlist",authors);
CategoryDaoImplement catdao = new CategoryDaoImplement();
List<Category> categories = catdao.getAllCategory();
request.setAttribute("catlist",categories);
PublisherDaoImplement pubdao = new PublisherDaoImplement();
List<Publisher> publishers = pubdao.getAllPublisher();
request.setAttribute("publist",publishers);
%>
	<nav class="navbar navbar-inverse"><!-- Other Styeles default-->
		<div class="container-fluid">
			<div class="navbar-header">
				<a href="index.jsp" class="navbar-brand">LMS System</a>
			</div>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="index.jsp">Home</a></li>
				<li class="dropdown"><a href="index.jsp" class="dropdown-toggle" data-toggle="dropdown"><%out.print(loginuser.getLibrarian());%><span class="caret"></span></a>
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
					<ul id="cats" class="nav collapse" style="background-color:#222222">
					   <c:forEach var="row" items="${catlist}">
							<li><a href="#"><div class="col-md-1"></div><span> <c:out value="${row.category}"></c:out></span></a></li>
						</c:forEach>
					</ul>
				</li>
			</ul>
		</div>
		<div class="col-md-9">
			<div class="panel-group" id="accord1">
		<div class="panel panel-success">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a href="#categoryaccord" data-parent="#accord1" data-toggle="collapse">Show All Categories</a>
				</h4>
			</div>
			<div id="categoryaccord" class="panel-collapse collapse">
				<div class="panel-body">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>Category</th>
								<th>Description</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="row" items="${catlist}">
								<tr>
									<td><c:out value="${row.category}"></c:out></td>
									<td><c:out value="${row.discription}"></c:out></td>
								</tr>	
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		
		<div class="panel panel-success">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a href="#authoraccord" data-parent="#accord1" data-toggle="collapse"> Show All Authors </a>
					</h4>
				</div>
				<div id="authoraccord"  class="panel-collapse collapse in">
					<div class="panel-body">
						<table class="table table-hover">
							<thead>
								<tr>
									<th>Author</th>
									<th>Gender</th>
									<th>D.O.B</th>
									<th>Country</th>
									<th>Life Status</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="row" items="${authlist}">
									<tr>
										<td><c:out value="${row.author}"></c:out></td>
										<td><c:out value="${row.gender}"></c:out></td>
										<td><c:out value="${row.dob}"></c:out></td>
										<td><c:out value="${row.country}"></c:out></td>
										<td><c:out value="${row.lifestatus}"></c:out></td>
									</tr>	
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
		</div>
		
		<div class="panel panel-success">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a href="#publisheraccord" data-parent="#accord1" data-toggle="collapse"> Show All Publisher </a>
				</h4>
			</div>
			<div id="publisheraccord"  class="panel-collapse collapse">
				<div class="panel-body">
						<table class="table table-hover">
							<thead>
								<tr>
									<th>Publisher</th>
									<th>Founding Date</th>
									<th>Country</th>
									<th>Books in Library</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="row" items="${publist}">
									<tr>
										<td><c:out value="${row.publisher}"></c:out></td>
										<td><c:out value="${row.foundingDate}"></c:out></td>
										<td><c:out value="${row.country}"></c:out></td>
										<td><c:out value="${row.noOfBooks}"></c:out></td>
									</tr>	
								</c:forEach>
							</tbody>
						</table>
				</div>
			</div>
		</div>
	</div>
		</div>
	</div>
	<!-- at this -->
	
</body>
</html>