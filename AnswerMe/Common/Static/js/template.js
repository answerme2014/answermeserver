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
    var likenum = $.cookie("likenum");
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
                $.cookie("likenum", data.experience, {expires: 7, path: '/'});
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

                $('.unloged').removeClass("hidden");
                $(".loged").addClass("hidden");
            }
        },
        error: function() {
            alert("ajax访问失败！");
        }
    });
}

function register() {
    if( $('#inputUsername1').val()== "" || $('#inputPassword1').val()== "" || $("#inputPassword1").val()== "" || $("#inputEmail").val()== "" || $("#selectSchool").val()== "" || $("#selectCollege").val()== "" || $("#selectMajor").val()== "" || $("#selectYear").val()== ""){
        alert("您输入的信息不完整，请重新输入");
    } else if( $('#inputPassword1').val() != $('#inputRepeatpassword').val()){
        alert("您输入的密码不相符，请重新输入");
        $('#inputPassword1').value=""; 
    } else {
        $.ajax({
            type: "POST",
            url: "http://localhost/answer_me/home.php/MainNavigation/register",
            data: {username:$("#inputUsername1").val(),password:$("#inputPassword1").val(),email:$("#inputEmail").val(),school:$("#selectSchool").val(),college:$("#selectCollege").val(),profession:$("#selectMajor").val(),year:$("#selectYear").val()},
            dataType: "json",
            success: function(data) {
                alert();
                if (data.status == 1) {
                    //将用户名保存在cookie里
                    $.cookie("username", data.username, {expires: 7, path: '/'});
                    alert("注册成功！");

                    //将页面重定向到“感兴趣的课程页面”
                    window.location.href = "../InterestPage/" + data.uid;
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