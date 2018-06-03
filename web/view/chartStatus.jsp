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
<body style="background-color: white;">
	
	<div class="box-content">
	<%-- <h4 class="page-header">Supply Replacement Cycle Settings :
		${param.car_num }</h4> --%>
		 <h3 class="page-header"><label class="control-label" ><font color="#315D80"><i class="fa fa-stethoscope"></i> 차량 상태 진단 :
		${param.car_type}</font></label></h3> 
	<center>
	<button type="button" class="btn btn-info btn-sm" onclick = "location.href ='diagnosis.do?car_num=${param.car_num}&car_type=${param.car_type}'">소모품</button>
<button type="button" class="btn btn-primary btn-sm">차량상태</button>
<button type="button" class="btn btn-success btn-sm">연&nbsp;&nbsp;&nbsp;비</button>
</center>
<%-- <c:forEach items="${splist}" var="supplyVo"> 
<div class="col-xs-12 col-sm-4">
		
		<div class="box box-pricing">
 					<center><div class="GaugeMeter" id="PreviewGaugeMeter_2" data-percent="${supplyVo.avg}" data-append="%" data-size="200" data-theme="Green-Gold-Red" data-back="RGBa(0,0,0,.1)" data-animate_gauge_colors="1" data-animate_text_colors="1" data-width="15" data-label="${supplyVo.part_name }" data-style="Arch" data-label_color="
#5783A8"></div> </center>
<c:if test="${supplyVo.avg >= 100}" ><center><b>소모품을 교체하셨나요?&nbsp;&nbsp;</b><button type="button" class="btn btn-primary btn-xs"  onclick = "location.href = 'updateMile.do?car_num=${param.car_num}&main_seq=${supplyVo.main_seq}&car_type=${param.car_type}' ">&nbsp;네!&nbsp;</button></center></c:if>
<c:if test="${supplyVo.avg < 100}" ><br><br></c:if>
		</div>
</div>

</c:forEach> --%>

<div id="container" style="min-width: 300px; max-width: 800px; height: 400px; margin: 0 auto"></div>


</div>

				

	<br>
	<br> 충격정보그래프임
	<br>
	<br>
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/highcharts-more.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script>

Highcharts.chart('container', {

    chart: {
        polar: true,
        type: 'line',
        backgroundColor:'none'
        
    },

    title: {
        text: '차량 상태',
        x: -80
    },

    pane: {
        size: '80%'
    },

    xAxis: {
        categories: ['북', '북동', '동', '남동','남','남서','서','북서'
           ],
        tickmarkPlacement: 'on',
        lineWidth: 0
    },

    yAxis: {
        gridLineInterpolation: 'polygon',
        lineWidth: 0,
        min: 0
    },

    tooltip: {
        shared: true,
        pointFormat: '<span style="color:{series.color}">{series.name}: <b>{point.y:,.0f}</b><br/>'
    },

    legend: {
        align: 'right',
        verticalAlign: 'top',
        y: 70,
        layout: 'vertical'
    },

    series: [{
        name: '충격 횟수',
        data: [${hit.n}, ${hit['ne']}, ${hit.e}, ${hit.se}, ${hit.s}, ${hit.sw},${hit.w},${hit.nw}],
        pointPlacement: 'on'
    }]

});

</script>
</body>
</html>