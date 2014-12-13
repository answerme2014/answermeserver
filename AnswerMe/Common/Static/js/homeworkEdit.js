//--全局变量
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
    ],
    enableAutoSave:false,
    autoSyncData:false
});
var form = document.getElementById('form');
var kfSubmit = function(){
    ue.getKfContent(function(content){
        form.submit();
    })
}
var content;
//--./全局变量

function edit(t){
    var targetHid=$(t).parent().find('.hid').text();
    var targetVersion=$(t).parent().find('.version').text();
    $(t).parent().parent().find('li').removeClass('editing');
    $(t).parent().addClass('editing');
    $('.className .hid').text(targetHid);
    $('.className .version').text(targetVersion);
    $.ajax({
        type: 'POST',
        url: '/answer_me/home.php/EditPage/getContent',
        data: {'hid':targetHid,'version':targetVersion},
        dataType: "json",
        success: function(data) {
            //console.log("Reply:");
            //console.log(data);
            content=data['content'];
            ue.setContent(content);
        },
        error: function(data) {
            alert("error");
            console.log(data);
        }
    });
}
function save(){
    var hid=$('.className .hid').text();
    var version=$('.className .version').text();
    var contentData=ue.getContent();
    $.ajax({
        type: 'POST',
        url: '/answer_me/home.php/EditPage/setContent',
        data: {'hid':hid,'version':version,'content':contentData},
        dataType: "json",
        success: function(data) {
            //console.log("Reply:");
            //console.log(data);
            if(data['status']==1){
                alert("提交成功");
                location.href='/answer_me/home.php/EditPage/index/hid/'+data['hid']+'/version/'+data['version'];
            }      
            else
                alert("提交失败 "+data['status']);
        },
        error: function(data) {
            alert("error");
            console.log(data);
        }
    });
    location.href
}
function createNew(){
    //alert($('#cid').text());
    $.ajax({
        type: 'POST',
        url: '/answer_me/home.php/EditPage/createNew',
        data: {'cid':$('#cid').text()},
        dataType: "json",
        success: function(data) {
            //console.log("Reply:");
            //console.log(data);
            if(data['status']==1){
                //alert("提交成功");
                location.href='/answer_me/home.php/EditPage/index/hid/'+data['hid']+'/version/'+data['version'];
            }      
            else
                alert("提交失败 "+data['status']);
        },
        error: function(data) {
            alert("error");
            console.log(data);
        }
    });
}
$(document).ready(function(){
    //请求编辑器数据
    var hid=$('.className .hid').text();
    var version=$('.className .version').text();
    ue.addListener("ready", function () {   
        $.ajax({
            type: 'POST',
            url: '/answer_me/home.php/EditPage/getContent',
            data: {'hid':hid,'version':version},
            dataType: "json",
            success: function(data) {
                //console.log("Reply:");
                //console.log(data);
                content=data['content'];
                // editor准备好之后写入数据
                ue.setContent(content);
            },
            error: function(data) {
                alert("error");
                console.log(data);
            }
        });          
    });
});
