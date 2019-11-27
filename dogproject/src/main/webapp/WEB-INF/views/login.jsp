<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<title>Login</title>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="resources/css/login.css" rel="stylesheet">

<script
	src="https://cdn.jsdelivr.net/jquery.validation/1.15.1/jquery.validate.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Kaushan+Script"
	rel="stylesheet">
<link
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
	crossorigin="anonymous">

<body>
	<div class="container">
		<div class="row">
			<div class="col-md-5 mx-auto">
				<div id="first">
					<div class="myform form ">
						<div class="logo mb-3">
						<br>
							<a class="logo" href="mainpage"><img src ="resources/img/logo2.png"></a>
						</div>
						<br>
						<form id ="loginForm" action="/doku/login" method="post" name="login">
							<div class="form-group">
								<label for="exampleInputEmail1">아이디</label>
								 <input type="text" name="id" class="form-control" id="id" name ="id"
									aria-describedby="idHelp" placeholder="아이디를 입력하세요." required>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">비밀번호</label> 
								<input type="password" name="pwd" id="pwd"
									class="form-control" aria-describedby="emailHelp"
									placeholder="비밀번호를 입력하세요." required>
							</div>
							<div id="loginError"></div>
							<br>
							<div class="col-md-12 text-center ">
								<button type="button" id="submit" class=" btn btn-primary btn-xl">로그인</button>
							</div>
							</form>
							<br>
							<br>
							<div class="form-group">
								<p class="text-center">
									아직 회원이 아니신가요? <a href="signup" id="signup">회원가입</a>
								</p>
								<p class="find text-center">
									<a href="#" id="signup">아이디/비밀번호 찾기</a>
								</p>
							</div>
						

					</div>
				</div>
			</div>
		</div>
	</div>
	<footer class="footer">
		<div class="container">
			<span class="copyright">Copyright &copy; Doku 2019</span>
		</div>
	</footer>

<%
	if(request.getAttribute("msg") != null) {
%>
<script>
	alert('${msg}');
</script>
<%
	}
%>	
<script>
	$(document).ready(function(){
		$("#submit").click(function(){
			var id = $("#id").val();
			var pwd = $("#pwd").val();
			var x = false;
			if(id==""){
				$("#loginError").text("아이디를 입력하세요.").css("color", "red");		
				return;
			}else if(pwd==""){
				$("#loginError").text("비밀번호를 입력하세요.").css("color", "red");		
				return;
			}
			$.ajax({
				url : '/doku/login?id='+id+'&pwd='+pwd,
				type : 'post',
				success : function(data){
					if(data==false){
							$("#loginError").text("아이디와 비밀번호가 일치하지 않습니다.").css("color", "red");
					}else{
						window.location.href ='/doku/mainpage';						
					}
				}
			});
		});
	});
</script>
</body>
</html>
