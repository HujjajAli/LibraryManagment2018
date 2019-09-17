/**
 * 
 */

$(document).ready(function(){
	
	/*$("#bookvalue").click(function(){
		alert("an Alert");
	});*/
	
	function callbookdetails(category,publisher,author){
		console.log("Category>"+category+"===Publisher>"+publisher+"====Author>"+author);
		$.ajax({
			url:"BookIssueService",
			type:"POST",
			data:"action=findbook&category="+category+"&publisher="+publisher+"&author="+author,
			success:function(data){
				$("#bookvalue").html(data);
			}
		});
	}
	
	$("#categoryvalue").click(function(){
		var categoryv = $("#categoryvalue").val();
		var publisherv = $("#publishervalue").val();
		var authorv    = $("#authorvalue").val();
		callbookdetails(categoryv,publisherv,authorv);
	});
	
	$("#publishervalue").click(function(){
		var categoryv = $("#categoryvalue").val();
		var publisherv = $("#publishervalue").val();
		var authorv    = $("#authorvalue").val();
		callbookdetails(categoryv,publisherv,authorv);
	});
	
	$("#authorvalue").click(function(){
		var categoryv = $("#categoryvalue").val();
		var publisherv = $("#publishervalue").val();
		var authorv    = $("#authorvalue").val();
		callbookdetails(categoryv,publisherv,authorv);
	});
	
	/*$("#bookvalue").click(function(){
		var book = $("#bookvalue").val();
		console.log("You Choose :"+book);
		$.ajax({
			url:"BookIssueService",
			type:"POST",
			data:"action=findbookedition&book="+book,
			success:function(data){
				console.log(data);
				$("#editionvalue").html(data);
			}
		});
	});*/
	
	
	
});