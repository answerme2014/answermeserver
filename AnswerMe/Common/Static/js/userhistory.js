$("li.time-list-item").click(function() {
	$("li.course-list-item").css("background-color", "#34495e");
	$(this).css("background", "transparent");
	$("td.record-course-name").click(function() {
	    $("td.record-course-name").css("color", "#fff");
	    $(this).css("color", "#1abc9c");
	});
});

$(document).ready(function(){
  
	 $('#course_edit').click(function(){
	 	$.ajax({
             type: "POST",
             url: "http://localhost/answer_me/home.php/HistoryPage/findhistory",
             data: {flag:2},
             dataType: "json",
             
             success: function(data){
              $(".recordss").empty();

              var start = " <caption style='font-size:25px;font-weight:1px'>编辑历史</caption><tr class='record'><th class='record-item'>序号</th><th class='record-course-name'>课程</th><th class='record-lastedit'>最后编辑时间</th><th class='record-like'>获赞数❤</th></tr>";
                $(".recordss").append(start);
                if (data.status==1) {
                for ( var j = 0, l = data.courses.length; j < l; j++ ) {  
                    var time = j+1;
                    var records="<tr class='record'><th class='record-item'>"+time+"</th><th class='record-course-name' href='http://localhost/answer_me/home.php/CoursePage?cid="+data.courses[j].cid+"&version="+data.courses[j].version+"'>"+data.courses[j].course_name+"</th><th class='record-lastedit'>"+data.courses[j].update_time+"</th><th class='record-like'>"+data.courses[j].like_number+"</th></tr>"
                    $(".recordss").append(records);
                      }
                    }
                      
                  },
                  error: function(){
                    alert("ajax访问失败！");
                }
         });
         });
	 $('#hw_edit').click(function(){
	 	$.ajax({
             type: "POST",
             url: "http://localhost/answer_me/home.php/HistoryPage/findhistory",
             data: {flag:1},
             dataType: "json",
             success: function(data){
              $(".recordss").empty();
               var start = "<caption style='font-size:25px;font-weight:1px'>编辑历史</caption><tr class='record'><th class='record-item'>序号</th><th class='record-course-name'>课程</th><th class='record-course-hw'>作业名称</th><th class='record-lastedit'>最后编辑时间</th><th class='record-like'>获赞数❤</th></tr>";
               $(".recordss").append(start);
               if (data.status==1) {
             	for ( var j = 0, l = data.homeworks.length; j < l; j++ ) {  
                    var time = j+1;
                    var records="<tr class='record'><th class='record-item'>"+time+"</th><th class='record-course-name' href='http://localhost/answer_me/home.php/CoursePage?cid="+data.homeworks[j].cid+"&version="+data.homeworks[j].version+"'>"+data.homeworks[j].course_name+"</th><th class='record-course-hw' href='http://localhost/answer_me/home.php/HomeworkPage/index/hid/"+data.homeworks[j].hid+"/version/"+data.homeworks[j].version+"'>"+data.homeworks[j].title+"</th><th class='record-lastedit'>"+data.homeworks[j].update_time+"</th><th class='record-like'>"+data.homeworks[j].like_number+"</th></tr>"
                    $(".recordss").append(records);
                      }
                    }
                      

                  },
                  error: function() {
                    alert("ajax访问失败！");
                }
         });
	 	 });
	 
	});