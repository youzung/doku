<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동물 병원</title>
<script src="http://code.jquery.com/jquery-1.7.js"></script>
<link rel="stylesheet"
	href="https://unpkg.com/leaflet@1.5.1/dist/leaflet.css"
	integrity="sha512-xwE/Az9zrjBIphAcBb3F6JVqxf46+CDLwfLMHloNu6KEQCAWi6HcDUbeOfBIptF7tcCzusKFjFw2yuvEpDL9wQ=="
	crossorigin="" />
<script src="https://unpkg.com/leaflet@1.5.1/dist/leaflet.js"
	integrity="sha512-GffPMF3RvMeYyc1LWMHtK8EbPv0iNZ8/oTtHPx9/cc2ILxQ+u905qIwdpULaqDkyBKgOaB57QTMg7ztg8Jm2Og=="
	crossorigin=""></script>

<!-- Bootstrap core CSS -->
<link href="resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom fonts for this template -->
<link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css">
<link href='https://fonts.googleapis.com/css?family=Kaushan+Script'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700'
	rel='stylesheet' type='text/css'>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- Custom styles for this template -->
<link href="resources/css/map.css" rel="stylesheet">

</head>
<body>
<!-- Navigation -->
 <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav" style="background-color: rgba(242,159,148,0.5) !important;">
		<div class="container">
			<a class="navbar-brand js-scroll-trigger" href="mainpage"><img src ="resources/img/logo.png"></a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				Menu <i class="fas fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav text-uppercase ml-auto">
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="boardmain?page=1">게시판</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="calendar">일정관리</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="map">동물 병원</a></li>
					<li class="nav-item" id="tmp_signup" style="display:block"><a class="nav-link js-scroll-trigger"
						href="signup">회원가입</a></li>
					<li class="nav-item" id="tmp_login" style="display:block"><a class="nav-link js-scroll-trigger"
						href="loginmain">로그인</a></li>					
					<li class="nav-item" id ="user" style="display:block;position: relative;">
					<a id="dropdown" class="nav-link js-scroll-trigger" style="display:block;">${sessionScope.nickname}</a>
						<div class="dropdown-content" style="display: none; color:#95b3d7 !important;width:140px;padding: 10px 15px 0 15px; height:75px; position: absolute;top: 50px;left: 0;background: #fff; opacity:0.7">
							<a class = "dcontent" href="mypage" style="padding: 0; color:#b88269 !important; text-decoration:none;">마이페이지</a><br>
							<a class = "dcontent" href="logout" style="padding: 0; color:#b88269 !important; text-decoration:none;">로그아웃</a>
						</div>
							<script>
								$("#dropdown").mouseover(function(){
									
									$(".dropdown-content").css("display", "block");
								});
								
								$(".dropdown-content").mouseleave(function(){
									$(this).css("display", "none");
								});
								
								$("a.dcontent").mouseover(function(){
									$(this).css("color", "#95b3d7");
								});
								$("a.dcontent").mouseleave(function(){
									$(this).css("color", "#000");
								});
							</script>
					</li>
				</ul>
			</div>
		</div>
	</nav>

<div class="blank" style="height:150px;">
</div>

<!-- 동물병원 -->
	<div class="wrapper">
	<h1 style="color: #717e91;"><i class="fas fa-map-marked-alt"></i>&nbsp;우리 지역 동물 병원 찾기</h1>
	<div>
			<input type="text" id="addr" placeholder="지역을 입력하세요" style="border:0; outline:0; width:84%; height:70px; font-size:25px; border-bottom: 1px solid rgba(143,148,156,0.5);">
			<input type="button" class="searchBtn" id="search" value="search" style="border:0; outline:0; width:15%; height: 50px; padding: 5px 15px; background-color: #95b3d7; color: white">
	</div>
	<div style="height:10px;"></div>
	<div id="mapid" style="width: auto; height: 500px; padding-top:15px;"></div>
	</div>
	
	<!-- footer -->
	<footer class="footer">
		<div class="container">
			<span class="copyright">Copyright &copy; Doku 2019</span>
		</div>
	</footer>
	
	
	<script>
		var first = true;
		var group;
		var mymap;
		$(document).ready(
			function() {
				var initMap = function(lat, lng) {
					if (mymap)
						mymap.remove();
					mymap = L.map('mapid').setView([ lat, lng ], 14);
					L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw',
					{	
						maxZoom : 18,
						attribution : 'Map data © <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, '
									+ '<a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, '
									+ 'Imagery <a href="https://www.mapbox.com/">Mapbox</a>',
						id : 'mapbox.streets'

					}).addTo(mymap);

					if (first == true)
						setMarker();
					first = false;
					group.addTo(mymap);

					}

				
			 var myIcon = L.icon({
				iconUrl:'/doku/resources/img/marker.png',
				iconSize:[25,45]
			}) 
			function setMarker() {
				var marker = new Array();
				var name = new Array();
				var addr = new Array();

				<c:forEach items="${list}" var="list">
					marker.push(L.marker([ "${list.lat}","${list.lng}" ] , {icon: myIcon}));
					name.push("${list.name}");
					addr.push("${list.addr}");

				</c:forEach>

				group = L.layerGroup(marker);

				var offset = Object.keys(group._layers)[0];
						
				group.eachLayer(function(layer, i) {
				var id = group.getLayerId(layer);

				layer.bindPopup("상호 : " + name[id - offset]
								+ "<br>주소 : "+ addr[id - offset]);

				});

				group.addTo(mymap);
			}

			function addToCoord() {
				var addr = $('#addr').val();
				var lat;
				var lng;
				if(addr){
					$.getJSON("https://maps.googleapis.com/maps/api/geocode/json?key=AIzaSyD-nx_y7aBlJgfgVZRaIwMbnShQJsxpryY&address="+ encodeURIComponent(addr),
						function(data) {
							lat = data.results[0].geometry.location.lat;
							lng = data.results[0].geometry.location.lng;
							initMap(lat, lng);
						});
					}
				}
			
			$("#search").click(function() {
				addToCoord();
				});
			initMap(37.2457927, 127.0573667);
		});
	</script>
	
<c:if test="${sessionScope.id != null}">
	<script>
	$('#sbutton').hide();
	$('#tmp_signup').hide();
	$('#tmp_login').hide();
	</script>
</c:if>

<c:if test="${sessionScope.id == null}">
	<script>
	$('#user').hide();
	</script>
</c:if>
	
	<!-- Bootstrap core JavaScript -->
	<script src="resources/vendor/jquery/jquery.min.js"></script>
	<script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Plugin JavaScript -->
	<script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>


	<!-- Custom scripts for this template -->
	<script src="resources/js/agency.min.js"></script>
</body>
