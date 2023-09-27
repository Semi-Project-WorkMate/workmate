<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
request.setCharacterEncoding("UTF-8");
%>

<head>
<meta charset="UTF-8">
<style>
a {
	color: black !important;
	text-decoration: none !important;
}
</style>
<title>Todolist</title>
<link href="/resources/static/css/list-groups.css" rel="stylesheet">
<link href="/resources/static/css/todolist.css" rel="stylesheet">
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

<script>
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			initialView : 'dayGridMonth',
			locale: 'ko',
			selectable: true,
		});
		calendar.render();
	});
</script>
<script>
      $(document).ready(function() {
        $('.todoInput').on("keyup", function(e){
          let del = '<button id="del"><svg  xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3" viewBox="0 0 16 16">'
                    +'<path d="M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5ZM11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H2.506a.58.58 0 0 0-.01 0H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1h-.995a.59.59 0 0 0-.01 0H11Zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5h9.916Zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47ZM8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5Z"/>'
                    +'</svg></button>';
          let todo = '<label class="list-group-item d-flex gap-3">'
              +'<input class="form-check-input flex-shrink-0" type="checkbox" value="" unchecked style="font-size: 1.375em;">'
              +'<span class="pt-1 form-checked-content">'
              +'<strong>'+$('.todoInput').val()+'</strong>'
              +'</span>'+del
              +'</label>';

          if(e.keyCode == 13 && $(".todoInput").val() != ""){
            $('#appended').append(todo);
            $(".todoInput").val("");
            $(".todoInput").blur();
          }
        })
    });
  </script>

<script type="text/javascript">
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#preview').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
	function backToList(obj) {
		obj.action = "${contextPath}/board/todolist.do";
		obj.submit();
	}

	var cnt = 1;
	function fn_addFile() {
		$("#d_file")
				.append("<br>" + "<input type='file' name='file"+cnt+"' />");
		cnt++;
	}
</script>
<script type="text/javascript">
	window.onload = function() {
		if(${ isLogOn!=true && member==null }){
			alert("로그인이 필요합니다.");
			document.location.href = "${contextPath}/member/memberForm.do";
		}
	}
</script>


</head>
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
									href="${contextPath}/board/todolistFriend.do"> <span
										data-feather="file" class="align-text-bottom"></span> <i
										class="bi bi-person-circle me-2" style="color: #ff4f5a"></i> <span
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
									list</h4>
								<div class="list-group w-auto mt-4 mb-3">

									<c:forEach
											var="article" items="${articlesList}">
											<c:if test="${member.id != article.id }">
											<div>
											<label class="list-group-item d-flex gap-3">
												<input class="form-check-input flex-shrink-0"
													type="checkbox" value="" checked
													style="font-size: 1.375em;" checked disabled>
												<span
													class="pt-1 form-checked-content logo-font-black fw-semibold">
													${article.title}</span>
													</label>
													</div>
											</c:if>
										</c:forEach>
								</div>
							</div>
							<div class="p-4 mb-3 bg-light rounded">
								<h4 class="logo-font-kr fw-semibold" style="display: inline;">댓글</h4>
								<div class="list-group w-auto mt-4 mb-3">
									<c:forEach var="memberfriend" items="${membersList}" varStatus="memberNum">
										<c:if test="${memberfriend.id ne 'gildong' && memberfriend.id ne 'test3'}">
											<a href="#"
												class="list-group-item list-group-item-action d-flex gap-3 py-3"
												aria-current="true">
												<div class="d-flex gap-2 w-100 justify-content-between">
													<div>
														<span class="logo-font-kr fw-semibold" style="color:black">
															${memberfriend.name}</span>
															<c:choose>
															<c:when test="${memberNum.last}">
															<p class="mb-0 opacity-85">test ${memberNum.count-2}</p>
															</c:when>
															<c:otherwise>
															<p class="mb-0 opacity-85">test ${memberNum.count-1}</p>
															</c:otherwise>
															</c:choose>
														
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

</div>

</div>
</body>
</html>
