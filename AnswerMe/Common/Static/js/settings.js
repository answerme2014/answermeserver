$(document).ready(function(){
	
	$(".btn btn-block").click(function (){
		complete();
	});


});

function complete() {
    if( $('#inputPassword1')!= $('#inputRepeatpassword')){
            alert("您输入的密码不相符，请重新输入");
            $('#inputPassword1').value=""; 
        }
	var array= new Array(); 
	array[password] = $('#inputPassword1').value;
	array[email] = $('#inputEmail').value;
	array[school] = $('#selectSchool').value;
	array[college] = $('#selectCollege').value;
	array[profession] = $('#selectMajor').value;
	array[enteryear] = $('#selectYear').value;

	$.ajax(function() {
		type: "POST",
		url: "",
		data: {jsonlist: array},
		dataType: "json",
		complete: function(status) {
            if(status==1){
               location.href="myhome.html";
            }
            else{
                alert(修改不成功，请重新输入);
            }
		},
		
	});
}