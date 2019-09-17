<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.lms.model.*" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%Member member =(Member)request.getAttribute("member"); 
Address ad =(Address)request.getAttribute("address");
String address = ad.getStreet_area_houseNo()+","+ad.getCity()+","+ad.getProvince()+","+ad.getCountry();
%>
<td colspan="3">
<div class='panel panel-success'>
	<div class='panel-heading'>
		<h5>Student Information</h5>
	</div>
	<div class='panel-body'>
		<div class='form-group row'>
			<div class='col-md-4'>
				<input type="text" value="<%out.print(member.getMember());%>" class="form-control" readonly>
			</div>
			<div class='col-md-4'>
				<input type="text" value="<%out.print(member.getFathername());%>" class="form-control" readonly>
			</div>
			<div class='col-md-4'>
				<input type="text" value="<%out.print(member.getGender());%>" class="form-control" readonly>
			</div>
		</div>
		<div class='form-group row'>
			<div class='col-md-4'>
				<input type="text" value="<%out.print(member.getCnic());%>" class="form-control" readonly>
			</div>
			<div class='col-md-4'>
				<input type="text" value="<%out.print(member.getNumborrowedbooks());%>" class="form-control" readonly>
			</div>
			<div class='col-md-4'>
				<input type="text" value="<%out.print(member.getFines());%>" class="form-control" readonly>
			</div>
		</div>
		<div class='form-group row'>
			<div class='col-md-12'>
				<input type="text" value='<%out.print(address);%>' class="form-control" readonly>
			</div>
		</div>
	</div>
</div>
<td>
</body>
</html>