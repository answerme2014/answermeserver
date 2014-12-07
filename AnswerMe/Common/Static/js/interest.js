$(document).ready(function(){
	$.ajax({
             type: "GET",
             url: "test.json",
             data: {},
             dataType: "json",
             success: function(data){
             	for(i=0;i<8;i++){
                    $(".bookName").eq(i).text = data.course[i].coursename;
                    $(".img-thumbnail").eq(i).src = data.course[i].bookimg;
                    $(".bookName").eq(i).id = data.course[i].courseid;
                      }
                  }
         });
	$("#btnComplete button").click(function (){
		complete();
	});


});

function complete() {
	var array= new Array(); 
	$("input[name='box'][checked]").each(function(){
    if (true == $(this).attr("checked")) {
    	var i = $(this).val();
           array.push($(".bookName").eq(i).id);
    }
    });

	$.ajax(function() {
		type: "POST",
		url: "",
		data: {courseidlist: array},
		dataType: "json",
		success: function(data) {

		},
		error: function(data) {

		}
	});
}