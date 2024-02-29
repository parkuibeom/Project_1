<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="utf-8">
        <title>DLT_회원가입</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link
            href="https://fonts.googleapis.com/css2?family=Libre+Baskerville:wght@700&family=Open+Sans:wght@400;500;600&display=swap"
            rel="stylesheet">

        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
    </head>

    <body>
            <!-- Navbar Start -->
            <jsp:include page="common/navi.jsp" flush="true">
                <jsp:param name="navi" value="네비호출" />
            </jsp:include>
            <!-- Navbar End -->
        <!-- registration Start -->
        <div id="memberContainer" class="container img-rounded">
            <div class="text-center mx-auto wow fadeInUp" data-wow-delay="0.1s" style="max-width: 500px;">
                <p class="text-center px-3" style="color : #454678; font-size : 25px;">회원가입</p>
            </div>
            <div class="row">
                <form name="memberForm">
                    <div class="col-lg-4" style="margin: 0 auto; height: 500px;">
                        <fieldset style="margin-top: 30px;">
                            <ul style="width : 500px;">
                                <li>
                                    <label for="uid">아이디</label>
                                    <input class="mb-3 memberInput" type="text" id="user_id" autofocus
                                        placeholder="공백없이 4자 ~ 10자 사이" required size="26" name="id">
                                </li>
                                <li>
                                    <label for="email">이메일</label>
                                    <input class="mb-3 memberInput" type="email" id="user_email" required size="26"
                                        placeholder="이메일 입력" name="email">
                                </li>
                                <li>
                                    <label for="pwd1">비밀번호</label>
                                    <input class="mb-3 memberInput" type="password" id="user_pw"
                                        placeholder="문자와 숫자, 특수 기호 !@# 포함,최소 6글자" required size="24" name="pw">
                                </li>
                                <li>
                                    <label for="pwd2">비밀번호 <br>확인</label>
                                    <input class="mb-3 memberInput" type="password" id="user_pw2" required name="pw2">
                                </li>
                                <li>
                                    <label for="name">이름</label>
                                    <input class="mb-3 memberInput" type="text" id="user_name" required name="name">
                                </li>
                                <li>
                                    <label for="phone">휴대폰 번호</label>
                                    <input class="mb-3 memberInput" type="text" id="user_phone" required name="phone">
                                </li>
                            </ul>
                        </fieldset>
                        <div id="buttons" style = "width : 500px;">
                            <input class="btn btn-success mt-2 mb-3" type="button" value="가입하기" onclick="checkMember()"
                            style = "background-color: #1c3664;">
                            <input class="btn btn-success mt-2 mb-3" type="reset" value="리셋"
                            style = "background-color: #1c3664" >
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <!-- registration End -->


        <!-- Footer Start -->
        <jsp:include page="common/footer.jsp" flush="true">
            <jsp:param name="footer" value="푸터호출" />
        </jsp:include>
        <!-- Footer End -->

        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="lib/lightbox/js/lightbox.min.js"></script>
        <script src="js/registration.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
    </body>

    </html>