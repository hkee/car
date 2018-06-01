<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>EL PROJECT</title>
<!-- Bootstrap core CSS-->
<link href="view/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom fonts for this template-->
<link href="view/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<!-- Page level plugin CSS-->
<link href="view/vendor/datatables/dataTables.bootstrap4.css"
	rel="stylesheet">
<!-- Custom styles for this template-->
<link href="view/css/sb-admin.css" rel="stylesheet">

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<!-- List Ui -->
	<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>

<script>
	$(document).ready(function() {
		$('.star').on('click', function() {
			$(this).toggleClass('star-checked');
		});

		$('.ckbox label').on('click', function() {
			$(this).parents('tr').toggleClass('selected');
		});

		$('.btn-filter').on('click', function() {
			var $target = $(this).data('target');
			if ($target != 'all') {
				$('.table tr').css('display', 'none');
				$('.table tr[data-status="' + $target + '"]').fadeIn('slow');
			} else {
				$('.table tr').css('display', 'none').fadeIn('slow');
			}
		});
	});
</script>
</head>

<style>
.row>div {
	text-align: center;
	border: 0px solid gray;
}

.row>div:nth-child(3n+1) {
	background: white;
}

.row>div:nth-child(3n+2) {
	background: white;
}

.row>div:nth-child(3n+3) {
	background: white;
}

/* ul에서 스타일 추가 */
li.b {
	list-style-type: square;
}

/* 가우지 */
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
	color: RGBa(0, 0, 0, .8);
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

.highcharts-series-hover path {
  stroke: rgb(255, 16, 33);
  stroke-width: 2px;
}

</style>


