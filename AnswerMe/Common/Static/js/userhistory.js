$("li.time-list-item").click(function() {
	$("li.course-list-item").css("background-color", "#34495e");
	$(this).css("background", "transparent");
	$("td.record-course-name").click(function() {
	    $("td.record-course-name").css("color", "#fff");
	    $(this).css("color", "#1abc9c");
	});
});

$(document).ready(function(){
	 $('#weekly').click(function(){
	 	$.ajax({
             type: "GET",
             url: "test.json",
             data: {timestatus:1},
             dataType: "json",
             success: function(data){
                
             	for ( var j = 0, l = data.length; j < l; j++ ) {  
  
                         $(".record-item").eq(j+1).text = j+1; 
                         $(".record-course-name").eq(j+1).text = data[j].coursename;     
                         $(".record-course-hw").eq(j+1).text = data[j].coursehw;
                         $(".record-lastedit").eq(j+1).text = data[j].lastedit;
                         $(".record-like").eq(j+1).text = data[j].like;
                      }
                 
              }
             
         });
	 	 });
	 $('#monthly').click(function(){
	 	$.ajax({
             type: "GET",
             url: "test.json",
             data: {timestatus:2},
             dataType: "json",
             success: function(data){
             	for ( var j = 0, l = data.length; j < l; j++ ) {  
  
                         $(".record-item").eq(j+1).text = j+1; 
                         $(".record-course-name").eq(j+1).text = data[j].coursename;     
                         $(".record-course-hw").eq(j+1).text = data[j].coursehw;
                         $(".record-lastedit").eq(j+1).text = data[j].lastedit;
                         $(".record-like").eq(j+1).text = data[j].like;
                      }
                  }
         });
	 	 });
	 $('#halfyearly').click(function(){
	 	$.ajax({
             type: "GET",
             url: "test.json",
             data: {timestatus:3},
             dataType: "json",
             success: function(data){
             	for ( var j = 0, l = data.length; j < l; j++ ) {  
  
                         $(".record-item").eq(j+1).text = j+1; 
                         $(".record-course-name").eq(j+1).text = data[j].coursename;     
                         $(".record-course-hw").eq(j+1).text = data[j].coursehw;
                         $(".record-lastedit").eq(j+1).text = data[j].lastedit;
                         $(".record-like").eq(j+1).text = data[j].like;
                      }
                  }
         });
	 	 });
	 $('#yearly').click(function(){
	 	$.ajax({
             type: "GET",
             url: "test.json",
             data: {timestatus:4},
             dataType: "json",
             success: function(data){
             	for ( var j = 0, l = data.length; j < l; j++ ) {  
  
                         $(".record-item").eq(j+1).text = j+1; 
                         $(".record-course-name").eq(j+1).text = data[j].coursename;     
                         $(".record-course-hw").eq(j+1).text = data[j].coursehw;
                         $(".record-lastedit").eq(j+1).text = data[j].lastedit;
                         $(".record-like").eq(j+1).text = data[j].like;
                      }
                  }
         });
	 	 });
	 $('#allly').click(function(){
	 	$.ajax({
             type: "GET",
             url: "test.json",
             data: {timestatus:5},
             dataType: "json",
             success: function(data){
             	for ( var j = 0, l = data.length; j < l; j++ ) {  
  
                         $(".record-item").eq(j+1).text = j+1; 
                         $(".record-course-name").eq(j+1).text = data[j].coursename;     
                         $(".record-course-hw").eq(j+1).text = data[j].coursehw;
                         $(".record-lastedit").eq(j+1).text = data[j].lastedit;
                         $(".record-like").eq(j+1).text = data[j].like;
                      }
                  }
         });
	 	 });
	});