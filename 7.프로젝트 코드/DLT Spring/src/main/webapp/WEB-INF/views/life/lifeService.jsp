<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="utf-8">
            <title>DLT_기대 수명 예측 페이지</title>
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
  			<link href="css/bootstrap.min.css" rel="stylesheet">
  			<link href="css/style.css" rel="stylesheet">
  			<link href="css/lib/animate/animate.css" rel="stylesheet">
			 

            <!-- math formula -->
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/katex@0.16.9/dist/katex.min.css"
                integrity="sha384-n8MVd4RsNIU0tAv4ct0nTaAbDJwPJzDEaqSD1odI+WdtXRGWt2kTvGFasHpSy3SV"
                crossorigin="anonymous">
        </head>

        <body>
            <!-- Navbar Start -->
            <jsp:include page="../common/navi.jsp" flush="true">
                <jsp:param name="navi" value="네비호출" />
            </jsp:include>
            <!-- Navbar End -->

            <div class="jumbotron text-center">
                <h1>"지역별 기대수명 예측 데이터 제공 서비스"</h1>
                <p>기대수명 예측 데이터 정보를 한눈에 제공합니다.</p>
            </div>

            <!-- Chart Start-->
            <div class="container py-5" style="margin-top: 50px;">
                <div class="card mb-5 wow fadeInUp" id="lifeServiceForm">
                    <div class="card-header" style="color : #454678;">
                        개인 기대 수명 정보 제공
                    </div>

                    <form id="personalForm">
                        <div class="card-body">
                            <p class="card-text">설문 조사를 통해 개인별 기대 수명 정보를 확인하세요! </p>
                            <div class="row align-items-center">
                                <div id="ageForm" class="col-sm-3">
                                    <div class="mb-3">
                                        <label for="exampleFormControlInput1" class="form-label">나이 : </label>
                                        <input type="number" class="form-control" id="age" min="50" max="84"
                                            style="width : 40%;" name="personal_age">
                                    </div>
                                </div>
                                <div id="ageContainer" class="row col-sm-8">
                                    <div id="inputLife"></div>
                                </div>
                            </div>
                            <div>
                                <label for="basic-url" class="form-label">성별 : </label>
                                <div class="form-check form-check-inline" id="gender">
                                    <input class="form-check-input" type="radio" name="genderCheck" id="genderMale"
                                        value="1">
                                    <label class="form-check-label" for="genderMale">
                                        남자
                                    </label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="genderCheck" id="genderFemale"
                                        value="2">
                                    <label class="form-check-label" for="genderFemale">
                                        여자
                                    </label>
                                </div>
                            </div>


                            <div>
                                <label for="basic-url" class="form-label">흡연자이신가요? : </label>
                                <div class="form-check form-check-inline">

                                    <input class="form-check-input" type="radio" name="smokeCheck" id="smokeCheck"
                                        value="1">
                                    <label class="form-check-label" for="smokeCheck">
                                        예
                                    </label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="smokeCheck" id="smokeNoCheck"
                                        value="0">
                                    <label class="form-check-label" for="smokeNoCheck">
                                        아니오
                                    </label>
                                </div>
                            </div>

                            <div>
                                <label for="basic-url" class="form-label">일주일에 2번 이상 음주를 하시나요? : </label>
                                <div class="form-check form-check-inline">

                                    <input class="form-check-input" type="radio" name="drinkingCheck" id="drinkingCheck"
                                        value="1">
                                    <label class="form-check-label" for="drinkingCheck">
                                        예
                                    </label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="drinkingCheck"
                                        id="drinkingNoCheck" value="0">
                                    <label class="form-check-label" for="drinkingNoCheck">
                                        아니오
                                    </label>
                                </div>
                            </div>


                            <div>
                                <label for="basic-url" class="form-label"> 현재 고혈압이신가요? </label>
                                <div class="form-check form-check-inline">

                                    <input class="form-check-input" type="radio" name="hbpCheck" id="hbp" value="1">
                                    <!-- id랑 for랑 맞춰야한다. -->
                                    <label class="form-check-label" for="hbp">
                                        예
                                    </label>
                                </div>

                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="hbpCheck" id="hbpNo" value="0">
                                    <label class="form-check-label" for="hbpNo">
                                        아니오
                                    </label>
                                </div>
                            </div>

                            <div>
                                <label for="basic-url" class="form-label"> 현재 당뇨를 앓고 계신가요? </label>
                                <div class="form-check form-check-inline">

                                    <input class="form-check-input" type="radio" name="diabetesCheck" id="diabetes"
                                        value="1">
                                    <!-- id랑 for랑 맞춰야한다. -->
                                    <label class="form-check-label" for="diabetes">
                                        예
                                    </label>
                                </div>

                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="diabetesCheck" id="diabetesNo"
                                        value="0">
                                    <label class="form-check-label" for="diabetesNo">
                                        아니오
                                    </label>
                                </div>
                            </div>
                            <button class="btn btn-primary" type="submit">작성 완료</button>
                        </div>
                    </form>
                </div>

                <div class="container">
                    <div class="wow fadeInUp mt-5 card row" id="chartCard">
                        <div class="card-header" style="color : #454678;">
                            미래 기대 수명 차트
                        </div>
                        <div class="card-body">
                            <div id="pastChartContainer">
                                <canvas id="serviceChart"></canvas>
                            </div>
                            <div class="row">
                                <div class="selectBox col-sm-3 mt-5">
                                    <div class="text-xs font-weight-bold text-uppercase mb-1 heading">
                                        <h4>지역</h4>
                                    </div>
                                    <select class="form-select mb-3" id="selectedRegionFirst" onchange="getChartData()">
                                        <option value="서울특별시" selected>서울특별시 </option>
                                        <option value="부산광역시">부산광역시</option>
                                        <option value="대구광역시">대구광역시</option>
                                        <option value="인천광역시">인천광역시</option>
                                        <option value="광주광역시">광주광역시</option>
                                        <option value="대전광역시">대전광역시</option>
                                        <option value="울산광역시">울산광역시</option>
                                        <option value="세종특별자치시">세종특별자치시 </option>
                                        <option value="경기도">경기도 </option>
                                        <option value="강원도">강원도 </option>
                                        <option value="충청북도">충청북도</option>
                                        <option value="충청남도">충청남도</option>
                                        <option value="전라북도">전라북도</option>
                                        <option value="전라남도">전라남도</option>
                                        <option value="경상북도">경상북도</option>
                                        <option value="경상남도">경상남도</option>
                                        <option value="제주특별자치도">제주특별자치도</option>
                                    </select>

                                    <select class="form-select mb-3" id="selectedRegionSecond"
                                        onchange="getChartData()">
                                        <option value="서울특별시">서울특별시 </option>
                                        <option value="부산광역시">부산광역시</option>
                                        <option value="대구광역시">대구광역시</option>
                                        <option value="인천광역시">인천광역시</option>
                                        <option value="광주광역시">광주광역시</option>
                                        <option value="대전광역시">대전광역시</option>
                                        <option value="울산광역시">울산광역시</option>
                                        <option value="세종특별자치시">세종특별자치시 </option>
                                        <option value="경기도">경기도 </option>
                                        <option value="강원도">강원도 </option>
                                        <option value="충청북도">충청북도</option>
                                        <option value="충청남도">충청남도</option>
                                        <option value="전라북도">전라북도</option>
                                        <option value="전라남도" selected>전라남도</option>
                                        <option value="경상북도">경상북도</option>
                                        <option value="경상남도">경상남도</option>
                                        <option value="제주특별자치도">제주특별자치도</option>
                                    </select>
                                </div>
                                <div class="selectBox col-sm-3 mt-5">
                                    <div class="text-xs font-weight-bold text-uppercase mb-1 heading">
                                        <h4>기준 연도</h4>
                                    </div>
                                    <select class="form-select mb-3" id="year-select-end" onchange="getChartData()">
                                        <option value="" disabled>--선택해주세요--</option>
                                        <option value="2024">2024</option>
                                        <option value="2025">2025</option>
                                        <option value="2026" selected>2026</option>
                                    </select>
                                </div>
                                <div class = "col-sm-6">
                                	<h4>차트에 사용된 회귀식</h4>
                                	<p>지역별 기대 수명 모델 회귀 식 : </p><span id = "katex_formula_region"></span>
                                	<p id = "katex_formula_region_explain"> </p>
                                	<p>해당 회귀식의 독립 변인은 8개 였으나 모델에 큰 영향을 끼치지 못하는 독립 변인들인 스트레스 인지율, 음주율, 당뇨 비율, 사망률 데이터는 삭제되었습니다. </p>
                                	<p>또한 해당 데이터의 기준점인 연도와 지역을 제외한 데이터 중 가장 큰 영향을 끼치는 데이터는 고혈압 유병률이었습니다.</p>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="wow fadeInUp mt-5 card row" id="chartCard">
                        <div class="card-header" style="color : #454678;">
                            과거 수명 차트
                        </div>
                        <div class="card-body">
                            <div id="pastChartContainer">
                                <canvas id="pastChart"></canvas>
                            </div>
                            <div>
                                <div class="text-xs font-weight-bold text-uppercase mb-1 heading">
                                    <h4>지역</h4>
                                </div>
                                <select class="form-select mb-3" id="pastRegion" onchange="getPastChartData()">
                                    <option value="서울특별시" selected>서울특별시 </option>
                                    <option value="부산광역시">부산광역시</option>
                                    <option value="대구광역시">대구광역시</option>
                                    <option value="인천광역시">인천광역시</option>
                                    <option value="광주광역시">광주광역시</option>
                                    <option value="대전광역시">대전광역시</option>
                                    <option value="울산광역시">울산광역시</option>
                                    <option value="세종특별자치시">세종특별자치시 </option>
                                    <option value="경기도">경기도 </option>
                                    <option value="강원도">강원도 </option>
                                    <option value="충청북도">충청북도</option>
                                    <option value="충청남도">충청남도</option>
                                    <option value="전라북도">전라북도</option>
                                    <option value="전라남도">전라남도</option>
                                    <option value="경상북도">경상북도</option>
                                    <option value="경상남도">경상남도</option>
                                    <option value="제주특별자치도">제주특별자치도</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="card row mt-5">
                        <div class="card-header" style="color : #454678;">
                            차트 부가 설명
                        </div>
                        <div class="card-body">
                            <p class="card-text">해당 차트의 미래 기대 수명은 다중 선형 회귀 분석을 사용해서 예측한 값을 사용<br>
                                지역별 기대 수명 예측에 사용된 데이터 : 지역, 기대 수명, GRDP(1인당 지역 총소득), 흡연율, 스트레스 인지율, 음주율, 고혈압율, 당뇨율, 사망률</p>
                            개인별 기대 수명에 사용된 데이터 : 기대 여명(연령별, 성별), 흡연율, 음주율, 만성질환 여부(고혈압, 당뇨) <br>
                            출처 : 통계청, 질병관리청(2022 국민건강통계)
                        </div>
                    </div>
                    <div class="card row mt-5" id="lifeExplainCard">
                        <div class="card-header" style="color : #454678;">
                            개인별 기대 수명 모델 설명
                        </div>
                        <div class="card-body">
                            회귀식 : <span id="textMessage"></span>
                            <p>해당 회귀식은 연령(5세당), 성별 기대여명 데이터를 독립변인들의 연령별, 성별 연평균 데이터를 통해 회귀식을 사용하였습니다.</p>
                            <p>연령대는 5세별 데이터로, 연령은 남성을 1, 여성을 2로 하여 평균적으로 여성의 평균 기대 여명이 높기 때문에 계수가 양수로 나왔습니다.</p>
                            <p>다른 데이터들의 경우 제공받는 경우 이진 데이터로 받았습니다.</p>
                            <p>예를 들어, 비흡연자의 입력값을 0,흡연자의 입력값을 1로 가정하여 예측 값을 계산했습니다. </p>

                        </div>
                    </div>

                </div>
            </div>




            <!-- Chart End-->
            <!-- Service End -->


            <!-- Footer Start -->
            <jsp:include page="../common/footer.jsp" flush="true">
                <jsp:param name="footer" value="푸터호출" />
            </jsp:include>
            <!-- Footer End -->

            <!-- JavaScript Libraries -->
            <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
            

            <!-- math formula -->
            <!-- The loading of KaTeX is deferred to speed up page rendering -->
            <script defer src="https://cdn.jsdelivr.net/npm/katex@0.16.9/dist/katex.min.js"
                integrity="sha384-XjKyOOlGwcjNTAIQHIpgOno0Hl1YQqzUOEleOLALmuqehneUG+vnGctmUb0ZY0l8"
                crossorigin="anonymous"></script>

            <!-- To automatically render math in text elements, include the auto-render extension: -->
            <script defer src="https://cdn.jsdelivr.net/npm/katex@0.16.9/dist/contrib/auto-render.min.js"
                integrity="sha384-+VBxd3r6XgURycqtZ117nYw44OOcIax56Z4dCRWbxyPt0Koah1uHoK0o4+/RRE05"
                crossorigin="anonymous" onload="renderMathInElement(document.body);"></script>

            <!-- Template Javascript -->
            <script src="lib/wow/wow.min.js"></script>
            <script src="js/lifeService.js"></script>
        </body>

        </html>