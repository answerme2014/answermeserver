$(document).ready(function() {
    init();
    $('#login_').click(function() {
        login();
    });

    $('#logout_').click(function() {
        logout();
    });

    $('#register_').click(function() {
        register();
    });
});

function init() {
    var username = $.cookie("username");
    var likenum = $.cookie("experience");
    if (username&&likenum) {
      $("#usersname").text(username);
      $(".like-num").text(likenum);
      $('.loged').removeClass("hidden");
      $(".unloged").addClass("hidden");
    } else {
        ;
    }
}

function login() {
    var username = $("#inputUsername").val();
    var password = $("#inputPassword").val();
    alert();
    $.ajax({
        type: "POST",
        url: "http://localhost/answer_me/home.php/MainNavigation/login",
        data: {username:username, password:password},
        dataType: "json",
        success: function(data) {
            if (data.status == 1) {
                $("#usersname").text(data.username);
                $(".like-num").text(data.experience);

                $('.loged').removeClass("hidden");
                $(".unloged").addClass("hidden");
                
                
                //将用户名保存在cookie里
                $.cookie("username", data.username, {expires: 7, path: '/'});
                $.cookie("experience", data.experience, {expires: 7, path: '/'});
            } else {
                alert(data.msg);
            }
        },
        error: function() {
            alert("ajax访问失败！");
        }
    });
}

function logout() {
    $.ajax({
        type: "POST",
        url: "http://localhost/answer_me/home.php/MainNavigation/logout",
        dataType: "json",
        success: function(data){
           if(data.status == 1){
                //清除cookie
                $.cookie('username', null, {expires: -1, path: '/'});
                $.cookie("experience", null, {expires: -1, path: '/'});

                $('.unloged').removeClass("hidden");
                $(".loged").addClass("hidden");
            }
        },
        error: function() {
            alert("ajax访问失败！");
        }
    });
}
function valid_username(user) {
        var patten = /^[a-zA-Z0-9_]{1,16}$/;
        if( patten.test(user)){
               return true;
        }
        return false;
}

function valid_email(email) {
        var patten = new RegExp(/^[a-z0-9_\-]+(\.[_a-z0-9\-]+)*@([_a-z0-9\-]+\.)+([a-z]{2}|aero|arpa|biz|com|coop|edu|gov|info|int|jobs|mil|museum|name|nato|net|org|pro|travel)$/);
        return patten.test(email);
}

function valid_password(pass) {
        var reg = /^[a-zA-Z0-9]{5,17}$/;
        if( reg.test(pass)){
               return true;
        }
        return false;
}

function register() {
    var user11=$.trim($("#inputUsername1").val());
    var email=$.trim($("#inputEmail").val());
    var pass11=$.trim($("#inputPassword1").val());
     if( $('#inputUsername1').val()== "" || $('#inputPassword1').val()== "" || $("#inputRepeatpassword").val()== "" || $("#inputEmail").val()== "" || $("#selectSchool").val()== "" || $("#selectCollege").val()== "" || $("#selectMajor").val()== "" || $("#selectYear").val()== ""){
         alert("您输入的信息不完整，请重新输入");
     } else if( $('#inputPassword1').val() != $('#inputRepeatpassword').val()){
         alert("您输入的密码不相符，请重新输入");
         $('#inputPassword1').value=""; 
         $("#inputRepeatpassword").value= "";
     }  else if(!valid_username(user11)){
         alert("您输入的用户名有误，请重新输入");
         $('#inputUsername1').value=""; 
     } else if(!valid_password(pass11)){
         alert("您输入的密码格式有误，请输入6-18位的数字或字母");
         $('#inputPassword1').value=""; 
         $("#inputRepeatpassword").value= "";
     } else if(!valid_email(email)){
         alert("您输入的邮箱格式有误，请重新输入");
         $('#inputEmail').value=""; 
     } else {
        $.ajax({
            type: "POST",
            url: "http://localhost/answer_me/home.php/MainNavigation/register",
            data: {username:$("#inputUsername1").val(),password:$("#inputPassword1").val(),email:$("#inputEmail").val(),school:$("#selectSchool").val(),college:$("#selectCollege").val(),profession:$("#selectMajor").val(),year:$("#selectYear").val()},
            dataType: "json",
            success: function(data) {
                if (data.status == 1) {
                    //将用户名保存在cookie里
                    $.cookie("username", data.username, {expires: 7, path: '/'});
                    $.cookie("experience", data.experience, {expires: 7, path: '/'});
                    alert("注册成功！");

                    //将页面重定向到“感兴趣的课程页面”
                    window.location.href = "../InterestPage";
                } else {
                    alert(data.msg);
                }
            },
            error: function() {
                alert("ajax访问失败！");
            }
        });
      }
}