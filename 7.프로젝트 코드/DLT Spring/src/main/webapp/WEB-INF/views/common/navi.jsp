<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<body>
	<!-- Navbar Start -->
	<nav id="topnav"
		class="navbar navbar-expand-lg bg-white navbar-light px-4 px-lg-5">
		<a href="/dlt" class="navbar-brand d-flex align-items-center"
			id="mainLogoBox"> <img src="/img/logo.png" alt="Logo">

		</a>
		<button type="button" class="navbar-toggler me-0"
			data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarCollapse">
			<div class="navbar-nav ms-auto p-4 p-lg-0">
				<!-- <a href="index.html" class="nav-item nav-link active">Home</a> -->
				<div class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="map.jsp"
						id="navbarDropdownGroup1" role="button" data-bs-toggle="dropdown">
						건강·정책 </a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="map.jsp">질병 정보</a> <a
							class="dropdown-item" href="policy.jsp">정책</a>
					</div>
				</div>

				<div class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="lifeService.jsp"
						id="navbarDropdownGroup1" role="button" data-bs-toggle="dropdown">
						삶의 질 분석 </a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="lifeService.jsp">기대수명 예측</a> <a
							class="dropdown-item" href="survey.jsp">당신의 만족도는?</a>
					</div>
				</div>
				<a href="/dlt/community/list?page=1" class="nav-item nav-link">커뮤니티</a>
				<c:choose>
					<c:when test="${user_id == null}">
						<a href="/dlt/member/login" class="nav-item nav-link">로그인</a>
					</c:when>
					<c:otherwise>
						<a href="/dlt/member/logout" class="nav-item nav-link">로그아웃</a>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</nav>
	<!-- Navbar End -->
</body>
</html>