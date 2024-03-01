<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="utf-8">
        <title>DLT_로그인</title>
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

        <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
        <script src="js/login.js"></script>
    </head>

    <body>
        <!-- Navbar Start -->
        <jsp:include page="common/navi.jsp" flush="true">
            <jsp:param name="navi" value="네비호출" />
        </jsp:include>
        <!-- Navbar End -->


        <!-- Login Start -->
        <div id="loginContainer" class="container">
            <div class="text-center mx-auto" style="margin-top: 200px;">
                <p class="text-center px-3" style="color : #454678; font-size: 25px;">로그인</p>
            </div>
            <div class="row mt-5" id="login_body">
                <div class="col-lg-4 mt-5" style="height:400px; margin: 0 auto;" id="login_form">
                    <form action="login.do" method="post" name="loginForm" style="height: 300px;"
                        onsubmit="return loginCheck()">
                        <div class="form-group has-success has-feedback">
                            <label class="control-label" for="inputGroupSuccess4">아이디</label>
                            <div class="input-group">
                                <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-user"></span>
                                </span>
                                <input type="text" class="form-control" name="user_id"
                                    style="height: 50px; border-radius: 20px; border: solid 2px #1c3664; "
                                    aria-describedby="inputGroupSuccess4Status" placeholder="Login id를 입력해주세요">
                            </div>
                            <span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
                            <span id="inputGroupSuccess4Status" class="sr-only">아이디를 넣어주세요</span>
                        </div>
                        <div class="form-group has-error has-feedback" style="margin-top: 30px; ">
                            <label class="control-label" for="inputGroupSuccess4">비밀번호</label>
                            <div class="input-group">
                                <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-lock"></span>
                                </span>
                                <input type="password" class="form-control" name="user_pw"
                                    style="height: 50px; border-radius: 20px; border: solid 2px #1c3664;"
                                    aria-describedby="inputGroupSuccess4Status" placeholder="비밀번호를 입력해주세요">
                            </div>

                        </div>
						<div id="memberBox">
                            <input type="submit" class="btn btn-success " value="확인"
                                style="background-color: #1c3664;"></input>
                            <a class="btn" href="registration.jsp"
                                style="background-color: #1c3664; color: white;">회원가입</a>
                        </div>
                    </form>
                </div>
                <!-- <div class="col-lg-4"style="height: 400px; width:400px">
                <img src="mainImg/intro2.jpg" alt="">
            </div> -->
            </div>
        </div>
        <!-- Login End -->


        <!-- footer -->
        <jsp:include page="common/footer.jsp" flush="true">
            <jsp:param name="footer" value="푸터호출" />
        </jsp:include>


        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="lib/lightbox/js/lightbox.min.js"></script>

    </body>

    </html>