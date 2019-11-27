<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>새로운 글쓰기</title>

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
<link href="resources/css/boardwrite.css" rel="stylesheet">

</head>

<body id="page-top">

	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
		<div class="container">
			<a class="navbar-brand js-scroll-trigger" href="mainpage"><img src ="resources/img/logo2.png"></a>
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
						href="#동물병원">동물 병원</a></li>
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

<div class="blank" style="height:150px;">
</div>
	
	
	
	<!-- 글 작성 -->
	
<div class="wrapper">	
	<div id="write">
		<h2><i class="fas fa-pen"></i>&nbsp;글쓰기</h2><br>
		
		<form method="post" action="/doku/boardinsert" enctype="multipart/form-data" >

		<input type="hidden" name="action" value="insert">
		
		<div class="category">
		<div class="btn-category" role="button">
			<select class="btn-category-select" id="header" name="header">
    			<option id="header1">기타</option>
         		<option id="header2">반려견 상식</option>
         		<option id="header3">우리개 자랑</option>
      			<option id="header4">질문</option>
      		</select> 
		</div>
		</div>

		<input id="nickname" name="nickname" type="hidden" value="${sessionScope.nickname}"><br>

		<div class="post-title">
   			<textarea name="title" class = "textarea_tit" placeholder="제목을 입력하세요" style="height:42px;" spellcheck="false" required></textarea>
		</div>

		<div>
			<textarea class="content" id ="content" name="content" placeholder="내용을 입력하세요" required></textarea>
		</div>
		<br><br>
		<input type="file" value="파일 선택" name="photoDir1"
               id="photoDir1" multiple="multiple">
               		<br><br>
		<div id="buttons" >
			<input style="width:30%; border: 0; outline:0; background-color: #f29f94; padding:10px; color: white;" id="submit" type="submit" name="submit" value="저장">
			<input style="width:30%; border: 0; outline:0; background-color: #f29f94; padding:10px; color: white" id="reset" type="reset" name="reset" value="재작성">
			<input style="width:30%; border: 0; outline:0; background-color: #f29f94; padding:10px; color: white" id="cancel" onclick="history.back(-1);" type="button" name="cancle" value="취소">
		</div>
		<br><br>
		</form>
	</div>
</div>

<script>
function displayDiv(){
   location.href='/doku/boardmain?page=1';
}
</script>


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

</body>

</html>

