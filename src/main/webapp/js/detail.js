	<!--  --------------- 상품 정보 JS-------------------- --> 
var pnum = $("#pnum").val();

$.getJSON("/admin/prodDetail/{pnum}" + pnum, function(result) {
	
	var str = '';
	
	$(result).each(function() {
		var data = this;
		
		str += makeHtmlcode_read(data);
			
	});
	
	$(".about_product").append(str);
			
});
				/* 상품 리뷰,Q&A JS */
$("#review").click(function() {
	
	var scrollPosition = $(".reviews").offset().top;
	$("html").animate({scrollTop: scrollPosition}, 500); 
});

$("#qna").click(function() {

	var scrollPosition = $(".qnas").offset().top;
	$("html").animate({scrollTop: scrollPosition}, 500); 
});

$("#about").click(function() {
	
	var scrollPosition = $(".about_product").offset().top;
	$("html").animate({scrollTop: scrollPosition}, 500); 
});

$(function(){

$("#pqty").on('change', function() { /* count */
	var pqty = $(this).val();
	var price = $("#price").val();
	var opt = $(".opt_select").val();
	
	
	if (pqty*price >= 30000) {
		var shipping = '무료배송';
		var finalPrice = pqty*price;
	} else {
		var shipping = 2500;
		var finalPrice = (pqty*price) + shipping;
	}
	
	var str = '';
	
	str += '<p><label>수량 : </label><span>&nbsp;' + pqty + '</span>&nbsp;&nbsp;&nbsp;';	
	
	if (opt != 'S' && opt != 'M' && opt != 'L') {
		str += '<lable></lable>';
	} else {
		str += '<label>옵션 : </label><span>&nbsp;' + opt + '</span>&nbsp;&nbsp;&nbsp;';	
	}
	
	str += '<label>배송비 : </label><span>&nbsp;' + shipping + '</span>&nbsp;&nbsp;&nbsp;';
	str	+= '<label>가격 : </label><span>&nbsp;' + price + ' 원</span></p>';
	str += '<h4><label>결제금액 : </label><span>&nbsp;' + finalPrice + ' 원</span></h4>'; 
	str += '<span class="glyphicon glyphicon-exclamation-remove"></span>';
	
	$(".selected_option").html(str);
	}); 

})
			/* --------------- 상품 이미지 JS-------------------- */


$.getJSON("/admin/prodDetail/{pimage1}/" + pimage1, function(result) {
			/* 썸네일이 여러개인 경우 가져와서 하나씩 썸네일 영역에 넣어줌 */
			var str = '';
			$(result).each(function() {
				var data = this; 
				str += makeHtmlcode(data);
			});
			$(".uploadedList").html(str);

		});
		
		$(".fileDrop").on("dragenter dragover", function(event) {
			event.preventDefault();
            /* 드래그인, 드래그 오버로 실행되는 어떠한 기능들을 막는 코드 */
		});
		
		$(".fileDrop").on("drop", function(event) {
            /* 파일 드롭 영역에 파일을 가져다 놓으면 업로드 후, 썸네일로 띄우게 하는 코드 */
			event.preventDefault();
			var files = event.originalEvent.dataTransfer.files;
			var file = files[0];
			
			var formData = new FormData();
			formData.append("file",file);

			$.ajax({
				
				type : 'post',
				url : '/ajaxtest', 
				data : formData,
				processData : false,
				contentType : false,
				dataType : 'text',
				success : function (data) {
					var str = makeHtmlcode(data);
					
					$(".uploadedList").append(str);
				}
			});
		});

		 /* 주소입력란 버튼 동작(숨김, 등장) */
		 function showAdress(className){
		 	/* 컨텐츠 동작 */
		 	/* 모두 숨기기 */
		 		$(".addressInfo_input_div").css('display', 'none');
		 	/* 컨텐츠 보이기 */
		 		$(".addressInfo_input_div_" + className).css('display', 'block');		
		 }
		
		 /* 버튼 색상 변경 */
			/* 모든 색상 동일 */
				$(".address_btn").css('backgroundColor', '#555');
			/* 지정 색상 변경 */
				$(".address_btn_"+className).css('backgroundColor', '#3c3838');	