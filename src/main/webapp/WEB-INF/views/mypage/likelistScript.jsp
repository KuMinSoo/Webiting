<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
$(function(){
	$(".likedelBtn").on("click", function(e){
		e.preventDefault();
		const pnum=$(this).data("pnum");
		$(".delete_pnum").val(pnum);
		$(".like_delete_form").submit();
	});
	
	$("#allCheck").click(function(){
		val chk = $("#allCheck").prop("checked");
		if(chk){
			$(".chBox").prop("checked", true);
		}else{
			$(".chBox").prop("checked", false);
		}
	});
	
	$(".chBox").click(function(){
		$("#allCheck").prop("checked", false);
	});
})
	
</script>