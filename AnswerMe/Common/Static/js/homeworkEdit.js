//编辑器js
var ue = UE.getEditor('editor',{
    toolbars: [
            ['source', '|', 'undo', 'redo', '|',
            'bold', 'italic', 'underline',  'removeformat',  'pasteplain', '|',
            'forecolor', 'backcolor', 'insertorderedlist', 'insertunorderedlist', '|',
            'customstyle', 'paragraph', 'fontfamily', 'fontsize', '|',
            'justifyleft', 'justifycenter', 'justifyright', 'justifyjustify'
            ],
            ['link', 'unlink', 'anchor','|','imagenone', 'imageleft', 'imageright', 'imagecenter', '|',
            'simpleupload', 'insertimage', 'scrawl',  'insertcode','template', '|',
            'inserttable', 'deletetable', 'insertparagraphbeforetable', 'insertrow', 'deleterow', 'insertcol', 'deletecol',
            'mergecells', 'mergeright', 'mergedown', 'splittocells', 'splittorows', 'splittocols', '|',
            'preview', 'searchreplace','spechars', 'kityformula']
    ]});

var form = document.getElementById('form');

var kfSubmit = function(){
    ue.getKfContent(function(content){
        form.submit();
    })
}
function edit(t){
        //alert("click");
        var liList=$("ul.allHomeworks").children();
        //alert(liList.length);
        liList.removeClass("editing");
        thisLi=$(t).parent();
        thisLi.addClass("editing");
        //some Ajax to sever
}
function addone(t){
    var num=parseInt($(t).parent().find("span.num").text());
    //alert(num);
    $(t).parent().before('<li class><span class="fui-triangle-right-large"></span><span class="homeworkName">第 <span class="num">'+String(num)+'</span>次作业</span> <span class="fui-plus add"  onclick="addone(this)"></span><span class="fui-new edit" onclick="edit(this)"></span></li>');
    var now=$(t).parent();
    while(1){
        var onenum=parseInt(now.find("span.num").text());
        //alert(onenum);
        now.find("span.num").text(String(onenum+1));
        now=now.next();
        if(now.hasClass("last"))
            break;
    }
}
//动画js
$(document).ready(function(){
    $(".addnew").click(function(){
        var lastnum=$(this).parent().prev().find("span.num").text();
        var num= parseInt(lastnum);
        var last=$(this).parent().prev();
        last.after('<li class><span class="fui-triangle-right-large"></span><span class="homeworkName">第 <span class="num">'+String(num+1)+'</span>次作业</span> <span class="fui-plus add"  onclick="addone(this)"></span><span class="fui-new edit" onclick="edit(this)"></span></li>');
        edit();
    });
});
