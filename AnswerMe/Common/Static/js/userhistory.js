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
             data: {flag:1},
             dataType: "json",
             
             success: function(data){
              $(".recordss").empty();

              var start = " <caption style='font-size:25px;font-weight:1px'>编辑历史</caption><tr class='record'><th class='record-item'>序号</th><th class='record-course-name'>课程</th><th class='record-lastedit'>最后编辑时间</th><th class='record-like'>获赞数❤</th></tr>";
                $(".recordss").append(start);
                if (data.status==1) {
                for ( var j = 0, l = data.courses.length; j < l; j++ ) {  
                    var time = j+1;
                    var records="<tr class='record'><th class='record-item'>"+time+"</th><th class='record-course-name'>"+data.courses[j].cid+"</th><th class='record-lastedit'>"+data.courses[j].update_time+"</th><th class='record-like'>"+data.courses[j].like_number+"</th></tr>"
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
             data: {flag:2},
             dataType: "json",
             success: function(data){
              $(".recordss").empty();
               var start = "<caption style='font-size:25px;font-weight:1px'>编辑历史</caption><tr class='record'><th class='record-item'>序号</th><th class='record-course-name'>课程</th><th class='record-course-hw'>作业次数</th><th class='record-lastedit'>最后编辑时间</th><th class='record-like'>获赞数❤</th></tr>";
               $(".recordss").append(start);
               if (data.status==1) {
                alert("sqdew");
                alert(data.homeworks.length);
             	for ( var j = 0, l = data.homeworks.length; j < l; j++ ) {  
                    var time = j+1;
                    var records="<tr class='record'><th class='record-item'>"+time+"</th><th class='record-course-name'>"+data.homeworks[j].cid+"</th><th class='record-course-hw'>"+data.homeworks[j].title+"</th><th class='record-lastedit'>"+data.homeworks[j].update_time+"</th><th class='record-like'>"+data.homeworks[j].like_number+"</th></tr>"
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