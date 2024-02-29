<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ page import="com.dlt.senior.userMgmt.*" %>

		<% int loginTry=(int) session.getAttribute("login_try"); %>
			<!DOCTYPE html>
			<html>

			<head>
				<meta charset="UTF-8">
				<title>로그인 실패</title>
				<script>
					alert("아이디와 비밀번호를 잘못 입력하셨습니다. 다시 입력해주세요. \n 로그인 시도 횟수 : <%=loginTry%>");
					window.location.href = "login.jsp";
				</script>
			</head>

			<body>

			</body>

			</html>