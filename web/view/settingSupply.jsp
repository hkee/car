<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
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
	<h4 class="page-header">Supply Replacement Cycle Settings :
		${param.car_num }</h4>
	<form class="form-horizontal" role="form">

		<div class="form-group has-success has-feedback">
			<label class="col-sm-2 control-label">엔진오일</label>
			<div class="col-sm-4">
				<input type="text" class="form-control" placeholder="Company">
			</div>
			<label class="col-sm-2 control-label">미션오일</label>
			<div class="col-sm-4">
				<input type="text" class="form-control" placeholder="Company">
			</div>
		</div>
		<div class="form-group has-warning has-feedback">
			<label class="col-sm-2 control-label">브레이크오일</label>
			<div class="col-sm-4">
				<input type="text" class="form-control" placeholder="Company">
			</div>
			<label class="col-sm-2 control-label">워셔액</label>
			<div class="col-sm-4">
				<input type="text" class="form-control" placeholder="Company">
			</div>
		</div>
		<div class="form-group has-success has-feedback">
			<label class="col-sm-2 control-label">부동액</label>
			<div class="col-sm-4">
				<input type="text" class="form-control" placeholder="Company">
			</div>
			<label class="col-sm-2 control-label">타이어</label>
			<div class="col-sm-4">
				<input type="text" class="form-control" placeholder="Company">
			</div>
		</div>
		<div class="form-group has-warning has-feedback">
			<label class="col-sm-2 control-label">베터리</label>
			<div class="col-sm-4">
				<input type="text" class="form-control" placeholder="Company">
			</div>
			<label class="col-sm-2 control-label">에어컨필터</label>
			<div class="col-sm-4">
				<input type="text" class="form-control" placeholder="Company">
			</div>
		</div>
		<div class="form-group has-success has-feedback">
			<label class="col-sm-2 control-label">브레이크패드</label>
			<div class="col-sm-4">
				<input type="text" class="form-control" placeholder="Company">
			</div>
			
		</div>
	</form>
	</div>
	
</body>
</html>