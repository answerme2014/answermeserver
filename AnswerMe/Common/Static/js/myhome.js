$(document).ready(function() {
	var good_item = 0;
	$("li.course-list-item").click(function() {
		$("li.course-list-item").css("background-color", "#34495e");
		$(this).css("background", "transparent");
		$("h4.course-name").css("color", "#fff");
		$(this).find("h4").css("color", "#19B68A");
		$("div.homework").find("ul.homework-list").css("display", "none");
		$("div.course-page").css("display", "inherit");
	});

	$("span.finish-bt").click(function() {
		var cid=$(this).parent().parent().attr("id");
		$.ajax({
			type:"POST",
			url:"http://localhost/answer_me/home.php/PersonalPage/complete",
			data:{'cid':cid},
			dataType:"json",
			success: function(dataReturn) {
				if(dataReturn.status == 0) {
					alert("操作不成功！");
				} else if (dataReturn.status == 1) {
					$(this).parent().parent().remove();
				} else if (dataReturn.status == 2) {
					alert(dataReturn.msg);
				}
			}
		});
		
	});

	$("#good-img").click(function() {
		if (good_item == 0) {
			var a = $("#good").text();
			var sum = 0;
			var j = 1;
			for ( var i = a.length - 1; i >= 0; i--) {
				sum += a[i] * j;
				j *= 10;
			}
			sum += 1;
			$("#good").text(sum);
			$("#good-img").css("color", "#dc143c");	
			good_item = 1;
		} else if (good_item == 1) {
			var a = $("#good").text();
			var sum = 0;
			var j = 1;
			for ( var i = a.length - 1; i >= 0; i--) {
				sum += a[i] * j;
				j *= 10;
			}
			sum -= 1;
			$("#good").text(sum);
			$("#good-img").css("color", "#16a085");
			good_item = 0;		
		}
	});

	$("#good-img").mouseover(function() {
		$("#good-img").css("color", "#dc143c");	
	});

	$("#good-img").mouseout(function() {
		if (good_item == 0) {
			$("#good-img").css("color", "#16a085");	
		} else if (good_item == 1) {
			$("#good-img").css("color", "#dc143c");	
		}
	});
});