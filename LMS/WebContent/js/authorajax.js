/**
 * 
 */

$(document).ready(function(){
	$("#authorsaveevent").click(function(){	
		var author          = $("#author").val();
		var country   = $("#authorcountry").val();
		var msg = "";
		$.ajax({
			type:"POST",
			url:"CategoryController",
			data:"action=categorysave&author="+author+"&country="+country,
			success:function(data){
				msg = data
			}
		});
	});
	$("#msg").html(msg);
});