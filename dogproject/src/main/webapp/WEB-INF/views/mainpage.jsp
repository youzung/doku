<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<style>
.sendMsg {
	width: auto;
	font-size: medium;
	text-align: right;
	position: relative;
	padding: 0px;
	background: #badbff;
	color: #556677;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	padding-left: 5px;
	padding-right: 10px;
	padding-top: 5px;
	padding-bottom: 5px;
}

.sendMsg:after {
	content: '';
	position: absolute;
	border-style: solid;
	border-width: 0 0px 0px;
	border-color: #FFF97D transparent;
	display: block;
	width: 0;
	z-index: 1;
	top: -0px;
	left: 267px;
}

.receiveMsg {
	font-size: medium;
	text-align: left;
	position: relative;
	padding: 0px;
	background: #ffeedd;
	color: #556677;
	-webkit-border-radius: 23px;
	-moz-border-radius: 23px;
	border-radius: 23px;
	padding-left: 5px;
	padding-right: 10px;
	padding-top: 5px;
	padding-bottom: 5px;
}

.receiveMsg:after {
	content: '';
	position: absolute;
	border-style: solid;
	border-width: 0 0px 0px;
	border-color: #F4FFFF transparent;
	display: block;
	width: 0;
	z-index: 1;
	top: -0px;
	left: 254px;
}

.wrap {
	margin : auto;
	align : center;
	overflow: scroll;
	width: 800px;
	padding: 30px;
	background: #e1eef7;
	overflow-x: hidden;
	height: 400px;
}

.wrap2{
	margin : auto;
	align : center;
	width: 100%;
	padding: 15px;
}

.wrap:after {
	display: block;
	content: '';
	clear: both;
}

.box {
	float: left;
	margin-right: 50%;
	margin-bottom: 10px;
}

.right {
	text-align: right;
	float: right;
	margin-right: 0;
	margin-left: 50%;
}
</style>

<head>


<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Doku</title>

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
	href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700'
	rel='stylesheet' type='text/css'>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- Custom styles for this template -->
<link href="resources/css/agency.css" rel="stylesheet">

</head>

<body id="page-top">

	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
		<div class="container">
			<a class="navbar-brand js-scroll-trigger" href="#page-top"><img src ="resources/img/logo.png"></a>
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
						<div class="dropdown-content" style="display: none; color:#95b3d7 !important;width:140px;padding: 10px 15px 0 15px; height:75px;position: absolute;top: 50px;left: 0;background: #fff; opacity:0.7">
							<a class = "dcontent" href="mypage" style="padding: 0; color:#000 !important; text-decoration:none;">마이페이지</a><br>
							<a class = "dcontent" href="logout" style="padding: 0; color:#000 !important; text-decoration:none;">로그아웃</a>
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

	<!-- Header -->
	<header class="masthead">
		<div class="container">
			<div class="intro-text">
				<div class="intro-heading" style="color:black;" >반려견을 위한 단 하나의 공간</div>
				<a class="btn btn-primary btn-xl text-uppercase js-scroll-trigger"
					href="loginmain" id="sbutton">시작 하기</a>
				
			</div>
		</div>
	</header>

	<!-- Services -->
	<section class="page-section" id="services">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h2 class="section-heading text-uppercase">Welcome to Doku</h2>
					<h3 class="section-subheading text-muted">Doku 웹사이트 방문을 환영합니다.</h3>
				</div>
			</div>
			<div class="row text-center">
				<div class="col-md-4">
					<a href=boardmain?page=1>
					<span class="fa-stack fa-4x"> 
					<i class="fas fa-circle fa-stack-2x"></i>
						<i class="fas fa-clipboard-list fa-stack-1x fa-inverse"></i>
					</span>
					</a>
					<h4 class="service-heading">게시판</h4>
					<p class="text-muted">다양한 이야기를 나누어 보세요.</p>
				</div>
				<div class="col-md-4">
					<a href=calendar>
					<span class="fa-stack fa-4x"> <i
						class="fas fa-circle fa-stack-2x "></i> <i
						class="far fa-calendar-alt fa-stack-1x fa-inverse"></i>
					</span>
					</a>
					<h4 class="service-heading">일정관리</h4>
					<p class="text-muted">반려견을 위한 일정을 정리하세요.</p>
				</div>
				<div class="col-md-4">
					<a href=map>
					<span class="fa-stack fa-4x"> 
					<i class="fas fa-circle fa-stack-2x"></i> 
						<i class="fas fa-clinic-medical fa-stack-1x fa-inverse"></i>
					</span>
					</a>
					<h4 class="service-heading">동물 병원</h4>
					<p class="text-muted">우리 동네 동물 병원을 찾아보세요.</p>
				</div>
			</div>
		</div>
	</section>

	<!-- Chat -->

	<section class="page-section" id="chat" style="border-top:1px solid #e8e8e8">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h2 class="section-heading text-uppercase">Chat with others</h2>
					<h3 class="section-subheading text-muted">다른 사람들과 채팅하기</h3>
				</div>
			</div>
		</div>
		
		<br />
		
	<!-- 채팅창 -->
	<div style="width:800px; height:400px; align:center; margin:auto">
		<div id="messageDiv" class="wrap"></div>
		<div class="wrap2">
			<form onsubmit='return false' style="margin : auto;">
				<!-- 송신 메시지 작성하는 창 -->
				<input onkeyup="enterkey()" id="textMessage" style=" border:0; outline:0; border-bottom:1px solid #bfbfbf;width: 82%;"
				type="text" placeholder="메시지를 입력해주세요.">
				<!-- 송신 버튼 -->
				<input style="width:17%; border:0; outline:0; background-color:#f29f94; color: white;" onclick="sendMessage()" value="Send" type="button">
			</form>
		</div>
	</div>
	</section>
	
	
	<!-- Footer -->
	<footer class="footer">
		<div class="container">
			<span class="copyright">Copyright &copy; Doku 2019</span>
		</div>
	</footer>



	<!-- Bootstrap core JavaScript -->
	<script src="resources/vendor/jquery/jquery.min.js"></script>
	<script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Plugin JavaScript -->
	<script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>


	<!-- Custom scripts for this template -->
	<script src="resources/js/agency.min.js"></script>



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

