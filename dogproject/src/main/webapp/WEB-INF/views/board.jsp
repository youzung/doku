<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="model.vo.BoardVO, model.vo.CommentsVO, java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>board</title>

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
<link href="resources/css/board.css" rel="stylesheet">

</head>

<body id="page-top">

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


	<!-- 게시판 -->
	
		<article>
		<br>
		<div class="wrapper">
			
<%
	ArrayList<BoardVO> list = (ArrayList<BoardVO>)request.getAttribute("list");
	BoardVO listOne = (BoardVO)request.getAttribute("listOne");
	if(list != null) {
%>
			<table class ="listt">
			<h1>&nbsp;<i class="far fa-newspaper"></i>&nbsp;게시판</h1><br><br>
				<tr class="jemok">
					<td id="a">번호</td>
					<td id="b" style="text-align: center;">제목</td>
					<td id="c">작성자</td>
					<td id="d">작성일</td>
					<td id="e">조회수</td>
				</tr>
<% 
	for(BoardVO vo : list){
%>
				<tr class="contents">
					<td class='<%= vo.getId() %>'><%= vo.getId() %></td>
					<td id="titleline" class='<%= vo.getId() %>' 
						onclick="displayReadForm('<%=vo.getId()%>')">
						<span id="head">[<%= vo.getHeader() %>]</span><%= vo.getTitle() %></td>					
					<td class='<%= vo.getId() %>'>
						<%= vo.getNickname() %></td>
					<td class='<%= vo.getId() %>'><%= vo.getWritedate() %></td>
					<td id="cnt<%=vo.getId() %>" class='<%= vo.getId() %>'><%= vo.getCnt() %></td>
				</tr>
<%
	}
%>
			</table>

	<br>
	<div style="text-align:right"><a href="boardwrite" id="writenews" style="color:#adadad; margin:10px"><i class="fas fa-edit fa-2x"></i></a></div>
	
	<!-- pagination -->
	<div class="page" style="font-size:20px; text-align:center !important; height:50px; margin:10px; padding: 0 auto !important;">
	
	<c:if test="${pagination.curRange ne 1 }">
			<a class="page-num" style="margin:10px" onClick="fn_paging(1)"><i class="fas fa-angle-double-left"></i></a>
		</c:if>
		<c:if test="${pagination.curPage ne 1}">
			<a class="page-num" style="margin:10px" onClick="fn_paging('${pagination.prevPage }')"><i class="fas fa-angle-left"></i></a>
		</c:if>
			<c:forEach var="pageNum" begin="${pagination.startPage }"
         end="${pagination.endPage }">
         <c:choose>
            <c:when test="${pageNum eq  pagination.curPage}">
               <span style="font-weight: bold;"><a style="color:black !important; margin:10px;" class="page-num" href="#"
                  onClick="fn_paging('${pageNum }')">${pageNum }</a></span>
            </c:when>
            <c:otherwise>
               <a class="page-num" style="color:black !important; margin:10px;"href="#" onClick="fn_paging('${pageNum }')">${pageNum }</a>
            </c:otherwise>
         </c:choose>
      </c:forEach>
       <c:if test="${pagination.curPage ne pagination.pageCnt && pagination.pageCnt > 0}">
			<a class="page-num" onClick="fn_paging('${pagination.nextPage }')"><i class="fas fa-angle-right"></i></a>
			</c:if>
	<c:if test="${pagination.curRange ne pagination.rangeCnt && pagination.rangeCnt > 0}">
			<a class="page-num" onClick="fn_paging('${pagination.pageCnt }')"><i class="fas fa-angle-double-right"></i></a>
	</c:if>
	</div>
	
	<!-- 검색창 -->
	<div align="center">
		<form method="get" action="/doku/boardsearch">
			<input type="hidden" name="action" value="search">
			<select id="searchType" name="searchType" style="border:0; outline:0; border-bottom:1px solid #bfbfbf">
				<option id="stitle">제목</option>
				<option id="swriter">작성자</option>
				<option id="scontent">내용</option>
			</select> 
			
			<input type="search" id="key" name="key" style="border:0; outline:0; border-bottom:1px solid #bfbfbf" placeholder="검색어를 입력하세요.">
			<input type="hidden" name="page" value="1">
			<button type="submit" class="search-icon" style="border:0; outline:0; background-color:rgba(255,255,255,0)"><i class="fas fa-search"></i></button>
		</form>
	</div>
	<br>



<!-- 글 하나 리스트 -->

<%
	}
	if(listOne!=null) {
%>
		<div style="width:800px; margin : 0 auto">
		<div style="margin-top:50px; border-bottom:1px;">
			<h1><%=listOne.getTitle() %></h1>
			<div style="color:#a3a3a3">[<%= listOne.getHeader() %>]&nbsp;&nbsp;&nbsp;| &nbsp;&nbsp;
			<%= listOne.getWritedate() %>&nbsp;&nbsp;&nbsp;| &nbsp;&nbsp;<%=listOne.getNickname() %></div>
		</div>
		<hr>
		
		<div>
			<input style="color:#a3a3a3; border:0; outline:0; background-color:rgba(255,255,255,0);" onclick="history.back(-1);" type="reset" value="돌아가기">
			<c:if test="${sessionScope.nickname==listOne.nickname
						or sessionScope.nickname=='admin'}">|
			<button style="color:#a3a3a3; border:0; outline:0; background-color:rgba(255,255,255,0);" onclick="updateboard('<%=listOne.getId()%>')">수정</button> |
			<input style="color:#a3a3a3; border:0; outline:0; background-color:rgba(255,255,255,0);" onclick="deleteboard('<%=listOne.getId()%>')" type="reset" value="삭제">
			</c:if>
		</div><br>

		<div style="width: 100%; height:500px;">
		<% 
		if(listOne.getSrc()!=null){
		%>
		<img src="/doku/resources/img/<%= listOne.getSrc() %>" style="width:200px; height:200px;">
		<%} %>
		<br><br>
		<pre style="width:100%; height: 100%; border:0; font-size:20px; font-family:'Roboto Slab';"><%=listOne.getContent() %></pre>
		</div>
		<div style="height:100px;"></div>
		
		
