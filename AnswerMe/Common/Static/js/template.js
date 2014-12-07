$(function(){
    $('#btnLogin').click(function(){
         $.ajax({
             type: "GET",
             url: "test.json",
             data: {username:$("#inputUsername").val(), password:$("#inputPassword").val()},
             dataType: "json",
             success: function(data){
                         $('.unloged').css('display','none'); 
                         $('.loged').css('display','block');    //清空resText里面的所有内容
                         $("#usersname").val() = data.username;
                         $("#like-num").val() = data.experience;
                      }
             error: function(){
                        alert("您输入的用户名或密码错误，请重新输入");
             }
         });
    });
});

$(function(){
    $('#exit').click(function(){
         $.ajax({
             type: "GET",
             url: "test.json",
             data: {userName:$("#usersname").val()},
             dataType: "json",
             success: function(status){
                         if(status == 1){
                            $('.unloged').css('display','block'); 
                         $('.loged').css('display','none');    //清空resText里面的所有内容
                         }
                         if(status == 0){
                             alert("未成功退出");
                      }
                  }
         });
    });
});

$(function(){
    $('#btnRegister').click(function(){
        if( $('#inputPassword1')!= $('#inputRepeatpassword')){
            alert("您输入的密码不相符，请重新输入");
            $('#inputPassword1').value=""; 
        }
        else{
         $.ajax({
             type: "GET",
             url: "test.json",
             data: {userName:$("#inputUsername1").val(),password:$("#inputPassword1").val(),email:$("#inputEmail").val(),school:$("#selectSchool").val(),college:$("#selectCollege").val(),profession:$("#selectMajor").val(),year:$("#selectYear").val()},
             dataType: "json",
             success: function(url){
                         location.href =url
                  }

         });
     }
    });
});