<% 
	if(request.getAttribute("msg") != null) {
%>
<script>
	alert('${msg}');
</script>
<%
	}
%>

	<script type="text/javascript">
	var num = Math.floor((Math.random()*1000000)+1);
		//WebSocketEx는 프로젝트 이름
		//websocket 클래스 이름
		var webSocket = new WebSocket(
			"ws://"+location.host+"/doku/websocket/mainpage");	
		var messageDiv = document.getElementById("messageDiv");
		//웹 소켓이 연결되었을 때 호출되는 이벤트
		webSocket.onopen = function(message) {
			messageDiv.innerHTML += "<h4>ʕっ•ᴥ•ʔっ ღ방문을 환영합니다ღʕᵔᴥᵔʔʕ•ᴥ•ʔෆ </h4><br>";
		};

		//웹 소켓이 닫혔을 때 호출되는 이벤트

		webSocket.onclose = function(message) {
			messageDiv.innerHTML += "Server Disconnect...<br>";
		};

		//웹 소켓이 에러가 났을 때 호출되는 이벤트

		webSocket.onerror = function(message) {
			messageDiv.innerHTML += "error...<br>";
		};

		//웹 소켓에서 메시지가 날라왔을 때 호출되는 이벤트

		webSocket.onmessage = function(message) {
			messageDiv.innerHTML += message.data;
			var audio = new Audio(
					'http://'+location.host+'/websocket/resources/audio/카톡.mp3');
			audio.play();
			var chatScroll = document.getElementById("messageDiv");
			chatScroll.scrollTop = chatScroll.scrollHeight;
		};

		//Send 버튼을 누르면 실행되는 함수

function sendMessage() {	
	var message = document.getElementById("textMessage");
	if (!message.value == "") {
		messageDiv.innerHTML += "<div class ='box right'><div class = 'sendMsg'>"
				+ message.value + "</div></div>";
		//웹소켓으로 textMessage객체의 값을 보낸다.
		<% if(session.getAttribute("nickname") != null) {%>
		webSocket.send('<%= session.getAttribute("nickname")%>' + ":" + message.value);
		<%} else{%>
		webSocket.send("비회원" + num + ":" + message.value);
		<%}%>
		//textMessage객체의 값 초기화
		var chatScroll = document.getElementById("messageDiv");
		chatScroll.scrollTop = chatScroll.scrollHeight;
	}
}
		//웹소켓 종료

		function disconnect() {

			webSocket.close();

		}
	</script>
	<script>
		function enterkey() {
			if (window.event.keyCode == 13) {
				sendMessage();
				// 엔터키가 눌렸을 때 실행할 내용
				document.getElementById("textMessage").value = "";
			}
		}
	</script>


</body>

</html>
 
 