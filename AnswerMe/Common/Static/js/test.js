$(document).ready(function(){
	$('#submit').click(function(){
		//alert($("#data").val());
		//alert($("#url").val());
		//alert($("#method").val());
		$.ajax({
			type: $("#method").val(),
			url: $("#url").val(),
			data: $("#data").val(),
			dataType: "json",
			success: function(data) {
				$("#result").append("Result has print in console<br>");
	            console.log(data);
			},
			error: function(data) {
				alert("error");
	            $("#result").text(data);
			}
		});
	});
});