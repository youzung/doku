<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<title>Sign up</title>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="resources/css/signup.css" rel="stylesheet">

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
			<div class="col-md-7 mx-auto">
				<div id="first">
					<div class="myform form ">
						<div class="logo mb-3">
						<br>
							<a class="logo" href="mainpage"><img src ="resources/img/logo2.png"></a>
						</div>
						<br>
						<hr>
						<form method="POST" action="/doku/signup" >
							<div class="form-group">
								<label for="exampleInputEmail1">아이디</label>
								 <input type="text" name="id" class="form-control" id="userId" name ="id"
									aria-describedby="idHelp" placeholder="아이디를 입력하세요." required>
							</div>
							<div id="idError"></div>
							<br>
							<div class="form-group">
								<label for="exampleInputEmail1">이메일</label> 
								<input type="text" name="email" 
									class="form-control" aria-describedby="emailHelp"
									placeholder="이메일을 입력하세요." required>
							</div>
							<br>
							<div class="form-group">
								<label for="exampleInputEmail1">비밀번호</label> 
								<input type="password" name="pwd" id="pwd"
									class="form-control" aria-describedby="emailHelp"
									placeholder="비밀번호를 입력하세요." required>
							</div>
							<br>
							<div class="form-group">
								<label for="exampleInputEmail1">비밀번호 확인</label> 
								<input type="password" name="pwdchk" id="pwdchk"
									class="form-control" aria-describedby="emailHelp"
									placeholder="비밀번호를 재입력하세요." required>
							</div>
							<div id="pwdError"></div>
							<br>
							<div class="form-group">
								<label for="exampleInputEmail1">이름</label> 
								<input type="text" name="name" 
									class="form-control" aria-describedby="emailHelp"
									placeholder="이름을 입력하세요." required>
							</div>
							<br>
							<div class="form-group">
								<label for="exampleInputEmail1">닉네임</label> 
								<input type="text" name="nickname" id="nickname"
									class="form-control" aria-describedby="emailHelp"
									placeholder="닉네임을 입력하세요." required>
							</div>
							<div id="nicknameError"></div>
							<br>
							<div class="form-group">
								<label for="exampleInputEmail1">주소</label> 
								<input type="text" name="address" 
									class="form-control" aria-describedby="emailHelp"
									placeholder="주소를 입력하세요." required>
							</div>
							<br>
							<div class="form-group">
								<label for="exampleInputEmail1">반려견 이름(견종)</label> 
								<input type="text" name="pet" 
									class="form-control" aria-describedby="emailHelp"
									placeholder="선택사항입니다.">
							</div>
							<br>
							<div class="form-group">
								<p class="text-center">
									아이디 및 닉네임은 가입 후 변경하실 수 없으니 이점 유의해주시기 바랍니다.
								</p>
							</div>
							<br>
							<div class="col-md-12 text-center ">
								<button id ="submit" type="submit" class=" btn btn-primary btn-xl">가입하기</button>
							</div>
							<br>
							</form>
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
	<script>
		$(document).ready(function(){
			$("#userId").blur(function(){
				var id = $("#userId").val();
				$.ajax({
					url : '/doku/validateForm?id=' + id,
					type : 'get',
					success : function(data){
						if (data == true){ // id 중복됨
							$('#idError').text("이미 사용중인 아이디").css("color", "red");
							$("#submit").attr("disabled", true);
						}
						else if (id == ""){
							$('#nicknameError').text("필수 입력란입니다.").css("color", "red");
							$("#submit").attr("disabled", true);
						}
						else {
							$('#idError').text("사용 가능한 아이디").css("color", "blue");
							if ($("#nicknameError").text() == "사용 가능한 닉네임"
								&& $('#pwdError').text() == "일치합니다"){
								$("#submit").attr("disabled", false);
							}
						}
					},
					error : function(){ console.log("실패"); }
				});
			});
			$("#nickname").blur(function(){
				var nickname = $("#nickname").val();
				$.ajax({
					url : '/doku/validateForm1?nickname=' + nickname,
					type : 'get',
					success : function(data){
						if (data == true){ // id 중복됨
							$('#nicknameError').text("이미 사용중인 닉네임").css("color", "red");
							$("#submit").attr("disabled", true);
						}
						else if (nickname == ""){
							$('#nicknameError').text("필수 입력란입니다.").css("color", "red");
							$("#submit").attr("disabled", true);
						}
						else {
							$('#nicknameError').text("사용 가능한 닉네임").css("color", "blue");
							if ($("#idError").text() == "사용 가능한 아이디"
									&& $('#pwdError').text() == "일치합니다"){
								$("#submit").attr("disabled", false);
							}
						}
					},
					error : function(){ console.log("실패"); }
				});
			});
			$("#pwdchk").blur(function(){
				var pwd = $("#pwd").val();
				var pwdchk = $("#pwdchk").val();
				if(pwd != pwdchk){
					$('#pwdError').text("일치하지 않습니다").css("color","red");
					$("#submit").attr("disabled", true);
				}else{
					$('#pwdError').text("일치합니다").css("color","green");
					if ($("#idError").text() == "사용 가능한 아이디"
						&& $("#nicknameError").text() == "사용 가능한 닉네임"){
					$("#submit").attr("disabled", false);
				}
				}
			});
		})
	</script>
</body>
</html>
