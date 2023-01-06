$(function(){
	$('#kakaoPay').click(function(){
			$.ajax({
				url:'kakaoPay',
				dataType:'json',
				success:function(data){
					var box=data.next_redirect_pc_url;
					window.open(box);
				},
				error:function(error){
					alert(error);
				}		
		});
	});
});

 var IMP = window.IMP; 
        IMP.init("imp88602611"); 
    
        function requestPay() {
            IMP.request_pay({
                pg : 'kcp.T0000',
                pay_method : 'card',
                merchant_uid: "57008833-30114", 
                name : '당근 외 10개',
                amount : 100,
                buyer_email : 'Iamport@chai.finance',
                buyer_name : '아임포트 기술지원팀',
                buyer_tel : '010-1234-5678',
                buyer_addr : '서울특별시 강남구 삼성동',
                buyer_postcode : '123-456'
            }, function(rsp) {
    			console.log(rsp);
    			// 결제검증
    			$.ajax({
    	        	type : "POST",
    	        	url : "/verifyIamport/" + rsp.imp_uid 
    	        }).done(function(data) {
    	        	
    	        	console.log(data);
    	        	
    	        	// 위의 rsp.paid_amount 와 data.response.amount를 비교한후 로직 실행 (import 서버검증)
    	        	if(rsp.paid_amount == data.response.amount){
    		        	alert("결제 및 결제검증완료");
    		        	var msg = '결제가 완료되었습니다';
						var result = {
						"ordered_no" : rsp.merchant_uid,
						"ordered_to_name":rsp.name,
						"ordered_to_tel":rsp.buyer_tel,
						"ordered_to_email":rsp.buyer_email,
						"ordered_to_adr":rsp.buyer_addr,
						"ordered_to_post":rsp.buyer_postcode,
						"ordered_payhow":rsp.pay_method,
						"ordered_paystate" : rsp.status,		
						"ordered_date" : new Date().getTime(),
						"ordered_orderprice" : rsp.paid_amount,
						}
    		        	$.ajax({
    		        		type:"POST",
    		        		url:"/orderedInsert",
    		        		data : JSON.stringify(result),
				        	contentType:'application/json; charset=utf-8',
				        	dataType: 'json', //서버에서 보내줄 데이터 타입
    		        		 success: function(res){
    		        		 	alert('insert ajax 성공'); 	 
    		        		 },
    		        		 error:function(){
    		        		 	alert('insert ajax 실패'); 	 
    		        		 }
    		        		
    		        	});//ajax----------------------
  	
    		        	
    	        	} else {
    	        		alert("결제 실패");
    	        		var msg='결제 실패했습니다';
    	        		msg+='에러: ' +rps.error_msg
    	        	}
    	        });
    		});
    	}