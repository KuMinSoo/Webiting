


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
$(function(){
$('#test').click(function(){
	alert('한글테스트')

})
})
function createOrderedNum(){ 
 	const date=new Date(); 
 	const year=date.getFullYear(); 
 	const month=String(date.getMonth()+1).padStart(2,"0"); 
    const day=String(date.getDate()).padStart(2,"0");
 	let orderNum=year+month+day;  
 	for(let i=0;i<5;i++){ 
 	 	 orderNum+=Math.floor(Math.random()*9); 
 	 } 
 	 return orderNum; 
 } 

 var IMP = window.IMP;   
 
 IMP.init("imp88602611");   
           function requestPay() { 

                 IMP.request_pay({ 
                       pg : 'kcp.T0000', 
                       pay_method : 'card', 
                       merchant_uid: createOrderedNum(),   
                       name : $("input[name='name']").val(), 
                       amount : $("input[name='amount']").val(), 
                       buyer_email : $("input[name='buyer_email']").val(), 
                       buyer_name : $("input[name='buyer_name']").val(), 
                       buyer_tel : $("input[name='buyer_tel']").val(),
                       buyer_addr : $("input[name='buyer_addr']").val(), 
                       buyer_postcode : $("input[name='buyer_postcode']").val(),
                       }, function(rsp) {
                        //console.log("rsp*******************"+rsp); 
                      	
                       $.ajax({ 
                         type : "POST", 
                         url : "/verifyIamport/"+rsp.imp_uid,
                         dataType :"json"
                         }).done(function(data){ 
                          
                         console.log(data);          	             
                         
                         // 위의 rsp.paid_amount 와 data.response.amount를 비교한후 로직 실행 (import 서버검증)
                         if(rsp.paid_amount == data.amount){         	           
	                              var jsonData = {
	                            	title : rsp.name,
	                              ordered_no : rsp.merchant_uid, //0
	                              ordered_to_name: rsp.buyer_name, 
	                              ordered_to_tel: rsp.buyer_tel, 
	                              ordered_to_email: rsp.buyer_email,
	                              ordered_to_adr: rsp.buyer_addr, 
	                              ordered_to_post: rsp.buyer_postcode, 
	                              ordered_payhow: rsp.pay_method, //0
	                              ordered_paystate : rsp.status, 	 	 
	                              ordered_orderprice : rsp.paid_amount
	                              };
	                              
                              var result=JSON.stringify(jsonData); 	 	 	 	 	 	 
                              alert(rsp.buyer_name+""+rsp.buyer_tel+""+rsp.buyer_email);
                          
                             
                              $.ajax({
                                    type:'POST',
                                    url: "/orderedInsert",
                                    data: result,
                                    contentType:'application/json; charset=UTF-8',
                                    dataType:'json',
                                    success:function(res){
                                        alert('200');
                                    },
                                    error:function(res){
                                        alert('등록실패');    
                                    }
                                });
                   } else {	
                       var msg='결제 실패했습니다';
                       msg+='에러: ' +rsp.error_msg
                       alert("fail"+msg);
                   }
               });
           });
       }

