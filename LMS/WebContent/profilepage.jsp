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
<title>Profile Page Of Librarian</title>

	<!-- JQuery Library -->
<script type="text/javascript" src="bootstrap/js/jquery-3.2.1.min.js"></script>
<!-- Bootstrap JavaScript Library -->
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<!-- Bootstrap CSS Library -->
<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
</head>

<body>
<%Librarian loginuser  =(Librarian)request.getSession().getAttribute("loginUser");
  MemberDaoImplement memberdao = new MemberDaoImplement(); 
  List<Member> members = memberdao.getAllMembers();
  request.setAttribute("memlist",members);
  BookDaoImplement bookdao = new BookDaoImplement();
  List<Book> books = bookdao.getAllBooks();
  request.setAttribute("booklist",books);
  CategoryDaoImplement catdao = new CategoryDaoImplement();
  List<Category> categories = catdao.getAllCategory();
  request.setAttribute("catlist",categories);
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
				<li><a href="index.jsp"><span class="glyphicon glyphicon-dashboard"></span> Dashboard</a></li>
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
			<div class="row">
				<div class="panel panel-info">
				<div class="panel-heading">
					<h4>Libarary Members</h4>
				</div>
				<div class="panel-body">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>Name</th>
								<th>Fathername</th>
								<th>Gender</th>
								<th>Roll#</th>
								<th>Department</th>
								<th>CNIC#</th>
								<th>Borrowed Books</th>
								<th>Fine</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="row" items="${memlist}">
								<tr>
									<td><c:out value="${row.member}"></c:out></td>
									<td><c:out value="${row.fathername}"></c:out></td>
									<td><c:out value="${row.gender}"></c:out></td>
									<td><c:out value="${row.rollNo}"></c:out></td>
									<td><c:out value="${row.department}"></c:out></td>
									<td><c:out value="${row.cnic}"></c:out></td>
									<td><c:out value="${row.numborrowedbooks}"></c:out></td>
									<td><c:out value="${row.fines}"></c:out></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			</div>
			<div class="row">
				<div class="col-md-9">
					<div class="panel panel-info">
						<div class="panel-heading">
							<h4>Books</h4>
						</div>
						<div>
							<table class="table table-hover">
								<thead>
									<tr>
										<th>Title</th>
										<th>Edition</th>
										<th>Pages</th>
										<th>Detail</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="row" items="${booklist}">
										<tr>
											<td><c:out value="${row.book}"></c:out></td>
											<td><c:out value="${row.edition}"></c:out></td>
											<td><c:out value="${row.pages}"></c:out></td>
											<td><a href="viewbook.jsp?b=${row.book}&e=${row.edition}&p=${row.pages}&c=${row.category}">View</a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
				 </div>
			   </div>
			   <div class="col-md-3">
					<div class="panel panel-info">
						<div class="panel-heading">
							<h4>Categories</h4>
						</div>
						<div class="panel-body">
							<ul class="list-group">
								<c:forEach var="row" items="${catlist}">
									<a href="#"><li class="list-group-item"><c:out value="${row.category}"></c:out></li></a>
								</c:forEach>
							</ul>
						</div>
				 </div>
			   </div>
			   		
		</div>
	</div>
</body>
</html>