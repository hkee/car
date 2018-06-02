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
<c:forEach items="${splist}" var="supplyVo"> 
<div class="col-xs-12 col-sm-4">
		
		<div class="box box-pricing">
 					<center><div class="GaugeMeter" id="PreviewGaugeMeter_2" data-percent="${supplyVo.avg}" data-append="%" data-size="200" data-theme="Green-Gold-Red" data-back="RGBa(0,0,0,.1)" data-animate_gauge_colors="1" data-animate_text_colors="1" data-width="15" data-label="${supplyVo.part_name }" data-style="Arch" data-label_color="
#5783A8"></div> </center>
<c:if test="${supplyVo.avg >= 100}" ><center><b>소모품을 교체하셨나요?&nbsp;&nbsp;</b><button type="button" class="btn btn-primary btn-xs"  onclick = "location.href = 'updateMile.do?car_num=${param.car_num}&main_seq=${supplyVo.main_seq}&car_type=${param.car_type}' ">&nbsp;네!&nbsp;</button></center></c:if>
<c:if test="${supplyVo.avg < 100}" ><br><br></c:if>
		</div>
</div>

</c:forEach>
</div>
	<%-- <table class="table" >
					<thead>
						<tr>
							<th><font color="#5783A8">#</font></th>

							<th><font color="#5783A8">Part Name</font></th>
							<th><font color="#5783A8">replacement cycle</font></th>
							<th><font color="#5783A8">submit</font></th>
						</tr>
					</thead>
					<tbody>
					
					<c:forEach items="${stlist}" var="stlistVO"> 
					<form method="get" action="replaceSt.do">
					<tr>
							<td style="width:10%;">${stlistVO.main_seq}<input type="hidden" name="main_seq" value="${stlistVO.main_seq}">
							<input type="hidden" name="car_num" value="${stlistVO.car_num}">
							</td>
							<td style="width:45%;">${stlistVO.part_name}</td>
							<td style="width:30%;"><input style="width:70%" type="NUMBER" placeholder="${stlistVO.change_st}" name="change_st">km</td>
							<td style="width:15%;"><button type="submit" class="btn btn-primary btn-app-sm btn-circle"><i class="fa fa-edit"></i></button></td>
						</tr>
					</form>
					</c:forEach> 
						
			
					</tbody>
				</table> --%>
				

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