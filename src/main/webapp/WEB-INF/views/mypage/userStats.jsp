<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/top" />
<c:import url="/mypageNavi"/>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
<!-- 구글 차트 CDN -------------------------------------------------------------------- -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<style>
.meansNotice {
    margin: 35px 0 200px;
    padding: 20px 0 20px 20px;
    background-color: #f8f8f8;
    color: #999999;
}

div {
    display: block;
}

li{
	list-style: none;
}
</style>
<script>
$(document).ready(function(){
	var date=new Date();
	var com_year = date.getFullYear();
	
	comYearSetting(com_year);
	getYears(com_year);		
});

function getYears(com_year){
	for(var y=com_year; y>=(com_year-5); y--){
		$('#year').append("<option value='"+y+"'>"+y+"년"+"</option>");
	}
}

</script>

<script type="text/javascript">
function comYearSetting(com_year){
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawChart);
	
	function drawChart(){
		let year=com_year;
		//alert("drawChart의 year: "+year);
		$.ajax({
			url:'userStatsVO',
			type:'get',
			data:{'year':year},
			dataType:'json',
			cache:false,
			success:function(res){
				renderUserStats(res);
			},
			error:function(err){
				alert('err: '+err.status+", "+err.responseText);
			}
		})//$.ajax()end
		
		$(document).on("change", "#year", function(){
			let year=this.value;
			$.ajax({
				url:'userStatsVO',
				type:'get',
				data:{'year':year},
				dataType:'json',
				cache:false,
				success:function(res){
					renderUserStats(res);
				},
				error:function(err){
					alert('err: '+err.status+", "+err.responseText);
				}
			})//$.ajax()end
		})		
	}	
	
}

$(document).on("change", "#year", function(){
	let year=this.value;
	$.ajax({
		url:'userStatsVO',
		type:'get',
		data:{'year':year},
		dataType:'json',
		cache:false,
		success:function(res){
			renderUserStats(res);
		},
		error:function(err){
			alert('err: '+err.status+", "+err.responseText);
		}
	})//$.ajax()end
})

const renderUserStats=function(jsonArr){
	   var data = new google.visualization.DataTable();
	   data.addColumn('number', 'ordered_date'); //vo변수
	   data.addColumn('number', 'totalprice');
	   
	   let mydata=[];
	   $.each(jsonArr, function(i, obj){
	      let arr=[]; //1차원 배열
	      arr.push(obj.ordered_date);
	      arr.push(obj.totalprice);
	      mydata.push(arr);
	      
	      console.log("arr= "+arr);
	   })
	   data.addRows(mydata);
	   
	   var option={
	         title:' ',
	         width:1000,
	         height:500,
	         fontSize:13,
	         fontName:'Verdana',
	         colors:['#2E9AFE','#2E9AFE'],
	         bar: {groupWidth: "20%"},
	         legend: { position: "none" }
	   }

	   var column_chart=new google.visualization.ColumnChart(document.getElementById('statsList'));
	   column_chart.draw(data, option);
	}
</script>


<div class="container" style="width:70%;">
	<h2 style="margin-top:50px;">연도별 내역</h2>
		<div class="graphInfo">
			<select name="year" id="year" class="year" title="년도">

			</select>
		</div>
	<div id="statsList">
	<!-- 회원 연도별 내역 -->
	</div>
	<div class="meansNotice">       
        <p>고객님의 월별 구매 금액을 확인하실 수 있도록 제공해드리는 것으로, 지난 5년 내역을 확인 하실 수 있습니다.</p>
        <ul>
            <li>- 신용카드통합포인트를 통한 결제내역은 각 카드사 홈페이지 방문을 통해 조회하실 수 있습니다.</li>
            <li>- 결제수단별 한도 기준에 대해서는 별도 페이지에서 안내해드리고 있습니다.  <a href="#" target="chargenotice"><span>안내 바로가기</span></a></li>
        </ul>
    </div>
</div>
