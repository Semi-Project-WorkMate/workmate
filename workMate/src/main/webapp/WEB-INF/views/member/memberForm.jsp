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
<meta charset="UTF-8">
<title>Sign up to Work Mate</title>
<link href="/resources/static/css/modals.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="/resources/static/css/style.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="canonical"
	href="https://getbootstrap.com/docs/5.2/examples/modals/">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
</head>
<body>
	<div
		class="modal modal-signin position-static d-block bg-secondary py-5"
		tabindex="-1" role="dialog" id="modalSignin">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header p-5 pb-4 border-bottom-0">
					<a class="navbar-brand" href="${contextPath}/main.do"> <i
						class="bi-journal-text" style="color: #ff4f5a"></i>
						<p class="logo-font">Work Mate</p>
					</a>
				</div>
				<div>
					<h2 class="modal-body fw-bold p-5 pt-0 logo-font"
						style="color: black">Sign up</h2>
				</div>
				<div class="modal-body p-5 pt-3">
					<form method="post" action="${contextPath}/member/addMember.do">
						<div class="form-floating mb-3">
							<input type="text" name="id" class="form-control rounded-3"
								id="floatingInput" placeholder="Id"> <label
								for="floatingInput">Id</label>
						</div>
						<div class="form-floating mb-3">
							<input type="password" name="pwd" class="form-control rounded-3"
								id="floatingPassword" placeholder="Password"> <label
								for="floatingPassword">Password</label>
						</div>
						<div class="form-floating mb-3">
							<input type="text" name="name" class="form-control rounded-3"
								id="floatingInput" placeholder="Name"> <label
								for="floatingInput">Name</label>
						</div>
						<div class="form-floating mb-3">
							<input type="text" name="email" class="form-control rounded-3"
								id="floatingInput" placeholder="name@example.com"> <label
								for="floatingPassword">Email address</label>
						</div>
						<button class="w-100 mb-2 btn btn-lg rounded-3 btn-primary"
							type="submit">Sign up</button>
						<hr class="my-4">
						<h2 class="fs-5 fw-bold mb-3">Or use a third-party</h2>
						<button class="w-100 py-2 mb-2 btn btn-outline-dark rounded-3"
							type="submit">
							<i class="bi bi-google" width="16" height="16"> <a
								href="#"></a> Sign up with Google
							</i>
						</button>
						<button class="w-100 py-2 mb-2 btn btn-outline-dark rounded-3"
							type="submit">
							<i class="bi bi-github" width="16" height="16"> <a
								href="#"></a> Sign up with GitHub
							</i>
						</button>
					</form>
					<hr class="my-4">
					<div class="text-center">
						<p class="logo-font-black">
							Already have an account? <a class="text-decoration-none"
								style="color: #ff4f5a" href="${contextPath}/member/loginForm.do">Sign in</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="/docs/5.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>

</body>