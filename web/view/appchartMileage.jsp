<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link href="resources/devoops/plugins/bootstrap/bootstrap.css"
	rel="stylesheet">
<link href="resources/devoops/plugins/jquery-ui/jquery-ui.min.css"
	rel="stylesheet">
<link
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"
	rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Righteous'
	rel='stylesheet' type='text/css'>
<link href="resources/devoops/plugins/fancybox/jquery.fancybox.css"
	rel="stylesheet">
<link href="resources/devoops/plugins/fullcalendar/fullcalendar.css"
	rel="stylesheet">
<link href="resources/devoops/plugins/xcharts/xcharts.min.css"
	rel="stylesheet">
<link href="resources/devoops/plugins/select2/select2.css"
	rel="stylesheet">
<link
	href="resources/devoops/plugins/justified-gallery/justifiedGallery.css"
	rel="stylesheet">
<link href="resources/devoops/css/style_v2.css" rel="stylesheet">
<link href="resources/devoops/plugins/chartist/chartist.min.css"
	rel="stylesheet">
<script src="resources/devoops/plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="resources/devoops/plugins/bootstrap/bootstrap.min.js"></script>
<script
	src="resources/devoops/plugins/justified-gallery/jquery.justifiedGallery.min.js"></script>
<script src="resources/devoops/plugins/tinymce/tinymce.min.js"></script>
<script src="resources/devoops/plugins/tinymce/jquery.tinymce.min.js"></script>
<!-- All functions for this theme + document.ready processing -->

</head>
<body style="background-color: #FBFBF0;">
	
	<div class="box-content">
	<%-- <h4 class="page-header">Supply Replacement Cycle Settings :
		${param.car_num }</h4> --%>
		 <h3 class="page-header"><label class="control-label" ><font color="#315D80"><i class="fa fa-stethoscope"></i> 차량 상태 진단 :
		${param.car_type}</font></label></h3> 
	<center>
	<button type="button" class="btn btn-info btn-sm" onclick = "location.href ='appdiagnosis.do?car_num=${param.car_num}&car_type=${param.car_type}'">소모품</button>
<button type="button" class="btn btn-primary btn-sm" onclick = "location.href ='appgetAnalysis.do?car_num=${param.car_num}&car_type=${param.car_type}'">차량상태</button>
<button type="button" class="btn btn-success btn-sm" onclick = "location.href ='appgetMileage.do?car_num=${param.car_num}&car_type=${param.car_type}'">연&nbsp;&nbsp;&nbsp;비</button>
</center>


<div id="container" style="min-width: 300px; max-width: 800px; height: 400px; margin: 0 auto"></div>


</div>

				

	<br>
	<br> 
	<br>
	<br>
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/highcharts-more.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script>
function display(input){
Highcharts.chart('container', {
    chart: {
        type: 'line',
        backgroundColor:'none'
    },
    title: {
        text: 'Monthly Fuel Efficiency'
    },
    subtitle: {
        text: ''
    },
    xAxis: {
        categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
    },
    yAxis: {
        title: {
            text: 'Km/L'
        }
    },
    plotOptions: {
        line: {
            dataLabels: {
                enabled: true
            },
            enableMouseTracking: false
        }
    },
    series: input
});
};
$(document).ready(function(){
	   // Server에 데이터를 요청한다.
	   // AJAX로

	    $.ajax({
	      url:"getMileageimpl.do",
	      type:"GET",
	      dataType:"json",
	      data:"car_num=${param.car_num}&car_type=${param.car_type}",
	      success:function(datas){
	         display(datas);
	      },
	      error:function(){
	         alert('fail');
	      }
	   }); 
	});
</script>
</body>
</html>