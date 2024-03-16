<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/css/style.css" />" />
<link rel="stylesheet" type="text/css"
	href="<c:url value="/css/bootstrap.min.css" />" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">

<link href="<c:url value="/lib/lightbox/css/lightbox.min.css" />"
	rel="stylesheet">



</head>
<body>
	<!-- Navbar Start -->
	<jsp:include page="../common/navi.jsp" flush="true">
		<jsp:param name="navi" value="네비호출" />
	</jsp:include>
	<!-- Navbar End -->
	<!-- registration Start -->
	<div id="memberContainer" class="container img-rounded">
		<div class="text-center mx-auto wow fadeInUp" data-wow-delay="0.1s"
			style="max-width: 500px;">
			<p class="text-center px-3" style="color: #454678; font-size: 25px;">회원가입</p>
		</div>
		<div class="row">
			<form name="memberForm">
				<div class="col-lg-4" style="margin: 0 auto; height: 500px;">
					<fieldset style="margin-top: 30px;">
						<ul style="width: 500px;">
							<li><label for="uid">아이디</label> <input
								class="mb-3 memberInput" type="text" id="userId" autofocus
								placeholder="공백없이 4자 ~ 10자 사이" required size="26" name="userId">
							</li>
							<li><label for="email">이메일</label> <input
								class="mb-3 memberInput" type="email" id="email" required
								size="26" placeholder="이메일 입력" name="email"></li>
							<li><label for="pwd1">비밀번호</label> <input
								class="mb-3 memberInput" type="password" id="userPw"
								placeholder="문자와 숫자, 특수 기호 !@# 포함,최소 6글자" required size="24"
								name="userPw"></li>
							<li><label for="pwd2">비밀번호 <br>확인
							</label> <input class="mb-3 memberInput" type="password" id="userPw2"
								required name="userPw2"></li>
							<li><label for="name">이름</label> <input
								class="mb-3 memberInput" type="text" id="name" required
								name="name"></li>
							<li><label for="phone">휴대폰 번호</label> <input
								class="mb-3 memberInput" type="text" id="phone" required
								name="phone"></li>
						</ul>
					</fieldset>
					<div id="buttons" style="width: 500px;">
						<input class="btn btn-success mt-2 mb-3" type="button"
							value="가입하기" onclick="checkMember()"
							style="background-color: #1c3664;"> <input
							class="btn btn-success mt-2 mb-3" type="reset" value="리셋"
							style="background-color: #1c3664">
					</div>
				</div>
			</form>
		</div>
	</div>
	<!-- registration End -->


	<!-- Footer Start -->
	<jsp:include page="../common/footer.jsp" flush="true">
		<jsp:param name="footer" value="푸터호출" />
	</jsp:include>
	<!-- Footer End -->

	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="<c:url value="/lib/lightbox/js/lightbox.min.js" />"></script>

	<script src="<c:url value="/js/registration.js" />"></script>

</body>

</html>