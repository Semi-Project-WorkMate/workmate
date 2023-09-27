<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"   isELIgnored="false"  %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>


<%
  request.setCharacterEncoding("UTF-8");
%>    

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Work Mate</title>
  <link href="/resources/static/css/style.css" rel="stylesheet">
    <link href="/resources/static/css/heroes.css" rel="stylesheet">
    <link href="/resources/static/css/features.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <link href="/resources/js/bootstrap.min.css" rel="stylesheet">
  <script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<script>
	function fn_articleForm(isLogOn, articleForm, loginForm) {
		if (isLogOn != '' && isLogOn != 'false') {
			location.href = articleForm;
		} else {
			alert("로그인 후 이용 가능합니다.")
			location.href = loginForm + '?action=/board/todolist.do';
		}
	}
</script>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<body>
   <main>            
        <div class="px-4 pt-5 my-5 text-center border-bottom">
          <h2 class="display-5 fw-bold logo-font-kr" style="color:black">Work Mate를 통해 스케줄 관리를 쉽게 해보세요!</h2>
          <hr style="border: white;">
          <div class="col-lg-6 mx-auto">
            <p class="lead mb-4 logo-font-kr" style="color:grey">Todo list로 할 일을 정리하고,<br>친구들과 의견도 나눌 수 있습니다.</p>
            <div class="d-grid gap-2 d-sm-flex justify-content-sm-center mb-5 mt-3">
              <a href="javascript:fn_articleForm('${isLogOn}','${contextPath}/board/todolist.do', 
                                                    '${contextPath}/member/loginForm.do')">
                <button type="button" class="btn btn-lg px-4 me-sm-3" style="background-color: #ff4f5a; color: white;">시작하기</button>
              </a>
            </div>
          </div>
          <div class="container px-5">
            <img src="${contextPath}/resources/static/img/completed_tasks.png" class="mb-4" alt="landingpage image" width="700" loading="lazy">
          </div>
        </div>
        <div class="px-4 pt-5 my-5 text-center border-bottom">
          <h2 class="display-5 fw-bold logo-font-kr" style="color:black">할일을 정리하고, 작성해서, 실천에 옮기세요!</h2>
        <div class="container px-4 py-5" id="featured-4">
          <div class="row g-4 py-5 row-cols-1 row-cols-lg-4" style="color: #ff4f5a">
            <div class="feature col">
              <div
                class="feature-icon d-inline-flex align-items-center justify-content-center landing-icons bg-gradient fs-2 mb-3">
                <i class="bi bi-list-check"></i>
              </div>
              <h3 class="fs-2">Small task</h3>
            </div>
            <div class="feature col">
              <div
                class="feature-icon d-inline-flex align-items-center justify-content-center landing-icons bg-gradient fs-2 mb-3">
                <i class="bi bi-pencil-square"></i>
              </div>
              <h3 class="fs-2">Write it</h3>
            </div>
            <div class="feature col">
              <div
                class="feature-icon d-inline-flex align-items-center justify-content-center landing-icons bg-gradient fs-2 mb-3">
                <i class="bi bi-stopwatch"></i>
              </div>
              <h3 class="fs-2">Do it</h3>
            </div>
            <div class="feature col">
              <div
                class="feature-icon d-inline-flex align-items-center justify-content-center landing-icons bg-gradient fs-2 mb-3">
                <i class="bi bi-arrow-repeat"></i>
              </div>
              <h3 class="fs-2">Repeat</h3>
            </div>
          </div>
        </div>
        </div>
      </main>
</body>
</html>