<!-- 댓글 -->

		<div style="border-top:1px solid; border-color:#bfbfbf; margin :5px;">
		<br>
		<h5>댓글</h5>	
		<hr>
<%
	ArrayList<CommentsVO> comlist = (ArrayList<CommentsVO>)request.getAttribute("comlist");
	if(comlist.size() != 0){
%>
<%
	for(CommentsVO cvo : comlist){
%>
		
		<div>
			<div>
				<%= cvo.getNickname() %>&nbsp;|&nbsp; <%= cvo.getWritedate() %>
		
			
				<%
					if((String)session.getAttribute("nickname")!=null){
						if (((String) session.getAttribute("nickname")).equals(cvo.getNickname())
									|| ((String) session.getAttribute("nickname")).equals("admin")) {
						%>
				<button style="border:0; outline:0; background-color: rgba(255, 255, 255, 0); color:#adadad" onclick="deletecom('<%= cvo.getCnum() %>','<%= cvo.getId() %>')">삭제</button>
						<%
							}
					}
				%>	
			</div>
				<pre style="font-size:15px; font-family:'Roboto Slab';"><%= cvo.getContent() %></pre>
			
		</div>
		<hr>
<%
		}
%>
<%
	}
%>
		<form method="post" action="/doku/insertcom" style="border-top:1px;">
			<input type="hidden" name="action" value="insert">
			<input id="nickname" name="nickname" type="hidden" value="${sessionScope.nickname}"><br>
			<input id="id" name="id" type="hidden" value='<%=listOne.getId()%>'>
			<textarea id="content" name="content" rows="2" cols="50" style="width:100%; outline: 0; border:0;" placeholder="댓글을 입력해주세요."></textarea>
			<input style="float: right; width:20%; border:0; outline:0; background-color: #f29f94; color: white;  padding:10px;" type="submit" name="submit" value="등록"><br><br><br>
		</form>
</div>

		

<% 
	}
	if(request.getAttribute("msg") != null) {
%>
<script>
	alert('${msg}');
</script>
<%
	}
%>

</div>
</div>
</article>



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
<script>
function fn_paging(cv){
   location.href = '/doku/boardmain?page='+cv;
}
function displayReadForm(cv){
	location.href='/doku/boardread?id='+cv;
}
function deleteboard(cv){
	location.href='/doku/boarddelete?id='+cv;
}
function updateboard(cv){
	location.href='/doku/boardupdatemain?id='+cv;
}
function deletecom(cv1,cv2){
	location.href = '/doku/deletecom?cnum='+cv1+'&id='+cv2;
}
function updatecom(cv){
	document.getElementById("content"+cv).style.display='none';
	document.getElementById("updatecom"+cv).style.display='block';
}
function cancel(cv){
	document.getElementById("content"+cv).style.display='block';
	document.getElementById("updatecom"+cv).style.display='none';
}
</script>

</body>

</html>
