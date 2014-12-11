$(document).ready(function() {
    var a = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
    var b = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

    $("#searchcourse").click(function() {
        $(".found").empty();
        var inputs = $("#search").value; // 提交输入框
        if (inputs == "") {
            $("#search").value = "输入不能为空!";
        } else {
            $.ajax({
                type: "POST",
                url: "http://localhost/answer_me/home.php/SearchPage/searchcourse",
                data: {
                    keyword: $("#search").val()
                },
                dataType: "json",
                success: function(list) {
                    //alert(status);
                    if (list.status==1) {

                        for (var j = 0, l = list.courses.length; j < l; j++) {
                            var dd = list.courses[j].course_name + ' '  + list.courses[j].school + list.courses[j].college + ' '  + list.courses[j].teacher;
                            var spans = "<div><div class= 'span3'><div class= 'class_text' ><div class= 'class_head'><p style='font-family:verdana;color:#19B68A'><a href='classpage.html' class='coursetitle'>"+ dd +"</a></p></div><div class= 'class_content'><p style='font-family:verdana;font-size:50%;color:black' class='lasthw'>"+list.courses[j].brief+"</p><div class='fans_num'> <a href='javascript:;'' style='font-family:verdana;font-size:30%;color:#19B68A' class = 'like' value='0'>"+ list.courses[j].like_number+"赞</a><a>&nbsp</a><a href='javascript:;' style='font-family:verdana;font-size:30%;color:#19B68A' class = 'follow'> "+list.courses[j].taken_number+"关注</a></div></div></div><div class = 'classpic'><a href='classpage.html'><img src='/answer_me/AnswerMe/Common/Static/resource/"+list.courses[j].picture+"' width='130' ;='' align='right' height='180' class= 'bookimg'/></a></div><p class='cids hidden' id='courseid'>"+list.courses[j].cid+"</p></div><div class = 'clear'/></div>";
                            $(".found").append(spans);
                        }
                        $(".found").removeClass("hidden");
                        $(".not_found").addClass("hidden");
                        $(".not_found1").addClass("hidden");
                    } else{
                        $(".not_found").removeClass("hidden");
                        $(".found").addClass("hidden");
                        $(".not_found1").addClass("hidden");

                    }
                 
                },
                error: function() {
                    alert("ajax访问失败！");
                }
            });
        }
    });

    $("#searchhw").click(function() {
        $(".found").empty();
        var inputs = $("#search").value; // 提交输入框
        if (inputs == "") {
            $("#search").value = "输入不能为空!";
        } else {
            $.ajax({
                type: "POST",
                url: "http://localhost/answer_me/home.php/SearchPage/searchhw",
                data: {
                    keyword: $("#search").val()
                },
                dataType: "json",
                success: function(data) {
                    if (data.status==1) {
                        alert(data.homeworks[0].title);

                        for (var j = 0, l = data.homeworks.length; j < l; j++) {
                            var dd = data.homeworks[j].title;
                            var spans = "<div><div class= 'span3'><div class= 'class_text' ><div class= 'class_head'><p style='font-family:verdana;color:#19B68A'><a href='classpage.html' class='coursetitle'>"+ dd +"</a></p></div><div class= 'class_content'><p style='font-family:verdana;font-size:50%;color:black' class='lasthw'>"+data.homeworks[j].content+"</p><div class='fans_num'> <a href='javascript:;'' style='font-family:verdana;font-size:30%;color:#19B68A' class = 'like' value = '1'>"+ data.homeworks[j].like_number+"赞</a></div></div></div><p class='hids hidden' id='hwid'>"+data.homeworks[j].hid+"</p></div><div class = 'clear'/></div>";
                            $(".found").append(spans);
                        }
                        $(".found").removeClass("hidden");
                        $(".not_found1").addClass("hidden");
                        $(".not_found").addClass("hidden");
                    } else{
                        $(".not_found").addClass("hidden");
                        $(".not_found1").removeClass("hidden");
                        $(".found").addClass("hidden");

                    }
                 
                },
                error: function() {
                    alert("ajax访问失败！");
                }
            });
        }
    });

    $(".like").click(function() {
        $(this).text(function() {
            i = $(".like").index(this);
            b[i] = b[i] + 1;
            if (b[i] % 2 == 1) {
                m = $(this).text();
                good1 = 1;
                return parseInt(m) + 1 + "赞";
            } else {
                m = $(this).text();
                good1 = 0;
                return parseInt(m) - 1 + "赞";
            }
        });
        if($(this).value==0){
        $.ajax({
            type: "POST",
            url: "test.json",
            data: {
                courseID: $("#courseid").val(),
                good: good1,
                object:0
            },
            dataType: "json",
            success: function() {

            },
            error: function() {
                alert("ajax访问失败！");
            }
        });
    }
    if($(this).value==1){
        $.ajax({
            type: "POST",
            url: "test.json",
            data: {
                hwID: $("#hwid").val(),
                flag1: good1,
                flag2:1
            },
            dataType: "json",
            success: function() {

            },
            error: function() {
                alert("ajax访问失败！");
            }
        });
    }
    });

    $(".follow").click(function() {
        $(this).text(function() {
            i = $(".follow").index(this);
            a[i] = a[i] + 1;
            if (a[i] % 2 == 1) {
                m = $(this).text();
                follow1 = 1;
                return parseInt(m) + 1 + "关注";
            } else {
                m = $(this).text();
                follow1 = 0;
                return parseInt(m) - 1 + "关注";
            }
        });
         $.ajax({
            type: "GET",
            url: "test.json",
            data: {
                courseID: $("#courseid").val(),
                flag: follow1
            },
            dataType: "json",
            success: function() {

},
            error: function() {
                alert("ajax访问失败！");
            }
        });
    });
});