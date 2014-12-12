$(document).ready(function() {
	var good_item = 0;

	$("ul.homework-list").children("#0").remove();
	var divs = $("ul.homework-list").children("li.homework-list-item");
	if (divs.length == 0) {
		$("ul.homework-list").css("display", "none");
		$("div.tips").css("display", "inherit");
	}
	
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

	/* search a course or a homework */
	$("div.todo-search").keydown(function(e) {
		var e = e || event;
		keycode = e.which || e.keyCode;
		if (keycode == 13) {
			var pro = $("input.course-search-field").val();
			if(pro == "") {
				alert("输入不能为空！");
			} else {
				var item = $("select.search-type").find("option:selected").attr("value");
				if(item == "course-tosearch") {
					$.ajax({
						type: "POST",
						url: "http://localhost/answer_me/home.php/SearchPage/searchcourse",
						data: {keyword:pro},
						dataType: "json",
						success: function(list) { 
							alert(list.courses[0].course_name);
							window.location.href="SearchPage";
						}
					});
				} else if (item == "problem-tosearch") {
					$.ajax({
						type: "POST",
						url: "http://localhost/answer_me/home.php/SearchPage/searchhw",
						data: {keyword:pro},
						dataType: "json",
						success: function(list) {
							alert(list.homework[0].title);
							window.location.href="SearchPage";
						}
					});
				}
			}
		}
	});
});