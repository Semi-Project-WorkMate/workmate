<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<head>
<link href="/resources/static/css/style.css" rel="stylesheet">
<link href="/resources/static/css/heroes.css" rel="stylesheet">
<link href="/resources/static/css/features.css" rel="stylesheet">
<link href="/resources/static/css/headers.css" rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link href="/resources/static/js/bootstrap.min.css" rel="stylesheet">
</head>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<body>
	<c:choose>
		<c:when test="${isLogOn == true  && member!= null}">
			<nav class="navbar navbar-expand-lg bg-light"
				style="background-color: #ff4f5a !important">
				<div class="container-fluid">
					<a class="navbar-brand" href="${contextPath}/main.do">
					<i class="bi-journal-text" style="color: white"></i>
					<p class="logo-font" style="color: white">Work Mate</p>
					</a>
					<div class="d-grid gap-2 d-md-flex justify-content-md-end">
						<div
							class="d-grid gap-2 d-md-flex justify-content-md-end align-items-center">
							<h5 class="logo-font-kr pt-1" style="color: white">${member.name }</h5>
							<div class="flex-shrink-0 dropdown">
								<a href="#"
									class="d-block link-dark text-decoration-none dropdown-toggle"
									data-bs-toggle="dropdown" aria-expanded="false"> <i
									class="bi bi-person-circle fs-2" style="color: white"></i>
								</a>
								<ul class="dropdown-menu text-small shadow"
									style="position: absolute; inset: 20px 0px auto auto; margin: 0px; transform: translate(0px, 34px);"
									data-popper-placement="bottem-end">
									<li><a class="dropdown-item logo-font-black" href="${contextPath}/member/listMembers.do">
											<i class="bi bi-person-circle"></i> Profile
									</a></li>
									<li><a class="dropdown-item logo-font-black" href="${contextPath}/member/listMembers.do">
											<i class="bi bi-sliders"></i> Settings
									</a></li>
									<hr>
									<li><a class="dropdown-item logo-font"
										style="color: #ff4f5a !important" href="${contextPath}/member/logout.do">
											<i class="bi bi-box-arrow-right"></i> Sign out
									</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</nav>
		</c:when>
		<c:otherwise>
			<nav class="navbar navbar-expand-lg bg-light">
				<div class="container-fluid">
					<a class="navbar-brand" href="${contextPath}/main.do"> <i
						class="bi-journal-text" style="color: #ff4f5a"></i>
						<p class="logo-font">Work Mate</p>
					</a>
					<div class="d-grid gap-2 d-md-flex justify-content-md-end">
						<a href="${contextPath}/member/loginForm.do"
							class="logo-font nav-link me-md-2" style="color: #ff4f5a !important"
							role="button">Sign in</a> <a
							href="${contextPath}/member/memberForm.do"
							class="logo-font nav-link" role="button">Sign up</a>
					</div>
				</div>
			</nav>
		</c:otherwise>
	</c:choose>
	</div>
	</div>
	</div>
	</nav>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
	<script src="/resources/static/js/bootstrap.bundle.min.js"></script>
</body>