<body class="fixed-nav sticky-footer bg-dark sidenav-toggled"
	id="page-top">
	<!-- sidenav-toggled 이 줄어든 영역을 말함-->

	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top"
		id="mainNav">
		<a class="navbar-brand" href="index.html">EV-DATA</a>
		<button class="navbar-toggler navbar-toggler-right" type="button"
			data-toggle="collapse" data-target="#navbarResponsive"
			aria-controls="navbarResponsive" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<!-- 옆의 페이지  -->
			<ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
				<li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="Dashboard"><a class="nav-link" href="index.html"> <i
						class="fa fa-fw fa-dashboard"></i> <span class="nav-link-text">전기차
							기본 정보</span>
				</a></li>
			</ul>
			<ul class="navbar-nav sidenav-toggler">
				<li class="nav-item"><a class="nav-link text-center"
					id="sidenavToggler"> <i class="fa fa-fw fa-angle-left"></i>
				</a></li>
			</ul>

		</div>
	</nav>
	<!-- Navigation-->

	<div class="content-wrapper">

		<div class='row'>
			<div class='col-sm-3'>
				<div class="container-fluid">

					<!-- 즐겨 찾기 및 CSS  -->

					<!-- Breadcrumbs-->
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="#">EV 기본 정보</a></li>
						<li class="breadcrumb-item active">Engine Status</li>
					</ol>

					<!-- Icon Cards-->

					<p id="model">Model Tesla S</p>
					<b id="carID">Car No : 81허3117</b>
					<h5>수집 기간 : 2018-05-25 11:16:35.0</h5>

					<div class="card mb-1">
						<!-- Breadcrumbs-->
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="#">배터리 충전 이력</a></li>
							<li class="breadcrumb-item active">Engine Status</li>
						</ol>

						<div class="row">
							<section class="content">
								<div class="col-md-12 col-md-offset-0">
									<div class="panel panel-default">
										<div class="panel-body">
											<div class="pull-right">
												<div class="btn-group">
													<button type="button" class="btn btn-success btn-filter"
														data-target='pagado'>충전</button>
													<button type="button" class="btn btn-warning btn-filter"
														data-target='pendiente'>오류</button>
													<button type="button" class="btn btn-danger btn-filter"
														data-target='cancelado'>취소</button>
													<button type="button" class="btn btn-default btn-filter"
														data-target="all">모든 정보</button>
												</div>
											</div>
											<div class="table-container">
												<table class="table table-filter">
													<tbody>
													<!-- 매우 중요한 부문 이부분을 아는 것이 게시판의 목록을 조회하는 것과 비슷하다-->
													<c:forEach items="${charginglist}" var="list">
														
														<tr data-status=<c:choose><c:when test="${list.car_charging_status == 'Charging'}">pagado</c:when>
													       <c:when test="${list.car_charging_status == 'Delay'}">pendiente</c:when>
													       <c:when test="${list.car_charging_status == 'Cancel'}">cancelado</c:when>
													       <c:otherwise>pendiente</c:otherwise></c:choose>>
															<!-- data-status를 pagado 충전[charging]바꾸어야 한다. pendiente 접속 지연[delay], cancelado 취소[cancel] -->
															
															<td>
																<div class="ckbox">
																	<input type="checkbox" id="checkbox1"> <label
																		for="checkbox1"></label>
																</div>
															</td>
															<td><a href="javascript:;" class="star"> <i
																	class="glyphicon glyphicon-star"></i>
															</a></td>
															<td>
																<div class="media">
																	<a href="#" class="pull-left"> <img
																		src="https://s3.amazonaws.com/uifaces/faces/twitter/fffabs/128.jpg"
																		class="media-photo">
																	</a>
																	<div class="media-body">
																		<span class="media-meta pull-right">${list.car_charging_date}</span> <!--날짜가 들어와야한다.-->
																		<h4 class="title">
																			Model ${list.car_number}
																		<span class="pull-right <c:choose>
																			<c:when test="${list.car_charging_status == 'Charging'}">pagado</c:when>
													       <c:when test="${list.car_charging_status == 'Delay'}">pendiente</c:when>
													       <c:when test="${list.car_charging_status == 'Cancel'}">cancelado</c:when>
													      </c:choose>">
													  <c:choose>
																			<c:when test="${list.car_charging_status == 'Charging'}">(충전 완료!)</c:when>
													       <c:when test="${list.car_charging_status == 'Delay'}">(접속 지연)</c:when>
													       <c:when test="${list.car_charging_status == 'Cancel'}">(Cancel!)</c:when>
													      </c:choose></span>
																		</h4>
																		
				
																		<p class="summary">${list.car_charging_place}</p>
																	</div>
																</div>
															</td>
														</tr>
													</c:forEach>
														
													
														
														
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
							</section>

						</div>

					</div>
				</div>




			</div>
			<div class='col-sm-3'>
				<!-- 2번째 열-->
				<div class="container-fluid">
					<!-- Breadcrumbs-->
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="#">배터리 정보</a></li>
						<li class="breadcrumb-item active">Battery Status</li>
					</ol>


					<div class="container">
						<div class="row">
							<div class="col-sm-6">
								<div style="text-align: left;">
									<a>베터리 잔량</a><br>
									<h1 style="color: tomato">92.0</h1>
									<p>Percentage</p>
								</div>

								<div class="w3-light-grey">
									<div class="w3-container w3-green w3-center" style="width: 92%">92%</div>
								</div>
								<br>

							</div>
							<div class="col-sm-6">
								<div style="text-align: left;">
									<a>충전 총 사이클</a><br>
									<h1 style="color: tomato">23</h1>
									<p>Cycle</p>
								</div>
								<div class="w3-light-grey">
									<div class="w3-container w3-blue w3-center" style="width: 82%">82%</div>
								</div>
								<br>
							</div>
						</div>

					</div>


					<!-- Breadcrumbs-->
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="#">배터리 종합 정보</a></li>
						<li class="breadcrumb-item active">Battery temperature</li>
					</ol>

					<div class="container">
						<div class="row">
							<link href="https://www.jqueryscript.net/css/jquerysctipttop.css"
								rel="stylesheet" type="text/css">
							<div class="col-sm-6">
								<div class="GaugeMeter" id="PreviewGaugeMeter_2"
									data-percent="88" data-append="%" data-size="130"
									data-theme="black" data-back="RGBa(0,0,0,.1)"
									data-animate_gauge_colors="1" data-animate_text_colors="1"
									data-width="15" data-label="Capacity" data-style="Arch"
									data-label_color="#2980B9"></div>

							</div>
							<div class="col-sm-6">
								<div class="GaugeMeter" id="PreviewGaugeMeter_3"
									data-percent="36"
									data-text="<font style='color:#2980B9;font-size:35px;letter-spacing:-1px'>36</font>"
									data-append="<font style='color:#2980B9'>°C</font>"
									data-size="130" data-theme="black" data-back="RGBa(0,0,0,.1)"
									data-width="15" data-label="평균 온도" data-style="Semi"
									data-label_color="#2980B9"></div>
							</div>
						</div>

						<div class="dsd" style="text-align: center;">
							<div class="GaugeMeter" id="PreviewGaugeMeter_4"
								data-percent="85" data-append="Day" data-size="130"
								data-theme="black" data-back="RGBa(0,0,0,.1)"
								data-animate_gauge_colors="1" data-animate_text_colors="1"
								data-width="15" data-label="무상 점검" data-label_color="#2980B9"
								data-stripe="2"></div>
						</div>


					</div>
						<!-- Breadcrumbs-->
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="#">상관 관계도</a></li>
						<li class="breadcrumb-item active">베터리 온도, 용량</li>
					</ol>
						<div class="row">
							<canvas id="speedChart" width="600" height="400"></canvas>
						</div>
				
				</div>


			</div>

			<div class='col-sm-6'>
				<!-- 3번째 열-->
				<div class="container-fluid">
					<!-- Breadcrumbs-->
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="#">차량 통합 제어</a></li>
						<li class="breadcrumb-item active">실내 온도, 미세먼지, 습도, 운전</li>
					</ol>

					<div class="row">
						<div class="col-xl-4 col-sm-6 mb-4">
							<div class="card text-white bg-primary o-hidden h-100">
								<div class="card-body" onclick="ChangeImage()">
									<div class="text-center">
										<B>25.9 °C</B><br> 실내 온도
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-4 col-sm-6 mb-4">
							<div class="card text-white bg-warning o-hidden h-100">
								<div class="card-body" onclick="ChangeDust()">
									<div class="text-center">
										<B>50㎍/㎥ / 12㎍/㎥ </B><br> 미세먼지, 초미세먼지
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-4 col-sm-6 mb-4">
							<div class="card text-white bg-success o-hidden h-100">
								<div class="card-body" onclick="ChangeHumidity()">
									<div class="text-center">
										<B>37%</B><br> 실내 습도
									</div>
								</div>
							</div>
						</div>

					</div>



					<div class="rows" style="margin: auto;" id="car_Status"
						onclick="ChangeDefault()">
						<img name="img2" src="view/tesla.gif"
							style="height: auto; margin-left: auto; margin-right: auto; max-height: 100%; max-width: 100%;">
						<h1 id="carStatusText" style="color: rgb(58, 220, 4);">
							<li class="b">주행중</li>
						</h1>
					</div>


					<div class="row">
						<div class="col-xl-4 col-sm-6 mb-4">
							<div class="card text-white bg-info o-hidden h-100">
								<div class="card-body">
									<div class="text-center" onclick="ChangeStatusGo()">
										<B>전진 Demo</B><br>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-4 col-sm-6 mb-4">
							<div class="card text-white bg-info o-hidden h-100">
								<div class="card-body">
									<div class="text-center" onclick="ChangeStatus()">
										<B>후진 Demo</B><br>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-4 col-sm-6 mb-4">
							<div class="card text-white bg-info o-hidden h-100">
								<div class="card-body">
									<div class="text-center" onclick="ChangeStatusBreak()">
										<B>브레이크 Demo</B><br>
									</div>
								</div>
							</div>
						</div>
						<!-- 전진 후진 브레이크-->


						<script type="text/JavaScript">
							var state = 0;
							function ChangeStatusGo() {
								if (state == 0) {
									setTimeout(
											function() {
												document.img2.src = "view/front-sig.png" //먼저 주행 신호를 
												document
														.getElementById("carStatusText").innerHTML = "감속 중!";
												document
														.getElementById("carStatusText").style.color = "#ff0000";
											}, 2000); // How long do you want the delay to be (in milliseconds)? 
									setTimeout(
											function() {
												document.img2.src = "view/tesla.gif" //먼저 주행 신호를 
												document
														.getElementById("carStatusText").innerHTML = "주행중";
												document
														.getElementById("carStatusText").style.color = "#ff0000";
											}, 4000); // How long do you want the delay to be (in milliseconds)? 
									document.img2.src = "view/back-stop.png"
									document.getElementById("carStatusText").innerHTML = "자동 운전 명령!";
									document.getElementById("carStatusText").style.color = "#ff6600";
									state = 1;
								} else if (state == 1) {
									document.img2.src = "view/tesla.gif"
									state = 0;
								}
							}
						</script>
						<!--전진 바꾸는 것-->

						<script type="text/JavaScript">
							var state = 0;
							function ChangeStatus() {
								if (state == 0) {
									setTimeout(
											function() {
												document.img2.src = "view/back-gogo.png" //먼저 주행 신호를 
												document
														.getElementById("carStatusText").innerHTML = "후진 중!";
												document
														.getElementById("carStatusText").style.color = "#ff0000";
											}, 2000); // How long do you want the delay to be (in milliseconds)? 

									document.img2.src = "view/back-sig.png"
									document.getElementById("carStatusText").innerHTML = "후진 명령!";
									document.getElementById("carStatusText").style.color = "#ff6600";
									state = 1;
								} else if (state == 1) {
									document.img2.src = "view/tesla.gif"
									state = 0;
								}
							}
						</script>
						<!--후진 바꾸는 것-->


						<script type="text/JavaScript">
							var state = 0;
							function ChangeStatusBreak() {
								if (state == 0) {
									setTimeout(
											function() {
												document.img2.src = "view/back-stop.png" //먼저 주행 신호를 
												document
														.getElementById("carStatusText").innerHTML = "브레이크!";
												document
														.getElementById("carStatusText").style.color = "#ff0000";
											}, 2000); // How long do you want the delay to be (in milliseconds)? 
									document.img2.src = "view/back-sig.png"
									document.getElementById("carStatusText").innerHTML = "브레이크 신호!";
									document.getElementById("carStatusText").style.color = "#ff6600";
									state = 1;
								} else if (state == 1) {
									document.img2.src = "view/tesla.gif"
									state = 0;
								}
							}
						</script>
						<!--브레이크 바꾸는 것-->
					</div>

				</div>
			</div>

		</div>

		<!-- /.container-fluid-->
		<!-- /.content-wrapper-->
		<footer class="sticky-footer">
			<div class="container">
				<div class="text-center">
					<small>Copyright © Sangwoo 2018</small>
				</div>
			</div>
		</footer>
		<!-- Scroll to Top Button-->
		<a class="scroll-to-top rounded" href="#page-top"> <i
			class="fa fa-angle-up"></i>
		</a>

		<!-- Bootstrap core JavaScript-->
		<script src="view/vendor/jquery/jquery.min.js"></script>
		<script src="view/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
		<!-- Core plugin JavaScript-->
		<script src="view/vendor/jquery-easing/jquery.easing.min.js"></script>
		<!-- Page level plugin JavaScript-->
		<script src="view/vendor/chart.js/Chart.min.js"></script>
		<script src="view/vendor/datatables/jquery.dataTables.js"></script>
		<script src="view/vendor/datatables/dataTables.bootstrap4.js"></script>
		<!-- Custom scripts for all pages-->
		<script src="view/js/sb-admin.min.js"></script>
		<!-- Custom scripts for this page-->
		<script src="view/js/sb-admin-datatables.min.js"></script>
		<script src="view/js/sb-admin-charts.js"></script>


		<!--HighChart design-->
		<script src="https://code.highcharts.com/highcharts.js"></script>
		<script src="https://code.highcharts.com/modules/series-label.js"></script>
		<script src="https://code.highcharts.com/modules/exporting.js"></script>
		<script src="https://code.highcharts.com/modules/export-data.js"></script>
		<script src="https://code.highcharts.com/modules/parallel-coordinates.js"></script>

		<!--가우지 계수 Javascript-->
		<script src="view/GaugeMeter.js"></script>
		<script>
			$(".GaugeMeter").gaugeMeter(); //document onready 함수를 이용해야 해서 여기에 놓음 사실 귀찬
		</script>
		<script src="view/js/newchart.js"></script>

		<!--Hight 차트와 Js Chart-->
		<script src="view/js/high&js-chart-custom.js"></script>

	</div>
</body>

</html>

