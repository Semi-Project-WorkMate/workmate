<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<style>
a {
	color: black !important;
	text-decoration: none !important;
}
</style>
<meta charset="UTF-8">
<title>Todolist</title>
<link href="${contextPath}/css/list-groups.css" rel="stylesheet">
<link href="${contextPath}/css/todolist.css" rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Lato'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" />
<link rel="stylesheet"
	href="https://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css">
<script src="/resources/static/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script>
<script src="https://kit.fontawesome.com/da4f69d06d.js"
	crossorigin="anonymous"></script>


<script type="text/javascript">
		
		$(document).ready(function(){
			// get방식 전송 파라미터 숨기기
			history.replaceState({}, null, location.pathname);
			
			// 마지막 투두리스트 수정or추가한 날짜파라미터를 받음
			if(${addtodo} == false){
				let date = new Date();
				var DateStr = DateToString(date);
			}
			else{
				var DateStr = '${addtodo}';
				
			}
			
			setWriteDate(DateStr);
			doList("${member.getId()}", DateStr);
		});
		
		// 세션에 파라미터로 전달할 날짜 변수 초기화
		function setWriteDate(writeDate){
			sessionStorage.setItem("writeDate", writeDate);
		}
		function getWriteDate(){
			var writeDate = sessionStorage.getItem("writeDate");
			return writeDate;
		}
		
		
		// date month, day에 1의자리는 '0'을 덧붙이고 스트링으로 변환 
		function DateToString(date) {
			let year = date.getFullYear();
			let month = leftPad(date.getMonth()+1);
			let day = leftPad(date.getDate());
			var setDate = year+"-"+month+"-"+day;
			
			return setDate;
			
			
			function leftPad(value){
				if (value >= 10) {
		        	return value;
		    	}
		   		return "0"+value;
			}
		}
		
		//이전 리스트 clear후, DB에서 받아온 리스트 중 필요한 리스트만 필터링
		function doList(memberId, doDate){
			while(document.getElementById("list") != null){
				const rmvBefore = document.getElementById("list");
				rmvBefore.remove();
			}
			
			if(${articlesList != null}){
				var artList = new Array();
				
				<c:forEach items="${articlesList}" var="item">
					artList.push({
						no	  	: "${item.getArticleNO()}",
						id    	: "${item.getId()}",
						title 	: "${item.getTitle()}",
						date  	: "${item.getWriteDate()}"
						});
				</c:forEach>
				
				for(var i=artList.length-1;i>=0;i--){
					if (artList[i].id == memberId && artList[i].date == doDate){
						printDoList(artList[i].no, artList[i].title);
					}
				}
				
			}
		}
	
		//db에서 받아온 할일 태크 추가, 수정/삭제 이벤트 함수 (지혜님이 구현하신 기능) 
		function printDoList(no,val){
			let update = '<button class="update-btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">'
                +'<path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"/>'
                +'</svg></button>';
  			let del = '<button class="del"><svg  xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3" viewBox="0 0 16 16">'
            	+'<path d="M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5ZM11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H2.506a.58.58 0 0 0-.01 0H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1h-.995a.59.59 0 0 0-.01 0H11Zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5h9.916Zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47ZM8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5Z"/>'
            	+'</svg></button>';
  			let todo = '<label id="list" class="list-group-item d-flex gap-3">'
		      +'<input id="test" class="form-check-input flex-shrink-0" type="checkbox" value="" unchecked style="font-size: 1.375em;">'
		      +'<span class="pt-1 form-checked-content">'
		      +'<input id="'+no+'" class="updateInput" value="'+val+'" disabled></input>'
		      +'</span>'+update + del
		      +'</label>';
		        
			$('#appended').append(todo);
	  }
		//할일 삭제 버튼 클릭 이벤트
		$(document).on("click", '.del', function(){
			let parent = $(this).parent();
			let input = $(this).prev().prev().children();
			
			parent.fadeOut(function(){
				parent.remove();
				
				$.post('${contextPath}/board/removeToDo.do', {
                	articleNo 		: input[0].id,
                	}
				).done(function(){
					window.location.replace('${contextPath}/board/todolist.do?addtodo='+getWriteDate());
					alert("삭제완료");
				});
			});
		});
		
		//할일 수정 버튼 클릭 이벤트
		$(document).on("click", '.update-btn', function(){
			const input = $(this).prev().children();
			var len = input.val().length;
			
			input.attr("disabled", false);
			input.focus();
			input[0].setSelectionRange(len, len);
	              
			input.on("keyup", function(e){
				if(e.keyCode == 13 && input.val() != ""){
					input.attr("disabled", true);
					
					$.post('${contextPath}/board/modToDo.do', {
	                	articleNo 		: input[0].id,
	                	articleTitle 	: input.val(),
	                	}
					).done(function(){
						window.location.replace('${contextPath}/board/todolist.do?addtodo='+getWriteDate());
						alert("수정완료");
					});
					
                }
			});
			
		});
		  
	</script>

	<script>
		// 캘린더 생성
		document.addEventListener('DOMContentLoaded', function() {
			var calendarEl = document.getElementById('calendar');
			var calendar = new FullCalendar.Calendar(calendarEl, {
				initialView : 'dayGridMonth',
				locale: 'ko',
				selectable: true,
				
				//클릭한 날짜의 할일 출력 이벤트
				dateClick: function(info) {
					setWriteDate(info.dateStr);
					doList("${member.getId()}", info.dateStr);
				}
				
			});
			calendar.render();
		});
		
		
		
	</script>

	<script>
		// post형식으로 새로운 할일을 전달하는 form 함수
		function addToDo(value) {
			var postList = [ ["title",value], ["writeDate", getWriteDate()], ["id", '${member.getId()}'] ];
		    let form = document.createElement('form');
		    form.setAttribute('method', 'post');
		    form.setAttribute('action', '${contextPath}/board/addToDo.do');
		    document.charset = "utf-8";
		    
		    for (var idx=0;idx<postList.length;idx++){
		    	let setPost = document.createElement('input');
			    setPost.setAttribute('type', 'hidden');
			    setPost.setAttribute('name', postList[idx][0]);
			    setPost.setAttribute('value', postList[idx][1]);
			    form.appendChild(setPost);
		    }
		    
		    
		    document.body.appendChild(form);
		    form.submit();
		}
		
		
		
		$(document).ready(function() {
	        $('.todoInput').on("keyup", function(e){
	          let update = '<button class="update-btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">'
	                        +'<path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"/>'
	                        +'</svg></button>';
	          let del = '<button class="del"><svg  xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3" viewBox="0 0 16 16">'
	                    +'<path d="M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5ZM11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H2.506a.58.58 0 0 0-.01 0H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1h-.995a.59.59 0 0 0-.01 0H11Zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5h9.916Zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47ZM8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5Z"/>'
	                    +'</svg></button>';
	          let todo = '<label class="list-group-item d-flex gap-3">'
	              +'<input id="test" class="form-check-input flex-shrink-0" type="checkbox" value="" unchecked style="font-size: 1.375em;">'
	              +'<span class="pt-1 form-checked-content">'
	              +'<input class="updateInput" value="'+$('.todoInput').val()+'" disabled></input>'
	              +'</span>'+update + del
	              +'</label>';
	          let value = $(".todoInput").val();

	          if(e.keyCode == 13 && $(".todoInput").val() != ""){
	            $('#appended').append(todo);
	            $(".todoInput").val("");
	            $(".todoInput").blur();
	            
	            addToDo(value);
	          }
	        })
	    });
		
		
	</script>

