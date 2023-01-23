<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">	

google.charts.load('current', {'packages':['corechart', 'bar']});
google.charts.setOnLoadCallback(drawChart);
google.charts.setOnLoadCallback(drawBar);

function drawChart() {  
  $.ajax({
		url:'userVO',
		type:'get',
		dataType:'json',
		cache:false,
		success:function(res){
			//alert(JSON.stringify(res));
			renderUser(res);
		},
		error:function(err){
			alert('err: '+err.status+", "+err.responseText);
		}
	})//$.ajax()end
	
	$.ajax({
		url:'statsVO',
		type:'get',
		dataType:'json',
		cache:false,
		success:function(res){
			//alert(JSON.stringify(res));
			renderCntByOrder(res);
		},
		error:function(err){
			alert('err: '+err.status+", "+err.responseText);
		}
	})//$.ajax()end
	
	$.ajax({
		url:'ageVO',
		type:'get',
		dataType:'json',
		cache:false,
		success:function(res){
			//alert(JSON.stringify(res));
			renderAge(res);
		},
		error:function(err){
			alert('err: '+err.status+", "+err.responseText);
		}
	})//$.ajax()end
	$.ajax({
		url:'monthVO',
		type:'get',
		dataType:'json',
		cache:false,
		success:function(res){
			//alert(res);
			renderSalesMonth(res);
		},
		error:function(err){
			alert('err');
		}
			
		
	})//
}

function drawBar(){
	$.ajax({
		url:'salesVO',
		type:'get',
		dataType:'json',
		cache:false,
		success:function(res){
			//alert(JSON.stringify(res));
			renderSalesYear(res);
		},
		error:function(err){
			alert('err: '+err.status+", "+err.responseText);
		}
	})//$.ajax()end
}

const renderCntByOrder=function(jsonArr){
	//alert('test');
	var data=new google.visualization.DataTable();
	data.addColumn('string', '가구 이름');
	data.addColumn('number','판매 갯수');
	
	let mydata=[];
	let str='<ul class="best_cnt">';
	$.each(jsonArr, function(i, obj){
		let arr=[]; //1차원 배열
		arr.push(obj.pname); 
		arr.push(obj.sqty); 
		mydata.push(arr);
		
		//console.log("arr= "+arr);
		str+='<li>';
		str+=obj.pname;
		str+='</li>';
		str+='<li>';
		str+=obj.sqty;
		str+='</li>';
	})
	//console.log("mydata= "+mydata);
	data.addRows(mydata);
	str+='</ul>';
	$('#bestList').html(str);
	renderBarChart(data);		
}

const renderBarChart=function(data){
	let option={
			'title':'제일 많이 팔린 가구 best 10',
			'width':600,
			'height':600,
			'fontSize':11,
			'fontName':'Verdana',
			'colors':['#669355','#ffaacc']
	}
	let bar_chart=new google.visualization.BarChart(document.getElementById('bestList'));
	bar_chart.draw(data, option);
}	


const renderUser=function(jsonArr){
	//alert('test');
	var data = new google.visualization.DataTable();
	data.addColumn('string', 'name');
	data.addColumn('number', 'count');
	
	let mydata=[];
	let str='<ul class="best_cnt">';
	$.each(jsonArr, function(i, obj){
		let arr=[]; //1차원 배열
		arr.push(obj.name); 
		arr.push(obj.count); 
		mydata.push(arr);
		
		//console.log("arr= "+arr);
		str+='<li>';
		str+=obj.name;
		str+='</li>';
		str+='<li>';
		str+=obj.count;
		str+='</li>';
	})
	//console.log("mydata= "+mydata);
	data.addRows(mydata);
	str+='</ul>';
	$('#userList').html(str);
	renderPieChartUser(data);		
}

const renderAge=function(jsonArr){
	//alert('test');
	var data = new google.visualization.DataTable();
	data.addColumn('string', 'name');
	data.addColumn('number', 'count');
	
	let mydata=[];
	let str='<ul class="best_cnt">';
	$.each(jsonArr, function(i, obj){
		let arr=[]; //1차원 배열
		arr.push(obj.name); 
		arr.push(obj.count); 
		mydata.push(arr);
		
		//console.log("arr= "+arr);
		str+='<li>';
		str+=obj.name;
		str+='</li>';
		str+='<li>';
		str+=obj.count;
		str+='</li>';
	})
	//console.log("mydata= "+mydata);
	data.addRows(mydata);
	str+='</ul>';
	$('#userAge').html(str);
	renderColumnChartAge(data);		
}


const renderPieChartUser=function(data){
	var option={
			'title':'회원 성별 통계',
			'width':500,
			'height':500,
			'fontSize':13,
			'fontName':'Verdana',
			'colors':['#3300FF','#FF9999']
	}
	let pie_chart=new google.visualization.PieChart(document.getElementById('userList'));
	pie_chart.draw(data, option);
}	

const renderColumnChartAge=function(data){
	var option={
			'title':'회원 나이대 통계',
			'width':500,
			'height':500,
			'fontSize':13,
			'fontName':'Verdana',
			'colors':['#669355','#ffaacc']
	}
	let column_chart=new google.visualization.ColumnChart(document.getElementById('userAge'));
	column_chart.draw(data, option);
}	

const renderSalesYear=function(jsonArr){
	var data = new google.visualization.DataTable();
	data.addColumn('string', 'y');
	data.addColumn('number', 'sales');
	data.addColumn('number', 'expense');
	data.addColumn('number', 'profit');
	
	let mydata=[];
	$.each(jsonArr, function(i, obj){
		let arr=[]; //1차원 배열
		arr.push(obj.y);
		arr.push(obj.sales);
		arr.push(obj.expense); 
		arr.push(obj.profit); 
		mydata.push(arr);
		
		//console.log("arr= "+arr);
	})
	data.addRows(mydata);
	
	var options = {
          chart: {
            title: '매출 통계',
            subtitle: 'Sales, Expenses, and Profit: 2022-2023',
            bars: 'vertical',
            vAxis: {format: 'decimal'},
            colors: ['#1b9e77', '#d95f02', '#7570b3']
          }
        };

    var chart = new google.charts.Bar(document.getElementById('salesList'));
    var formatter = new google.visualization.NumberFormat({pattern: '###,###,###'});
    formatter.format(data, 1);
    formatter.format(data, 2);
    formatter.format(data, 3);

    chart.draw(data, google.charts.Bar.convertOptions(options));
	
}

const renderSalesMonth=function(jsonArr){
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
	         title:'월 매출 통계',
	         width:800,
	         height:500,
	         fontSize:13,
	         fontName:'Verdana',
	         colors:['#669355','#ffaacc'],
	         bar: {groupWidth: "95%"},
	          legend: { position: "none" }
	   }

	   var column_chart=new google.visualization.ColumnChart(document.getElementById('MonthList'));//div이름
	   column_chart.draw(data, option);
	}
</script>