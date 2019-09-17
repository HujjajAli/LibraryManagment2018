<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="com.lms.model.*" %>
<%@ page import="com.lms.daoimplement.*" %>
<%@ page import="java.util.List"%>
<%@ page import="java.lang.*"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Book | LMS</title>

	<!-- JQuery Library -->
<script type="text/javascript" src="bootstrap/js/jquery-3.2.1.min.js"></script>
<!-- Bootstrap JavaScript Library -->
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<!-- Bootstrap CSS Library -->
<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">

</head>
<body>
<%Librarian loginuser  = (Librarian)request.getSession().getAttribute("loginUser");
  CategoryDaoImplement catdao = new CategoryDaoImplement();
  List<Category> categories = catdao.getAllCategory();
  request.setAttribute("catlist",categories);
  int intcat = Integer.parseInt(request.getParameter("c"));
  Category cat  = catdao.getCategory(intcat);
  String strcat = cat.getCategory();
%>

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
				<li><a href="#"><span class="glyphicon glyphicon-dashboard"></span> Dashboard</a></li>
				<li><a href="addbook.jsp"><span class="glyphicon glyphicon-book"></span> New Book</a></li>
				<li><a href="addcategory.jsp" ><span class="glyphicon glyphicon-edit"></span> Add Book Catogory</a></li>
				<li><a href="addauthor.jsp"><span class="glyphicon glyphicon-pencil"></span> New Author</a></li>
				<li><a href="addpublisher.jsp"><span class="glyphicon glyphicon-file"></span> New Publisher</a></li>
				<li><a href="registerationpage.jsp"><span class="glyphicon glyphicon-user"></span> New Staff</a></li>
				<li><a href="addmember.jsp"><span class="glyphicon glyphicon-plus"></span> New Member</a></li>
				<li><a href="issuebook.jsp"><span class="glyphicon glyphicon-plus"></span> Issue Book</a></li>
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
			<div class="panel panel-info">
				<div class="panel-heading" style="background:#464646">
					<h5 style="color:white"> <a href="index.jsp" style="color:white">Home</a> / <a href="#" style="color:white"><%out.print(strcat); %></a> / <a href="#" ><%out.print(request.getParameter("b"));%></a></h5>
				</div>
				<div class="panel-body">
					<table class="table table-hover">
						<tr>
							<td>Book</td>
							<td><%out.print(request.getParameter("b"));%></td>
						</tr>
						<tr>
							<td>Edition</td>
							<td><%out.print(request.getParameter("e"));%></td>
						</tr>
						<tr>
							<td>Category</td>
							<td><%out.print(strcat);%></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>

</body>
</html>