</head>
<script type="text/javascript">
	window.onload = function() {
		if(${ isLogOn!=true && member==null }){
			alert("로그인이 필요합니다.");
			document.location.href = "${contextPath}/member/memberForm.do";
		}
	}
</script>

<body>
	<div class="container-fluid">
		<div class="row">
			<nav id="sidebarMenu"
				class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
				<div class="position-sticky pt-3 sidebar-sticky">
					<ul class="nav flex-column">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="${contextPath}/board/todolist.do">
								<span data-feather="home" class="align-text-bottom"></span> <i
								class="bi bi-calendar-date-fill me-2" style="color: #ff4f5a"></i>
								<span class="logo-font fs-5 fw-semibold"> Todo list</span>
						</a></li>
						<c:forEach var="memberfriend" items="${membersList}">
							<c:if test="${member.id != memberfriend.id }">
								<li class="nav-item"><a class="nav-link"
									href="${contextPath}/board/todolistFriend.do"> <i
										class="bi bi-person-circle me-2 translate-middle"
										style="color: #ff4f5a"></i> <span
										class="logo-font fs-5 fw-semibold">
											${memberfriend.name}</span>
								</a></li>
							</c:if>
						</c:forEach>
					</ul>
			</nav>

			<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
				<div class="pb-4 mb-1 p-4">
					<h3>Todo List</h3>
					<div id="current_date">
						<script>
							var today = new Date();
							var year = today.getFullYear();
							var month = today.getMonth() + 1;
							var day = today.getDate();
							document.write("<h5>" + year + "년 " + month + "월 "
									+ day + "일</h5>");
						</script>


					</div>
				</div>

				<div class="row g-5 p-4">
					<div class="col-md-8 mt-3 pt-5">
						<div id="calendar"></div>
					</div>

					<div class="col-md-4 mt-3">
						<div class="position-static" style="top: 2rem;">
							<div class="p-4 mb-3 bg-light rounded">
								<h4 class="logo-font fw-semibold" style="display: inline;">Todo
									List</h4>
								<div id="appended" class="list-group w-auto mt-4 mb-3 logo-font-black">
									<label class="list-group-item d-flex gap-3"> <span
										class="pt-1 form-checked-content">
											<div id="inputbox">
												<input type="text" class="todoInput logo-font-kr" placeholder="할 일 추가하기" style="color:black">
											</div>
									</span>
									</label>
								</div>
							</div>
							<div class="p-4 mb-3 bg-light rounded">
								<h4 class="logo-font-kr fw-semibold" style="display: inline;">댓글</h4>
								<div class="list-group w-auto mt-4 mb-3">
									<c:forEach var="memberfriend" items="${membersList}" varStatus="memberNum">
										<c:if test="${member.id != memberfriend.id && memberfriend.id ne 'test3'}">
											<a href="#"
												class="list-group-item list-group-item-action d-flex gap-3 py-3"
												aria-current="true">
												<div class="d-flex gap-2 w-100 justify-content-between">
													<div>
														<span class="logo-font-kr fw-semibold" style="color:black">
															${memberfriend.name}</span>
														<p class="mb-0 opacity-85">test ${memberNum.count-1}</p>
													</div>
													<small class="opacity-50 text-nowrap">now</small>
												</div>
											</a>
										</c:if>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
				</div>
			</main>
			<div class="container">
		<footer class="py-3 my-4">
			<ul class="nav justify-content-center border-bottom pb-3 mb-3">
				<li class="nav-item"><a href="${contextPath}/main.do"
					class="nav-link px-2 text-muted"
					style="scroll-snap-type: y mandatory;">Home</a></li>
				<li class="nav-item"><a href="#"
					class="nav-link px-2 text-muted">Features</a></li>
				<li class="nav-item"><a href="#"
					class="nav-link px-2 text-muted">FAQs</a></li>
				<li class="nav-item"><a href="#"
					class="nav-link px-2 text-muted">About</a></li>
			</ul>
			<p class="text-center text-muted">&copy; Copyright 2023. All rights reserved.</p>
		</footer>
	</div>
</body>
</html>