$(document).ready(function() {
	var good_item = 0;
	var care_item = 0;
	$("#good-img").click(function() {
		if (good_item == 0) {
			var a = $("#good").text();
			var sum = 0;
			var j = 1;
			for ( var i = a.length - 1; i >= 0; i--) {
				sum += a[i] * j;
				j *= 10;
			}
			sum += 1;
			$("#good").text(sum);
			$("#good-img").css("color", "#dc143c");	
			good_item = 1;
		} else if (good_item == 1) {
			var a = $("#good").text();
			var sum = 0;
			var j = 1;
			for ( var i = a.length - 1; i >= 0; i--) {
				sum += a[i] * j;
				j *= 10;
			}
			sum -= 1;
			$("#good").text(sum);
			$("#good-img").css("color", "#16a085");
			good_item = 0;		
		}
	});

	$("#good-img").mouseover(function() {
		$("#good-img").css("color", "#dc143c");	
	});

	$("#good-img").mouseout(function() {
		if (good_item == 0) {
			$("#good-img").css("color", "#16a085");	
		} else if (good_item == 1) {
			$("#good-img").css("color", "#dc143c");	
		}
	});

	$("#care-img").click(function() {
		if (care_item == 0) {
			var a = $("#care").text();
			var sum = 0;
			var j = 1;
			for ( var i = a.length - 1; i >= 0; i--) {
				sum += a[i] * j;
				j *= 10;
			}
			sum += 1;
			$("#care").text(sum);
			$("#care-img").css("color", "#dc143c");	
			care_item = 1;
		} else if (care_item == 1) {
			var a = $("#care").text();
			var sum = 0;
			var j = 1;
			for ( var i = a.length - 1; i >= 0; i--) {
				sum += a[i] * j;
				j *= 10;
			}
			sum -= 1;
			$("#care").text(sum);
			$("#care-img").css("color", "#16a085");
			care_item = 0;		
		}
	});

	$("#care-img").mouseover(function() {
		$("#care-img").css("color", "#dc143c");	
	});

	$("#care-img").mouseout(function() {
		if (care_item == 0) {
			$("#care-img").css("color", "#16a085");	
		} else if (care_item == 1) {
			$("#care-img").css("color", "#dc143c");	
		}
	});
});