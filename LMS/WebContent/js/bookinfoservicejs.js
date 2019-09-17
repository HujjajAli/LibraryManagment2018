/**
 * 
 */

$(document).ready(function(){
	$.ajax({
		type:"POST",
		url:"BookInfoService",
		data:"action=categories",
		success:function(data){
			$("#categories").html(data);
		}
	});
	
	$.ajax({
		type:"POST",
		url:"BookInfoService",
		data:"action=authors",
		success:function(data){
			$("#authors").html(data);
		}
	});
	
	$.ajax({
		type:"POST",
		url:"BookInfoService",
		data:"action=publisher",
		success:function(data){
			$("#publisher").html(data);
		}
	});
});