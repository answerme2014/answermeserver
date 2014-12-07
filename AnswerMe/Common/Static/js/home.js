 $(document).ready(function (){
  var a = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
  var b = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];

$("#searchcourse").click(function(){
var inputs = $("#search").value;// 提交输入框
        if (inputs == "")
　　{
　　　　　$("#search").value="输入不能为空!";

　　}
else{
  $.ajax({
             type: "GET",
             url: "test.json",
             data: {keyword:$("#search").val()},
             dataType: "json",
             success: function(list){
              if(list.length!=0){
              for ( var j = 0, l = list.length; j < l; j++ ) {  
                $(".coursetitle").eq(j).text = list[j].courseName+" "+list[j].school+list[j].college+" "+list[j].teacherName; 
                         $(".lasthw").eq(j).text = list[j].lasthw;     
                         $(".like").eq(j).text = list[j].like+"赞";
                         $(".follow").eq(j).text = list[j].follow+"关注";
                         $(".bookimg").eq(j).src = list[j].bookimg;
              }
               }
                          else{
                $(".not_found").css('display','block'); 
                $('.found').css('display','none'); 
              }
                      }
                  
         });
}
});

$("#searchhw").click(function(){
var inputs = $("#search").value;// 提交输入框
        if (inputs == "")
　　{
　　　　　$("#search").value="输入不能为空!";

　　}
else{
  $.ajax({
             type: "GET",
             url: "test.json",
             data: {keyword:$("#search").val()},
             dataType: "json",
             success: function(list){
              if(list.length!=0){
              for ( var j = 0, l = list.length; j < l; j++ ) {  
                $(".coursetitle").eq(j).text = list[j].courseName+" "+list[j].school+list[j].college+" "+list[j].teacherName; 
                         $(".lasthw").eq(j).text = list[j].targethw;     
                         $(".like").eq(j).text = list[j].like+"赞";
                         $(".follow").eq(j).text = list[j].follow+"关注";
                         $(".bookimg").eq(j).src = list[j].bookimg;
              }
               }
                          else{
                $(".not_found").css('display','block'); 
                $('.found').css('display','none'); 
              }
                      }
                  
         });
}
});

        $(".like").click(function(){
  $(this).text(function(){
    i = $(".like").index(this);
    b[i] = b[i]+1;
    if(b[i]%2 == 1){
      m = $(this).text();
      good1 = 1;
    return parseInt(m)+1+"赞";

  }
  else{
    m = $(this).text();
    good1 = 0;
    return parseInt(m)-1+"赞";
  }
 
  $.ajax({
             type: "GET",
             url: "test.json",
             data: {courseID:$("#courseid").val(),good:good1},
             dataType: "json",
             success: function(){
                         
                      }
                  
         });
});
});

        $(".follow").click(function(){
        
  $(this).text(function(){
    i = $(".follow").index(this);
    a[i] = a[i]+1;
    if( a[i]%2 == 1){
      m = $(this).text();
      follow1=1;
    return parseInt(m)+1+"关注";
  }
  else{
    m = $(this).text();
    follow1 = 0;
    return parseInt(m)-1+"关注";
  }
  });
   $.ajax({
             type: "GET",
             url: "test.json",
             data: {courseID:$("#courseid").val(),follow:follow1},
             dataType: "json",
             success: function(){
                         
                      }
                  
         });
});
});
