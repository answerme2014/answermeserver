$(document).ready(function(){
    i = 0;
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
        if(i%2 == 1)
        $(this).css("color","#dc143c");
    else
        $(this).css("color","#00bb99");
     $(".fui-heart").children(".like-num").text(function(){
     
        if(i%2 == 1){
        m =      $(".fui-heart").children(".like-num").text();
        return parseInt(m)+1;
    }
    else{
        m =      $(".fui-heart").children(".like-num").text();
        return parseInt(m)-1;
    }
    });
});
});


/**
 * 点击编辑按钮
 */
function ClickBianji() {
    alert("你需要登录才能进行这个操作！");
}

/**
 * 点击编辑按钮
 */
function Clickjubao() {
    alert("你需要登录才能进行这个操作！");
}

/**
 * 点击编辑按钮
 */
function Clicklishibanben() {
    alert("你需要登录才能进行这个操作！");
}