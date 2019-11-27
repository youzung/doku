<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>


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
<link href="resources/css/mypage.css" rel="stylesheet">


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
							<a class = "dcontent" href="mypage?action=none&page=1" style="padding: 0; color:#b88269 !important; text-decoration:none;">마이페이지</a><br>
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

<div class="blank" style="height:180px;">
</div>

<!-- 마이페이지  -->
<div id="mypage" align="center" style="display:block; margin:auto;">
<table>
<tr>
	<td id="my1" class="my">아이디 : </td><td id="my2" class="my">${sessionScope.id}</td> 
</tr>
<tr>
	<td id="my1" class="my">이메일 : </td><td id="my2" class="my">${sessionScope.email}</td> 
	</tr>
<tr>
	<td id="my1" class="my">이름 : </td><td id="my2" class="my">${sessionScope.name}</td> 
</tr>
<tr>	
	<td id="my1" class="my">닉네임 : </td><td id="my2" class="my">${sessionScope.nickname}</td> 
</tr>
<tr>	
	<td id="my1" class="my">주소 : </td><td id="my2" class="my">${sessionScope.address}</td> 
</tr>
<tr>	
	<td id="my1" class="my">견종 : </td><td id="my2" class="my">${sessionScope.pet}</td> 
</tr>
</table>
<br>
<div id="btn">
<button id="btn1" class="btn-primary" onclick="updateinfo(1)">회원 정보 수정</button>
<button id="btn2" class="btn-primary" onclick="secession(2)">회원 탈퇴</button>
</div>
</div>
<br>


<% 
	if(request.getAttribute("msg") != null) {
%>
<script>
	alert('${msg}');
</script>
<%
	}
%>

<div class="divset" align="center" id="secessionpwd" style="display:none">
	<h3>개인 정보 보호를 위해 비밀번호를 한번 더 입력해주세요.</h3>
	<br>
	<input type="hidden" id="pwd1" name="pwd" value="${sessionScope.pwd}">
	<input type="password" id="pwdchk1" name="pwdchk"><br><br>
	<div id="btnset">
	<button class="btn-primary btn-select" id="sec"
	disabled="disabled" onclick="secession(3)">확인</button>
	<button class="btn-primary" id="btn2" onclick="secession(1)">취소</button>
	</div>
	<div id="pwdError1"></div><br>
</div>

<div class="divset" align="center" id="secession" style="display:none">
	<form method="post" action="/doku/secession">
	<h3>탈퇴 하시겠습니까?</h3><br>
		<div id="btnset">
	<input class="btn-primary btn-select" type="submit" value="예">
	<button class="btn-primary" id="btn2" type="button" onclick="secession(1)">아니오</button>
	</div>
	</form>
</div>

<div class="divset" align="center" id="mypagepwd" style="display:none">
	<h3>개인 정보 보호를 위해 비밀번호를 한번 더 입력해주세요.</h3>
	<br>
	<input type="hidden" id="pwd2" name="pwd" value="${sessionScope.pwd}">
	<input type="password" id="pwdchk2" name="pwdchk"><br><br>
	<div id="btnset">
	<button class="btn-primary btn-select" id="update"
	disabled="disabled" onclick="updateinfo(3)">확인</button>
	<button class="btn-primary" id="btn2" onclick="updateinfo(2)">취소</button>
	</div>
	<div id="pwdError2"></div><br>
</div>

<div class="divset" align="center" id="updateinfo" style="display:none">
	<form method="post" action="/doku/update" style="height:420px;">
		<input type="hidden" name="action" value="update">
		<input type="hidden" name="id" value="${sessionScope.id}">
		<table>
			<tr>
			<td id="my3" class="my">아이디 :</td>
			<td id="my2" class="my">${sessionScope.id}</td>
			</tr>
			<tr>
			<td id="my3" class="my">변경 비밀번호 :</td>
			<td class="my"><input class="my2" type="password" name="pwd" id="pwd" value="${sessionScope.pwd}"></td>
			</tr>
			<tr>
			<td id="my3" class="my">비밀번호 확인 :</td>
			<td class="my"><input class="my2" type="password" name="pwdchk" id="pwdchk" value="${sessionScope.pwdchk}"></td>
			</tr>
			<tr>
			<td id="my3" class="my">이메일 :</td>
			<td class="my"><input class="my2" type="text" name = "email" id="email" value="${sessionScope.email}"></td>
			</tr>
			<tr>
			<td id="my3" class="my">주소 :</td>
			<td class="my"><input class="my2" type="text" name = "address" id="address" value="${sessionScope.address}"></td>
			</tr>
			<tr>
			<td id="my3" class="my">견종 :</td>
			<td class="my"><input class="my2" type="text" name = "pet" id="pet" value="${sessionScope.pet}"></td>
			</tr>
		</table>
		<br>
		<div id="pwdError3"></div>
		<br>
		<input class="btn-primary" id="submit" type="submit" value="수정"><br>
	</form>
</div>

<script>
$(document).ready(function(){
	$("#pwdchk1").blur(function(){
		var pwd = $("#pwd1").val();
		var pwdchk = $("#pwdchk1").val();
		if(pwd != pwdchk){
			$('#pwdError1').text("비밀번호가 일치하지 않습니다").css("color","red");
			$("#sec").attr("disabled", true);
		}else{
			$('#pwdError1').text("비밀번호가 일치합니다").css("color","green");
			$("#sec").attr("disabled", false);
		}
	});
	$("#pwdchk2").blur(function(){
		var pwd = $("#pwd2").val();
		var pwdchk = $("#pwdchk2").val();
		if(pwd != pwdchk){
			$('#pwdError2').text("비밀번호가 일치하지 않습니다").css("color","red");
			$("#update").attr("disabled", true);
		}else{
			$('#pwdError2').text("비밀번호가 일치합니다").css("color","green");
			$("#update").attr("disabled", false);
		}
	});
	$("#pwdchk").blur(function(){
		var pwd = $("#pwd").val();
		var pwdchk = $("#pwdchk").val();
		if(pwd != pwdchk){
			$('#pwdError3').text("비밀번호가 일치하지 않습니다").css("color","red");
			$("#submit").attr("disabled", true);
		}else{
			$('#pwdError3').text("비밀번호가 일치합니다").css("color","green");
			$("#submit").attr("disabled", false);
		}
	});
	$("#pwd").blur(function(){
		var pwd = $("#pwd").val();
		var pwdchk = $("#pwdchk").val();
		if(pwd != pwdchk){
			$('#pwdError3').text("비밀번호가 일치하지 않습니다").css("color","red");
			$("#submit").attr("disabled", true);
		}else{
			$('#pwdError3').text("비밀번호가 일치합니다").css("color","green");
			$("#submit").attr("disabled", false);
		}
	});
})
</script>

<script>
	function updateinfo(cv){
		if(cv==1){
			document.getElementById("mypage").style.display='none';	
			document.getElementById("mypagepwd").style.display='block';	
		}else if(cv==2){
			location.href="/doku/mypage?action=none&page=1";
		}else if(cv==3){
			document.getElementById("mypagepwd").style.display='none';
			document.getElementById("updateinfo").style.display='block';	
		}
	}
	function secession(cv){
		if(cv==1){
			location.href="/doku/mypage?action=none&page=1";
		}else if(cv==2){
			document.getElementById("secessionpwd").style.display='block';
			document.getElementById("mypage").style.display='none';
		}else if(cv==3){
			document.getElementById("secessionpwd").style.display='none';
			document.getElementById("secession").style.display='block';
		}
	}
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

<!-- footer -->

	<!-- footer -->
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
	
</body>
</html>