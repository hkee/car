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

<style>
.GaugeMeter {
  position: Relative;
  text-align: Center;
  overflow: Hidden;
  cursor: Default;
  display: inline-block;
}

.GaugeMeter SPAN, .GaugeMeter B {
  width: 54%;
  position: Absolute;
  text-align: Center;
  display: Inline-Block;
  color: RGBa(0,0,0,.8);
  font-weight: 100;
  font-family: "Open Sans", Arial;
  overflow: Hidden;
  white-space: NoWrap;
  text-overflow: Ellipsis;
  margin: 0 23%;
}

.GaugeMeter[data-style="Semi"] B {
  width: 80%;
  margin: 0 10%;
}

.GaugeMeter S, .GaugeMeter U {
  text-decoration: None;
  font-size: .60em;
  font-weight: 200;
  opacity: .6;
}

.GaugeMeter B {
  color: #000;
  font-weight: 200;
  opacity: .8;
}
</style>
</head>
<body style="background-color: white;">
	<br>
	<!-- <div class="row"> -->	
	<h4 class="page-header"><label class="control-label" ><font color="#315D80">&nbsp;<i class="fa fa-bus"></i> 내차 목록 </font></label></h4> 
	<c:forEach items="${carlist}" var="car"> 
	<div class="col-xs-12 col-sm-4">
		<div class="box box-pricing">
			<div class="thumbnail">
				<img src="resources/devoops/img/${car.car_type}.png" alt="">    
				<div class="caption">
					<h4 class="text-center"><font color="#315D80"><b> ${car.car_type}</b> </font></h4>
					<table class="table" >
					<tr>
					<td><font color="#5783A8"><b>차량번호</b> </font></td>
					<td><b> ${car.reg_num}</b></td>
					</tr>
					<tr>
					<td><font color="#5783A8"><b>연식</b> </font></td>
					<td><b> ${car.year}</b></td>
					</tr>
					<tr>
					<td><font color="#5783A8"><b>보험회사</b> </font></td>
					<td><b> ${car.insurance}</b></td>
					</tr>
					</table>
					<label class="control-label"><font color="#5783A8"><b>차량상태지수</b></label>
					<div class="row">
					<center>
					<div class="GaugeMeter" id="PreviewGaugeMeter_4" data-percent="${car.score}" data-append="" data-size="160" data-theme="Blue" data-back="RGBa(0,0,0,.1)" data-animate_gauge_colors="1" data-animate_text_colors="1" data-width="15" data-label="" data-label_color="#FFF" data-stripe="2"></div>
					</center>
					</div>
				</div>
				
			</div>
		</div>
	</div>
	</c:forEach>
<!-- </div> -->
	<br>
	<br>
	<br>
	<br>
	<link href="https://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="view/GaugeMeter.js"></script>
<script>
$(".GaugeMeter").gaugeMeter();
</script>
</body>

</html>