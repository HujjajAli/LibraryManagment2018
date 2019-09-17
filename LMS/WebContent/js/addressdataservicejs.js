/**
 * 
 */

$(document).ready(function(){
	
	$.ajax({
		url:"AddressDataService",
		type:"Post",
		data:"action=country",
		success:function(data){
			$("#countries").html(data);
			console.log(data);
		}
	});
	
	$("#countries").click(function(){
		var country = $("#countries").val();
		console.log("You Choose ==  "+country);
		$.ajax({
			url:"AddressDataService",
			type:"Post",
			data:"action=sortaddress&find=province&country="+country,
			success:function(data){
				$("#provinces").html(data);
				console.log(data);
			}
		});
	});
	
	$("#provinces").click(function(){
		var province = $("#provinces").val();
		console.log("You Choose ==  "+province);
		$.ajax({
			url:"AddressDataService",
			type:"Post",
			data:"action=sortaddress&find=city&province="+province,
			success:function(data){
				$("#cities").html(data);
				console.log(data);
			}
		});
	});
	
});