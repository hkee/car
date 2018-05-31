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
	<br>
	<div class="box-content">
	<%-- <h4 class="page-header">Supply Replacement Cycle Settings :
		${param.car_num }</h4> --%>
		 <h4 class="page-header"><label class="control-label" ><font color="#315D80">Supply Replacement Cycle Settings :
		${param.car_num }</font></label></h4> 

	<!-- <form class="form-horizontal" role="form">

		<div class="form-group has-primary has-feedback">
			<label class="col-sm-2 control-label" >엔진오일</label>
			<div class="col-sm-4">
				<input type="number" class="form-control" placeholder="Company">
			</div>
			<label class="col-sm-2 control-label">미션오일</label>
			<div class="col-sm-4">
				<input type="number" class="form-control" placeholder="Company">
			</div>
			<label class="col-sm-2 control-label">브레이크오일</label>
			<div class="col-sm-4">
				<input type="number" class="form-control" placeholder="Company">
			</div>
		</div>
		<div class="form-group has-info has-feedback">
			
			<label class="col-sm-2 control-label">워셔액</label>
			<div class="col-sm-4">
				<input type="number" class="form-control" placeholder="Company">
			</div>
			<label class="col-sm-2 control-label">부동액</label>
			<div class="col-sm-4">
				<input type="number" class="form-control" placeholder="Company">
			</div>
		</div>
		<div class="form-group has-success has-feedback">
			
			<label class="col-sm-2 control-label">타이어</label>
			<div class="col-sm-4">
				<input type="number" class="form-control" placeholder="Company">
			</div>
			<label class="col-sm-2 control-label">베터리</label>
			<div class="col-sm-4">
				<input type="number" class="form-control" placeholder="Company">
			</div>
			<label class="col-sm-2 control-label">에어컨필터</label>
			<div class="col-sm-4">
				<input type="number" class="form-control" placeholder="Company">
				
			</div>
			<label class="col-sm-2 control-label">브레이크패드</label>
			<div class="col-sm-4">
				<input type="number" class="form-control" placeholder="Company">
			</div>
		</div>
		
	</form> -->
	<table class="table" >
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
				</table>
	</div>
	<br>
	<br>
	<br>
	<br>
	
</body>
</html>