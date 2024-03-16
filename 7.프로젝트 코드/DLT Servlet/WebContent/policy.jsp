<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <title>DLT - 정책 제공</title>

    <link rel="stylesheet" href="css/policy.css">

    <meta content="width=device-width, initial-scale=1.0" name="viewport" />

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" />
</head>
<body>

    <!-- Navbar Start -->
        <jsp:include page="common/navi.jsp" flush="true">
            <jsp:param name="navi" value="네비호출" />
        </jsp:include>
    <!-- Navbar End -->

    <div id="contain">
        <div class="jumbotron text-center">
            <h1>"우리동네 어르신을 위한 맞춤 복지 서비스"</h1>
            <p>어르신의 삶을 빛내는 맞춤형 복지와 정보를 한눈에 제공합니다.</p>
        </div>

        <!-- service -->

        <div id="sectionService" class="container">
            <h2 class="service mt-5">우리는 이런 정책을 제공합니다.</h2>
            <hr style="border: 1px solid #000;" width="390px">

            <div id="intro-container-policy" class="container wow fadeInUp">
                <div id="intro-one-policy" class="imgBox wow fadeInUp" data-wow-delay="0.3s">
                    <div id="intro-one-img-policy">
                        <img src="img/seoulImg.png" alt="" class="intro-img mt-5">
                    </div>
                    <div id="one-text-policy">
                        <div class="text1-policy">서울 정책 보기</div>
                        <button type="button" class="btn btns btn-outline-light" style="background-color: gray;"><a
                                href="policyJob.do?region_id=1" style="color : white;">자세히 알아보기</a></button>
                    </div>
                </div>


                <div id="intro-two-policy" class="imgBox wow fadeInUp" data-wow-delay="0.3s">
                    <div id="intro-two-img-policy">
                        <img src="img/JeonnamImg.png" alt="" class="intro-img mt-4">
                    </div>
                    <div id="two-text">
                        <div class="text2-policy">전남 정책 보기</div>
                        <button type="button" class="btn btns btn-outline-light" style="background-color: gray;"><a
                                href="policyJob.do?region_id=2" style="color : white;">자세히 알아보기</a></button>
                    </div>
                </div>
            </div>
        </div>
    </div>




    <div class="container services">
        <h2 class="service">우리는 이런 정책을 제공합니다.</h2>
        <hr style="border: 1px solid #000;" width="390px">

        <div class="row">
            <div class="col-md-6">
                <div class="service-item">
                    <img src="img/1.png" alt="이미지1">
                    <div>
                        <h2 class="service-title">어르신 일자리</h2>
                        <p>노년의 경험과 역량을 존중하며 사회 참여 촉진, 자립성 강화를 통한 <br>더 나은 노후를 위한 지원</p>
                    </div>
                </div>
                <div class="service-item">
                    <img src="img/2.png" alt="이미지2">
                    <div>
                        <h2 class="service-title">생활 안정 지원</h2>
                        <p>편안하고 풍요로운 노후를 위한 지원</p>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="service-item">
                    <img src="img/3.png" alt="이미지3">
                    <div>
                        <h2 class="service-title">여가 복지 지원</h2>
                        <p>사회적 참여, 문화 활동 등을 통해 활기차고 안락한 노년기를 위한 지원</p>
                    </div>
                </div>
                <div class="service-item">
                    <img src="img/4.png" alt="이미지4">
                    <div>
                        <h2 class="service-title">어르신 건강 증진</h2>
                        <p>어르신 삶에 활력을 불어넣어 활동적이고 건강한 노후를 지원</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer Start -->
        <jsp:include page="common/footer.jsp" flush="true">
            <jsp:param name="footer" value="푸터호출" />
        </jsp:include>
    <!-- Footer End -->

    <!-- JavaScript Libraries -->

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/lightbox/js/lightbox.min.js"></script>

    <!-- Template Javascript -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="js/policyMap.js" defer></script>
</body>
</html>