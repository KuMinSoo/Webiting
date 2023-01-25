<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
$(document).ready(function(){
	
	/* 주문 조합정보란 최신화 */
	setTotalInfo();
	
	
	
});
function showAdress(className){
	$(".addressInfo_input_div").css('display', 'none');
	$(".addressInfo_input_div_" + className).css('display', 'block');		

	$(".address_btn").css('backgroundColor', '#555');
	$(".address_btn_"+className).css('backgroundColor', '#3c3838');	
	$(".addressInfo_input_div").each(function(i, obj){
		$(obj).find(".selectAddress").val("F");
	});
	$(".addressInfo_input_div_" + className).find(".selectAddress").val("T");		
}	

$(function(){
	
	/* 포인트 입력 */
	//0 이상 & 최대 포인트 수 이하
	$(".order_point_input").on("propertychange change keyup paste input", function(){
		const maxPoint = parseInt(${loginUser.mileage});	
		
		let inputValue = parseInt($(this).val());	
		
		if(inputValue < 0){
			$(this).val(0);
		} else if(inputValue > maxPoint){
			$(this).val(maxPoint);
		}	
		
		setTotalInfo();	
		
	});

	/* 포인트 모두사용 취소 버튼 
	 * Y: 모두사용 상태 / N : 모두 취소 상태
	 */
	$(".order_point_input_btn").on("click", function(){
		const maxPoint = parseInt(${loginUser.mileage});	
		
		let state = $(this).data("state");	
		
		if(state == 'N'){
			//console.log("n동작");
			/* 모두사용 */
			//값 변경
			$(".order_point_input").val(maxPoint);
			//글 변경
			$(".order_point_input_btn_Y").css("display", "inline-block");
			$(".order_point_input_btn_N").css("display", "none");
		} else if(state == 'Y'){
			//console.log("y동작");
			/* 취소 */
			//값 변경
			$(".order_point_input").val(0);
			//글 변경
			$(".order_point_input_btn_Y").css("display", "none");
			$(".order_point_input_btn_N").css("display", "inline-block");		
		}	
		
		setTotalInfo();	
		
	});
	
	/* 주문 요청 */
	$(".order_btn").on("click", function(){
		/* 주소 정보 & 받는이*/
		$(".addressInfo_input_div").each(function(i, obj){
			if($(obj).find(".selectAddress").val() === 'T'){
				$("input[name='buyer_addr']").val($(obj).find('.addr1_input').val()+$(obj).find('.addr2_input').val());
				$("input[name='buyer_postcode']").val($(obj).find(".post_input").val());
			}
		});	
		console.log('${orderList[0].pname}');
		if(${orderList.size()} > 1){
			$("input[name='name']").val('${orderList[0].pname}'+' 외 '+'${orderList.size()-1}'+'개');
		}else{
			$("input[name='name']").val('${orderList[0].pname}');
		}
		
		$(".order_form").submit();	
	
	});	
	
})
/* 
$.ajax({
			type:'post',
			url:'orderEnd',
			data:$(".order_form").serialize(),
			contentType:'application/x-www-form-urlencoded; charset=utf-8',
			dataType:'json',
			cache:false,
			success:function(res){
				console.log(res);
			},
			error:function(err){
				console.log("error! "+err);
			}
			
		})*/


function setTotalInfo(){
	let totalPrice = 0;				// 총 가격
	let totalCount = 0;				// 총 갯수
	let totalKind = 0;				// 총 종류
	let totalPoint = 0;				// 총 마일리지
	let deliveryPrice = 0;			// 배송비
	let usePoint = 0;				// 사용 포인트(할인가격)
	let finalTotalPrice = 0; 		// 최종 가격(총 가격 + 배송비)	
	
	$(".goods_table_price_td").each(function(index, element){
		// 총 가격
		totalPrice += parseInt($(element).find(".individual_totalPrice_input").val());
		// 총 갯수
		totalCount += parseInt($(element).find(".individual_oqty_input").val());
		// 총 종류
		totalKind += 1;
		// 총 마일리지
		totalPoint += parseInt($(element).find(".individual_totalPoint_input").val());
	});	
	/* 배송비 결정 */
	if(totalPrice >= 3000000){
		deliveryPrice = 0;
	} else if(totalPrice == 0){
		deliveryPrice = 0;
	} else {
		deliveryPrice = 0;	
	}
	
	finalTotalPrice = totalPrice + deliveryPrice;	
	
	/* 사용 포인트 */
	usePoint = $(".order_point_input").val();
	finalTotalPrice -= usePoint;	
	
	/* 값 삽입 */
	$(".totalPrice_span").text(totalPrice.toLocaleString());
	$(".goods_kind_div_count").text(totalCount);
	$(".goods_kind_div_kind").text(totalKind);
	$(".totalPoint_span").text(totalPoint.toLocaleString());
	$(".delivery_price_span").text(deliveryPrice.toLocaleString());	
	$(".finalTotalPrice_span").text(finalTotalPrice.toLocaleString());	
	$("input[name='amount']").val(finalTotalPrice);
	$(".usePoint_span").text(usePoint.toLocaleString());	
	
	$(".addressInfo_input_div").each(function(i, obj){
		if($(obj).find(".selectAddress").val() === 'T'){
			$("input[name='buyer_addr']").val($(obj).find('.addr1_input').val()+$(obj).find('.addr2_input').val());
			$("input[name='buyer_postcode']").val($(obj).find(".post_input").val());
		}
	});	
	console.log('${orderList[0].pname}');
	if(${orderList.size()} > 1){
		$("input[name='name']").val('${orderList[0].pname}'+' 외 '+'${orderList.size()-1}'+'개');
	}else{
		$("input[name='name']").val('${orderList[0].pname}');
	}
	
	$(".order_form").submit();	
	
}


</script>