$(document).ready(function(){
    var i = 1;
    //var username = $.cookie("username");
    $(".bianji button").click(function() {
        ClickBianji();
        //$(this).css("background-color", "#00bb99")
    });
    $(".jubao button").click(function() {
        Clickjubao();
        //$(this).css("background-color", "#00bb99")
    });
    $(".lishibanben button").click(function() {
        Clicklishibanben();
        //$(this).css("background-color", "#00bb99")

    });
    $(".fui-heart").click(function(){
        if(i == 1) {
            $(this).css("color","#dc143c");
            $(".like-number").css("color", "#dc143c");
        }
        else {
            $(this).css("color","#00bb99");
            $(".like-number").css("color", "#00bb99");
        }  

        var hid = parseInt($("div.header").attr("id"));
        $.ajax({
            type:"POST",
            url:"http://localhost/answer_me/home.php/SearchPage/like",
            data:{"flag1":2, "flag2":parseInt(i),"hid":hid},
            dataType:"json",
            success:function(dataReturn) {
                if (dataReturn.status == 1) {
                    if (i == 1) {
                        $(".like-number").text(parseInt($(".like-number").text())+1);
                    } else {
                        $(".like-number").text(parseInt($(".like-number").text())-1);
                    }
                } else {
                    alert(dataReturn.msg);
                }
            }
        });

        if(i == 1) i = 2;
        else i = 1;

        //var like_number = parseInt($(".fui-heart").text());
    });
});


/**
 * 点击编辑按钮
 */
function ClickBianji() {
    username=$.cookie("username");
    if (username) {
        $.ajax({
            type: "GET",
            url: "test.json",
            data: {},
            dataType: "json",
            success: function() {
            }
        });
    }
    if (!username) {
        alert("你需要登录才能进行这个操作！");
    }
}

/**
 * 点击编辑按钮
 */
function Clickjubao() {
    username=$.cookie("username");
    if (username) {
        $.ajax({
            type: "GET",
            url: "test.json",
            data: {},
            dataType: "json",
            success: function() {
            }
        });
    }
    if (!username) {
        alert("你需要登录才能进行这个操作！");
    }
}

/**
 * 点击编辑按钮
 */
function Clicklishibanben() {

}