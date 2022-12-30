	function selectDownCategory(upCode){
		//alert(upCode);
		//ajax로 요청보내기. get방식으로 upCg_code를 파라미터값으로 전달하면, json으로 받아보자
		//url: getDownCategory
		$.ajax({
			type:'get',
			url:'getDownCategory?upCg_code='+upCode,
			dataType:'json',
			cache:false
		})
		.done(function(res){
			//alert(JSON.stringify(res));\
			//응답 결과를 받아서 select 태그 만들어서 id가 selectDcg인 곳에 응답 html데이터를 넣기
			let str='<select name="downCg_code" id="downCg_code">';
				str+='<option value="">::하위 카테고리::</option>';
				
				$.each(res, function(i, item){
					str+='<option value="'+item.downCg_code+'">'+item.downCg_name+'</option>';
				});
				
				str+='</select>';
				$('#selectDcg').html(str);
		})
		.fail(function(err){
			alert('err');
		})
		
	}//----------------------------
	
	
	
	function check(){
		if(!$('#upCg_code').val()){
			//alert('상위 카테고리를 선택하세요');
			alert($('#upCg_code').val());
			$('#upCg_code').focus();
			return false;
		}
		if(!$('#downCg_code').val()){
			alert('하위 카테고리를 선택하세요');
			$('#downCg_code').focus();
			return false;
		}
		if(!$('#pname').val()){
			alert('상품명을 입력하세요');
			$('#pname').focus();
			return false;
		}
		if(!('#tag1').val()){
			alert('태그 검색어를 입력해야 해요');
			$('#tag1').select();
			return false;
		}
		
		let $price=$('#price').val();
		let pattern=/^[0-9]+$/
		if(!pattern.test($('#pqty').val())){
			alert('수량은 숫자로 입력해야 해요');
			$('#pqty').select();
			return false;
		}
		if(!pattern.test($price)){
			alert('정가는 숫자로 입력해야 해요');
			$('#price').select();
			return false;
		}
		if(!pattern.test($('#saleprice').val())){
			alert('판매가는 숫자로 입력해야 해요');
			$('#saleprice').select();
			return false;
		}
		if(!pattern.test($('#point').val())){
			alert('포인트는 숫자로 입력해야 해요');
			$('#point').select();
			return false;
		}
		
		return true;
	}
