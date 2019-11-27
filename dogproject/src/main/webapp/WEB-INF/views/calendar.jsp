<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang='ko'>
  <head>
    <meta charset='utf-8' />
   
   <!-- 달력 위한 css -->
	<link rel="stylesheet" href="resources/css/calendar.css">
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/fullcalendar/2.9.1/fullcalendar.min.css" />  
	<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/fullcalendar/2.9.1/fullcalendar.print.css" media="print" /> 

	<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="resources/js/jquery.min.js"></script>
	<script type="text/javascript" src="resources/js/moment.min.js"></script>
	<script type="text/javascript" src="resources/js/fullcalendar.js"></script>
	<script type="text/javascript" src="resources/js/bpopup.min.js"></script> 
	<script type="text/javascript" src="resources/js/bootstrap-datetimepicker.min.js"></script> 
	<script src='resources/js/ko.js'></script>
  
  
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

<!-- Custom styles for this template -->
<link href="resources/css/calendar.css" rel="stylesheet">
  
	<title>일정 관리</title>
  </head>
  <body id = "page-top">
  
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

  <!-- 달력 -->
  <div class="calendar-main" style="align-content:center; width:700px; height:auto; margin:0 auto; ">
	<div >
		<button class="plus" onclick="javascript:addSchedule()"style="float:right; width:50px; height:50px; border-color: transparent !important;
   				   outline:none; border: none;"><i class="fas fa-plus" ></i></button>
	</div>	
	
    <div id='calendar'style="width:700px; height: auto; text-align: center; margin: 0 auto;"></div>

	<div class="box box-success" style="width:500px; display:none; backgroud-color:white !important" id="winAlert">
		<div class="box-header with-border" style="backgroud-color:white; padding-left:15px">
			<h3 class="box-title" id="alert_subject" style="backgroud-color:white !important"></h3>
		</div>
		<div class="box-body" id="alert_contents" style="font-size:15px; background-color:white">
		</div>
	</div>
	

	<c:if test="${sessionScope.nickname!=null}">
		<script>
		 
	    $(document).ready(function ()  
	    		{  
	    		    $('#calendar').fullCalendar({  
	    		        header:  
	    		        {  
	    		            left: 'prev,next today',  
	    		            center: 'title',  
	    		            right: 'month,agendaWeek,agendaDay'  
	    		        },  
	    		        buttonText: {  
	    		            today: 'today',  
	    		            month: 'month',  
	    		            week: 'week',  
	    		            day: 'day'  
	    		        },  
	    		  		
	    		        events: function (start, end, timezone, callback)  
	    		        {  
	    		            $.ajax({  
	    		                url: 'http://'+location.host+'/doku/listAll.html',  
	    		                type: "GET",  
	    		                dataType: "JSON",  
	    		  
	    		                success: function (result)  
	    		                {  
	    		                    var events = [];  
	    		  
	    		                    $.each(result, function (i, data)  
	    		                    {  
	    		                        events.push(  
	    		                       { 
	    		                    	    id:data.id,
	    		                    	   	title: data.title,  
	    		                            start: moment(data.startDate).format('YYYY-MM-DD'),  
	    		                            end: moment(data.endDate).format('YYYY-MM-DD'),  
	    		                            backgroundColor: "#d1c3db",  
	    		                            borderColor: "#f0cccc"   
	    		                       });  
	    		                    });  
	    		  
	    		                    callback(events);  
	    		                }  
	    		            });  
	    		        },  
	    		        
	    		        editable: true,
	    		        selectable:true,
	    		        eventClick:function(info){
	  							
	    		        	  var result = confirm(info.title+'를 삭제하시겠습니까?');
	    		        	    if(result){
	    		        	    	location.href="/doku/calendar?action=delete&id="+info.id;
	    		        	    	$('#calendar').fullCalendar('removeEvents',info.id);
	    		        			
	    		        			alert("삭제되었습니다.");
	    		        	    }
	    		        }
	    		    });  
	    		});  

      function addSchedule() {
  		var ctn = "";
  		ctn += "<form method='post' action ='calendar?action=insert'>";
  		ctn += "<input id= 'nickname' type='hidden' value= '${sessionScope.nickname}'>";
  		ctn += "<div style= 'width:100%; height:30px'><div style='width:30%;float:left;padding-left:30px'>일정</div><div style='width:60%;float:right'><input type='text' name='title' placeholder='일정 제목'></div></div>";
  		ctn += "<div style= 'width:100%; height:30px'><div style='width:30%;float:left;padding-left:30px'>시작</div><div style='width:60%;float:right'><input type='text' name='startDate' placeholder='년/월/일'></div></div>";
  		ctn += "<div style= 'width:100%; height:30px'><div style='width:30%;float:left;padding-left:30px'>끝</div><div style='width:60%;float:right'><input type='text' name='endDate' placeholder='년/월/일'></div></div>";
  		ctn += "<div style= 'width:100%; text-align:center; height:30px; margin-bottom:15px;margin-top:10px'><input type='submit' value='저장'></div>";
  		ctn += "</form>";
  		openPopup("일정 추가", ctn, 500);
  	}

  	function openPopup(subject, contents, widths) {
  		$('#alert_subject').html(subject);
  		$('#alert_contents').html(contents);
  		openMessage('winAlert', widths)
  	}

  	function openMessage(ids, widths) {
  		$('#' + ids).css("width", widths + "px");
  		$('#' + ids).bPopup();
  	}

  	function closeMessage(ids, widths) {
  		$('#' + ids).bPopup().close();
  	}
  	
  	
    </script>
</c:if>
 </div>
 
 <div style="height:20px;"> </div>
<!-- Footer -->
	<footer class="footer">
		<div class="container">
			<span class="copyright">Copyright &copy; Doku 2019</span>
		</div>
	</footer>


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



</body>

</html>