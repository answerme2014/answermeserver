$(document).ready(function(){
    var i = 0;
    //var username = $.cookie("username");
    $(".bianji button").click(function() {
        ClickBianji();
        $(this).css("background-color", "#00bb99")
    });
    $(".jubao button").click(function() {
        Clickjubao();
        $(this).css("background-color", "#00bb99")
    });
    $(".lishibanben button").click(function() {
        Clicklishibanben();
        $(this).css("background-color", "#00bb99")

    });
    $(".fui-heart").click(function(){
        i = i + 1;
        if(i%2 == 1) {
            $(this).css("color","#dc143c");
            $(".like-number").css("color", "#dc143c");
        }
        else {
            $(this).css("color","#00bb99");
            $(".like-number").css("color", "#00bb99");
        }  
        $(".like-number").text(function(){
     
            if(i%2 == 1){
                m = $(".like-number").text();
                return parseInt(m)+1;
            }
            else{
                m = $(".like-number").text();
                return parseInt(m)-1;
            }
        });

        //var like_number = parseInt($(".fui-heart").text());
    });
});


/**
 * 点击编辑按钮
 */
function ClickBianji() {
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
    if (username) {
        $.ajax({
            type: "GET",
            url: "test.json",
            data: {},
            dataType: "json",
            success: function(status) {
                htmlobj = $.ajax({url:"test.json", async:"false"});
                $(".t1").html(htmlobj.responseText);
            }
        });
    }
    if (!username) {
        alert("你需要登录才能进行这个操作！");
    }                
}