<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인 실패</title>
</head>
<body>
    <script>
        var loginTry = <%= session.getAttribute("login_try") %>;
        alert("아이디와 비밀번호를 잘못 입력하셨습니다. 다시 입력해주세요. \n 로그인 시도 횟수 : " + loginTry);
        window.location.href = "/dlt/member/login";
    </script>
</body>
</html>
