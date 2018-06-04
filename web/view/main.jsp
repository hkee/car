<%@page import="com.vo.CarInfo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

<%
	// 인증된 세션이 없는경우, 해당페이지를 볼 수 없게 함.
	if (session.getAttribute("signedUser") == null) {
		response.sendRedirect("login.do");
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내일 이음 카</title>
<meta name="description" content="description">
<meta name="author" content="DevOOPS">
<meta name="viewport" content="width=device-width, initial-scale=1">

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
<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
				<script src="http://getbootstrap.com/docs-assets/js/html5shiv.js"></script>
				<script src="http://getbootstrap.com/docs-assets/js/respond.min.js"></script>
		<![endif]-->


</head>
<body>
	<!--Start Header-->
	<div id="screensaver">
		<canvas id="canvas"></canvas>
		<i class="fa fa-lock" id="screen_unlock"></i>
	</div>
	<div id="modalbox">
		<div class="devoops-modal">
			<div class="devoops-modal-header">
				<div class="modal-header-name">
					<span>Basic table</span>
				</div>
				<div class="box-icons">
					<a class="close-link"> <i class="fa fa-times"></i>
					</a>
				</div>
			</div>
			<div class="devoops-modal-inner"></div>
			<div class="devoops-modal-bottom"></div>
		</div>
	</div>
	<header class="navbar">
		<div class="container-fluid expanded-panel">
			<div class="row">
				<div id="logo" class="col-xs-12 col-sm-2">
					<a href="index.html">TCS</a>
				</div>
				<div id="top-panel" class="col-xs-12 col-sm-10">
					<div class="row">
						<div class="col-xs-4 col-sm-8 top-panel-right"
							style="float: right;">

							<ul class="nav navbar-nav pull-right panel-menu">
								<li class="hidden-xs"><a href="index.html"
									class="modal-link"> <i class="fa fa-bell"></i>
								</a></li>
								<li class="hidden-xs"><a class="ajax-link"
									href="ajax/calendar.html"> <i class="fa fa-calendar"></i>
								</a></li>
								<li class="hidden-xs"><a href="ajax/page_messages.html"
									class="ajax-link"> <i class="fa fa-envelope"></i>
								</a></li>
								<li class="dropdown"><a href="#"
									class="dropdown-toggle account" data-toggle="dropdown">
										<div class="avatar">
											<img src="resources/devoops/img/lion.jpg" class="img-circle"
												alt="avatar" />
										</div> <i class="fa fa-angle-down pull-right"></i>
										<div class="user-mini pull-right">
											<span class="welcome">Welcome,</span> <span>${sessionScope.signedUser }</span>
										</div>
								</a>
									<ul class="dropdown-menu">
										<li><a href="#"> <i class="fa fa-user"></i> <span>Profile</span>
										</a></li>

										<li><a href="#"> <i class="fa fa-cog"></i> <span>Settings</span>
										</a></li>
										<li><a href="logout.do"> <i class="fa fa-power-off"></i>
												<span>Logout</span>
										</a></li>
									</ul></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
	<!--End Header-->
	<!--Start Container-->
	<div id="main" class="container-fluid">
		<div class="row">
			<div id="sidebar-left" class="col-xs-2 col-sm-2">
				<ul class="nav main-menu">
					<li><a href="main.do" > <i
							class="fa fa-dashboard"></i> <span class="hidden-xs">Dashboard</span>
					</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle">
							<i class="fa fa-bar-chart-o"></i> <span class="hidden-xs">Charts</span>
					</a>
						<ul class="dropdown-menu">
							<c:forEach items="${carlist}" var="car"> 
							<li><a  href="diagnosis.do?car_num=${car.car_num }&car_type=${car.car_type}">${car.car_type }</a></li>
							
							</c:forEach> 
						</ul></li>
				
					<li class="dropdown"><a href="#" class="dropdown-toggle">
							<i class="fa fa-pencil-square-o"></i> <span class="hidden-xs">Settings</span>
					</a>
						<ul class="dropdown-menu">
						<%-- <%List<CarInfo> cinfolist =(List<CarInfo>)session.getAttribute("carlist"); %>
							<li><a class="ajax-link" href="ajax/forms_elements.html"><%=cinfolist.get(1).getCar_num() %></a></li> --%>
							<c:forEach items="${carlist}" var="car"> 
							<li><a  href="settingsupply.do?car_num=${car.car_num }">${car.car_type }</a></li>
							
							</c:forEach> 
							
						</ul></li>
				
					
					<li class="dropdown"><a href="#" class="dropdown-toggle">
							<i class="fa fa-map-marker"></i> <span class="hidden-xs">Maps</span>
					</a>
						<ul class="dropdown-menu">
							<li><a class="ajax-link" href="ajax/maps.html">OpenStreetMap</a></li>
							<li><a class="ajax-link" href="ajax/map_fullscreen.html">Fullscreen
									map</a></li>
							<li><a class="ajax-link" href="ajax/map_leaflet.html">Leaflet</a></li>
						</ul></li>
					
			
					
				</ul>
			</div>
			<!--Start Content-->
			<div id="content" class="col-xs-12 col-sm-10">
				<!-- <div id="about">
					<div class="about-inner">
						<h4 class="page-header">Open-source admin theme for you</h4>
						<p>DevOOPS team</p>
						<p>
							Homepage - <a href="http://devoops.me" target="_blank">http://devoops.me</a>
						</p>
						<p>
							Email - <a href="mailto:devoopsme@gmail.com">devoopsme@gmail.com</a>
						</p>
						<p>
							Twitter - <a href="http://twitter.com/devoopsme" target="_blank">http://twitter.com/devoopsme</a>
						</p>
						<p>Donate - BTC 123Ci1ZFK5V7gyLsyVU36yPNWSB5TDqKn3</p>
					</div>
				</div>
				<div class="preloader">
					 <img src="img/devoops_getdata.gif" class="devoops-getdata"
						alt="preloader" /> 
				</div>
				<div id="ajax-content"></div> -->
				<jsp:include page="${center }.jsp"></jsp:include>
			</div>
			<!--End Content-->
		</div>
	</div>
	<!--End Container-->
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<!-- 		<script src="http://code.jquery.com/jquery.js"></script> -->
<!-- <script -->
<!--   src="https://code.jquery.com/jquery-2.2.4.js" -->
<!--   integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI=" -->
<!--   crossorigin="anonymous"></script> -->
	<script src="resources/devoops/plugins/jquery/jquery.min.js"></script>
	<script src="resources/devoops/plugins/jquery-ui/jquery-ui.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="resources/devoops/plugins/bootstrap/bootstrap.min.js"></script>
	<script
		src="resources/devoops/plugins/justified-gallery/jquery.justifiedGallery.min.js"></script>
	<script src="resources/devoops/plugins/tinymce/tinymce.min.js"></script>
	<script src="resources/devoops/plugins/tinymce/jquery.tinymce.min.js"></script>
	<!-- All functions for this theme + document.ready processing -->
	<script src="resources/devoops/js/devoops.js"></script>
</body>
</html>
