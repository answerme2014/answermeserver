$(document).ready(function() {
	var cid = 0;
	var good_item = 0;
	var address = $("img.photo").attr("src");
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
		cid = $(this).attr("id");
		$.ajax({
			type: "POST",
			url: "http://localhost/answer_me/home.php/coursePage/getCourseData",
			data: {"cid":cid},
			//dataType:"json",
			success: function(data) {
				var txt = "cid";
				txt += data.cid;
				$("div.right-content").attr("id", txt);
				$("span.class-name").text(data.course_name);
				$("#course-teacher").text(data.teacher);
				$("#course-place").text(data.course_place);
				$("#course-time").text(data.course_time);
				var src_addr = address + data.picture;
				$("img.photo").attr("src", src_addr);
				$("#good").text(data.like_number);
			}
		});

		var hw_info="<div class='tile hw-list hw-lists'><div class=title>第<span class=h-time></span>次作业</div><div class=h-c><div class=hw-detail></div><div class=hw-answer></div></div><div class=readmore><a>ReadMore...>> </a></div></div>";
		$("div.hw-list-info").children("div.hw-lists").remove();
		$.ajax({
			type:"GET",
			url:"http://localhost/answer_me/home.php/coursePage/getHomeworkData",
			data: {"cid":cid},
			dataType:"json",
			success: function(data) {
				var i = 0;
				for (i = 0; i < data.length; i++) {
					$("div.add-homework").before(hw_info);
					var hid = "h";
					hid += data[i].hid;
					$("div.hw-lists").last().attr("id", hid);
					var id = "#"+hid;
					$(id).find("div.hw-answer").after(data[i].content);
					$(id).find("div.title").find("span.h-time").text(data[i].order);
					var link = "HomeworkPage/index/hid/";
					link += data[i].hid;
					link += "/version/";
					link += data[i].version;
					$(id).find("a").attr("href", link);
				}
			}
		});
	});

	$("span.finish-bt").click(function() {
		var cid=$(this).parent().parent().attr("id");
		var parents=$(this).parent().parent();
		function rm(){
			$(this).parent().parent().remove();
		}
		$.ajax({
			type:"POST",
			url:"http://localhost/answer_me/home.php/PersonalPage/complete",
			data:{'cid':cid},
			dataType:"json",
			success: function(dataReturn) {
				if(dataReturn.status == 0) {
					alert("操作不成功！");
				} else if (dataReturn.status == 1) {
					window.location.reload();
				} else if (dataReturn.status == 2) {
					alert(dataReturn.msg);
					parents.remove();
				}
			}
		});
		
	});

	/* good */
	$("#good-img").click(function() {
		if (good_item == 0) {
			$("#good-img").css("color", "#dc143c");	
			good_item = 1;
		} else if (good_item == 1) {
			$("#good-img").css("color", "#16a085");
			good_item = 0;		
		}

		$.ajax({
			type: "POST",
			url: "http://localhost/answer_me/home.php/coursePage/likeCourse",
			data: {"cid":cid, "good":good_item},
			dataType: "json",
			success: function(data) {
				if (data.status == 1) {
					var sum = parseInt($("#good").text());
					if (good_item == 1) {
						sum += 1;
					} else if (good_item == 0) {
						sum -= 1;
					}
					$("#good").text(sum);
				} else if (data.status == 0) {
					alert("操作失败！");
				}				
			}
		});
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

	/* edit the course's teacher, time and place */
	$("a.edit").click(function() {
		var course_teacher = $("#course-teacher").text();
		var course_time = $("#course-time").text();
		var course_place = $("#course-place").text();
		var class_name = $("span.class-name").text();
		var txt = "<input id=class1>";
		var txt1 = "<input id=teacher1>";
		var txt2 = "<input id=place1>";
		var txt3 = "<input id=time1> <button class='btn btn-default' id=finish-edit>完成</button>";
		$("span.class-name").text("");
		$("span.class-name").append(txt);
		$("#class1").attr("value", class_name);
		$("#course-teacher").text("");
		$("#course-teacher").append(txt1);
		$("#teacher1").attr("value", course_teacher);
		$("#course-place").text("");
		$("#course-place").append(txt2);
		$("#place1").attr("value", course_place);
		$("#course-time").text("");
		$("#course-time").append(txt3);
		$("#time1").attr("value", course_time);	
		$("#finish-edit").css("color", "white");

		$("#finish-edit").click(function() {
			var course_teacher = $("#teacher1").val();
			var course_place = $("#place1").val();
			var course_time = $("#time1").val();
			var class_name = $("#class1").val();

			$.ajax({
				type: "POST",
				url: "http://localhost/answer_me/home.php/coursePage/changeCourseInfo",
				data: {"cid":r[2],"teacher":course_teacher,"course_place":course_place,"course_time":course_time},
				dataType: "json",
				success: function(data) {
					$("#class1").remove();
					$("#time1").remove();
					$("#place1").remove();
					$("#teacher1").remove();
					$("#finish-edit").remove();
					$("span.class-name").text(class_name);
					$("#course-teacher").text(course_teacher);
					$("#course-place").text(course_place);
					$("#course-time").text(course_time);
				}
			});
		});	
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