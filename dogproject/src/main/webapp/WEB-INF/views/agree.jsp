<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>약관 동의 페이지 임시</h1>
	<button type="submit" onclick="signup(1)">동의</button>
	<button type="submit" onclick="signup(2)">비동의</button>
</body>
<script>
function signup(cv){
	if(cv==1){
		location.href = "/doku/signup";
	}else if(cv==2){
		location.href = "/doku/mainpage";
	}
}
</script>
</html>