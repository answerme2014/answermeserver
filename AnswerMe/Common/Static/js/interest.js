$(document).ready(function(){
	
	$("#btnComplete button").click(function (){
		complete();
	});


});

function complete() {
	var array= new Array();
	 $("input[name='box']").each(function(){
     if($(this).is(':checked')){
        array.push($(this).parent(".checkbox").prev().children(".cid").html());
    }
    });

	$.ajax({
		type: "POST",
		url: "http://localhost/answer_me/home.php/InterestPage/complete",
		data: {courselist: array},
		dataType: "json",
		success: function(data) {
            if (data.status == 1) {
            	alert("课程关注成功！");

            	window.location.href = "../PersonalPage";
            } else {
            	alert(data.msg);
            }
		},
		error: function(data) {
            alert("ajax访问失败");
		}
	});
}