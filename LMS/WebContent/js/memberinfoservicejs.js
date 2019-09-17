/**
 * 
 */

$(document).ready(function(){
	
	$("#faculties").click(function(){
		var faculty = $("#faculties").val();
		console.log("You Choose ==  "+faculty);
		$.ajax({
			url:"MemberInfoService",
			type:"Post",
			data:"faculty="+faculty,
			success:function(data){
				$("#departments").html(data);
				console.log(data);
			}
		});
	});
	
	$("#batches").click(function(){
		var batch      = $("#batches").val();
		var department = $("#departments").val(); 
		console.log("You Choose ==  "+batch);
		console.log("and You Choose ==  "+department);
		$.ajax({
			url:"BookIssueService",
			type:"Post",
			data:"action=findmem&batch="+batch+"&department="+department,
			success:function(data){
				$("#rollNumbers").html(data);
				console.log(data);
			}
		});
	});
	
	$("#rollNumbers").click(function(){
		var rollNumber  = $("#rollNumbers").val();
		console.log("You Choose ==  "+rollNumber);
		$.ajax({
			url:"BookIssueService",
			type:"Post",
			data:"action=findmember&rollNumber="+rollNumber,
			success:function(data){
				$("#member").html(data);
				console.log(data);
			}
		});
	});
	
	$('#bookvalue').click(function(){
		console.log("an Console Function");
	});
});