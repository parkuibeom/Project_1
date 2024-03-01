<%@ page import="java.util.ArrayList" %>
    <%@ page import="com.dlt.senior.survey.*" %>

        <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="utf-8" />
                <title>DLT - 삶의 만족도 설문조사</title>

                <!-- Icon Font Stylesheet -->
                <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
                    rel="stylesheet">
                <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
                    rel="stylesheet">

                <!-- Libraries Stylesheet -->
                <link href="lib/animate/animate.css" rel="stylesheet">
                <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">

                <!-- Customized Bootstrap Stylesheet -->
                <link href="css/bootstrap.min.css" rel="stylesheet">

                <!-- Template Stylesheet -->
                <link rel="stylesheet" href="css/survey.css">
                <link rel="stylesheet" href="css/button.css">
                <!-- Template Stylesheet -->
                <link href="css/style.css" rel="stylesheet">
                
                <!-- 스크립트 코드 지우고 옮기기 -->
                <script>
                    var totHth = ${ totHth };
                    var totEco = ${ totEco };
                    var totRel = ${ totRel };
                    var data = {
                        labels: ['건강', '경제', '사회적 관계'],
                        datasets: [{
                            label: '나의 삶의 만족도 평균',
                            data: [totHth, totEco, totRel],
                            backgroundColor: ['red', 'orange', 'yellow'],
                        }]
                    };
                    var ctx = document.getElementById('myChart').getContext('2d');
                    var myChart = new Chart(ctx, {
                        type: 'bar',
                        data: data,
                        options: {}
                    });

                    var totHth2 = 85;
                    var totEco2 = 85;
                    var totRel2 = 85;
                    var data = {
                        labels: ['건강', '경제', '사회적 관계'],
                        datasets: [{
                            label: '나와 같은 연령대 삶의 만족도 평균',
                            data: [totHth2, totEco2, totRel2],
                            backgroundColor: ['red', 'orange', 'yellow'],
                        }]
                    };
                    var ctx = document.getElementById('yourChart').getContext('2d');
                    var myChart = new Chart(ctx, {
                        type: 'bar',
                        data: data,
                        options: {}
                    });

                    var charts = document.querySelectorAll('#myChart, #yourChart');

                    charts.forEach(function (chart) {
                        chart.style.maxWidth = '600px';
                        chart.style.height = '400px';
                        chart.style.margin = 'auto';
                        chart.style.border = '2px solid #ccc';
                        chart.style.boxShadow = '0 4px 8px rgba (0,0,0,0.1)';
                        chart.style.backgroundColor = '#f9f9f9';
                    });

                    var hthSati;
                    var ecoSati;
                    var soscialSati;

                </script>

            </head>



            <body>
                <!-- Navbar Start -->
                <jsp:include page="common/navi.jsp" flush="true">
                    <jsp:param name="navi" value="네비호출" />
                </jsp:include>
                <!-- Navbar End -->


                <div id="contain">
                    <div class="jumbotron text-center">
                        <h1>"당신의 삶의 만족도는 어떠신가요?"</h1>
                        <div class="textBox">
                            <p>이 설문 조사는 노년층의 삶의 질을 이해하고 향상 시키기 위해 마련 되었습니다.
                            </p>
                        </div>
                    </div>
                    <!-- google survey start -->
                    <div id="section2">
                        <div class="survey">
                            <div class="main wow fadeInUp">
                                <h1>삶의 만족도를 확인 해 보세요</h1>
                            </div>

							<!-- 해당 폼 부분 자바스크립트에서 비동기로 데이터 받아오기 -->
                            <div class="form wow fadeInUp" data-wow-delay="0.3s">
                                <form class="surveyform" action="surveyInsertScore.do" method="post" encType="UTF-8"
                                    name="surveyform" id="surveyform">

                                    <table class="commontable">

                                        <!-- 공통 질문 테이블 시작 -->
                                        <tr class="questionTitle">
                                            <th colspan="2">
                                                <h2><b>공통질문</b></h2>
                                            </th>
                                        </tr>

                                        <tr>
                                            <td class="question">1. 귀하의 성별을 선택 해주세요. </td>

                                            <td class="answer">
                                                <label><input type="radio" name="com1" value="F"> 여자</label>&nbsp;&nbsp;
                                                <label><input type="radio" name="com1" value="M"> 남자</label>
                                            </td>
                                        </tr>


                                        <tr>
                                            <td class="question">2. 귀하의 연령대가 어떻게 되십니까? </td>

                                            <td class="answer">
                                                <label><input type="radio" name="com2" value="1">
                                                    65~69세</label>&nbsp;&nbsp;
                                                <label><input type="radio" name="com2" value="2">
                                                    70~74세</label>&nbsp;&nbsp;
                                                <label><input type="radio" name="com2" value="3">
                                                    75~79세</label>&nbsp;&nbsp;
                                                <label><input type="radio" name="com2" value="4">
                                                    80~84세</label>&nbsp;&nbsp;
                                                <label><input type="radio" name="com2" value="5"> 85세 이상</label>
                                            </td>
                                        </tr>


                                        <tr>
                                            <td class="question">3. 귀하의 전반적인 삶의 만족도는 어떠십니까?</td>

                                            <td class="answer">
                                                <label><input type="radio" name="com3" value="5"> 매우
                                                    만족</label>&nbsp;&nbsp;
                                                <label><input type="radio" name="com3" value="4"> 만족</label>&nbsp;&nbsp;
                                                <label><input type="radio" name="com3" value="3"> 보통</label>&nbsp;&nbsp;
                                                <label><input type="radio" name="com3" value="2">
                                                    불만족</label>&nbsp;&nbsp;
                                                <label><input type="radio" name="com3" value="1"> 매우 불만족</label>
                                            </td>
                                        </tr>
                                    </table>
                                    <!-- 공통 질문 테이블 끝. -->


                                    <!-- 건강 만족도 질문 테이블 시작 -->
                                    <table class="healthtable">

                                        <tr class="questionTitle">
                                            <th colspan="2">
                                                <h2><b>건강 상태에 대한 만족도 조사</b></h2>
                                            </th>
                                        </tr>


                                        <tr>
                                            <td class="question">1. 귀하의 건강 상태에 대한 만족도는 어떠십니까?</td>

                                            <td class="answer">
                                                <label><input type="radio" name="hth1" value="5"> 매우
                                                    만족</label>&nbsp;&nbsp;
                                                <label><input type="radio" name="hth1" value="4"> 만족</label>&nbsp;&nbsp;
                                                <label><input type="radio" name="hth1" value="3"> 보통</label>&nbsp;&nbsp;
                                                <label><input type="radio" name="hth1" value="2">
                                                    불만족</label>&nbsp;&nbsp;
                                                <label><input type="radio" name="hth1" value="1"> 매우 불만족</label>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td class="question">2. 귀하께서는 자신의 평소 건강 상태가 어떻다고 생각 하십니까?</td>

                                            <td class="answer">
                                                <label><input type="radio" name="hth2" value="5"> 매우
                                                    건강</label>&nbsp;&nbsp;
                                                <label><input type="radio" name="hth2" value="4"> 건강</label>&nbsp;&nbsp;
                                                <label><input type="radio" name="hth2" value="3"> 보통</label>&nbsp;&nbsp;
                                                <label><input type="radio" name="hth2" value="2"> 나쁨</label>&nbsp;&nbsp;
                                                <label><input type="radio" name="hth2" value="1"> 매우 나쁨</label>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td class="question">3. 일주일에 며칠 운동을 하십니까?</td>

                                            <td class="answer">
                                                <label><input type="radio" name="hth3" value="5"> 매일</label>&nbsp;&nbsp;
                                                <label><input type="radio" name="hth3" value="4">
                                                    3~5회</label>&nbsp;&nbsp;
                                                <label><input type="radio" name="hth3" value="3">
                                                    1~2회</label>&nbsp;&nbsp;
                                                <label><input type="radio" name="hth3" value="2">
                                                    안한다</label>&nbsp;&nbsp;
                                                <label><input type="radio" name="hth3" value="1"> 못한다 (건강상의 이유)</label>
                                            </td>
                                        </tr>
                                    </table>
                                    <!-- 건강 만족도 질문 테이블 끝 -->

                                    <!-- 경제적 만족도 질문 테이블 시작 -->
                                    <table class="economicstable">

                                        <tr class="questionTitle">
                                            <th colspan="2">
                                                <h2><b>경제 상황에 대한 만족도 조사</b></h2>
                                            </th>
                                        </tr>


                                        <tr>
                                            <td class="question">1. 현재의 소득 수준에 대해 어떻게 생각 하십니까?</td>

                                            <td class="answer">
                                                <label><input type="radio" name="eco1" value="5"> 매우
                                                    만족</label>&nbsp;&nbsp;
                                                <label><input type="radio" name="eco1" value="4"> 만족</label>&nbsp;&nbsp;
                                                <label><input type="radio" name="eco1" value="3"> 보통</label>&nbsp;&nbsp;
                                                <label><input type="radio" name="eco1" value="2">
                                                    불만족</label>&nbsp;&nbsp;
                                                <label><input type="radio" name="eco1" value="1"> 매우 불만족</label>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td class="question">2. 주거 환경에 대한 만족도는 어떠십니까?</td>
                                            <td class="answer">
                                                <label><input type="radio" name="eco2" value="5"> 매우
                                                    만족</label>&nbsp;&nbsp;
                                                <label><input type="radio" name="eco2" value="4"> 만족</label>&nbsp;&nbsp;
                                                <label><input type="radio" name="eco2" value="3"> 보통</label>&nbsp;&nbsp;
                                                <label><input type="radio" name="eco2" value="2">
                                                    불만족</label>&nbsp;&nbsp;
                                                <label><input type="radio" name="eco2" value="1"> 매우 불만족</label>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td class="question">3. 여가 및 문화 생활을 위한 경제적 여유에 대해 어떻게 생각 하십니까?</td>

                                            <td class="answer">
                                                <label><input type="radio" name="eco3" value="5"> 매우
                                                    만족</label>&nbsp;&nbsp;
                                                <label><input type="radio" name="eco3" value="4"> 만족</label>&nbsp;&nbsp;
                                                <label><input type="radio" name="eco3" value="3"> 보통</label>&nbsp;&nbsp;
                                                <label><input type="radio" name="eco3" value="2">
                                                    불만족</label>&nbsp;&nbsp;
                                                <label><input type="radio" name="eco3" value="1"> 매우 불만족</label>
                                            </td>
                                        </tr>
                                    </table>
                                    <!-- 경제적 만족도 질문 테이블 끝 -->

                                    <!-- 사회 관계 만족도 질문 테이블 시작-->
                                    <table class="relationshiptable">

                                        <tr class="questionTitle">
                                            <th colspan="2">
                                                <h2><b>사회적 관계에 대한 만족도 조사</b></h2>
                                            </th>
                                        </tr>


                                        <tr>
                                            <td class="question">1. 가족과의 관계에 대한 만족도는 어떠십니까?</td>

                                            <td class="answer">
                                                <label><input type="radio" name="rel1" value="5"> 매우
                                                    만족</label>&nbsp;&nbsp;
                                                <label><input type="radio" name="rel1" value="4"> 만족</label>&nbsp;&nbsp;
                                                <label><input type="radio" name="rel1" value="3"> 보통</label>&nbsp;&nbsp;
                                                <label><input type="radio" name="rel1" value="2">
                                                    불만족</label>&nbsp;&nbsp;
                                                <label><input type="radio" name="rel1" value="1"> 매우 불만족</label>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td class="question">2. 친구 및 이웃과의 관계에 대해 어떻게 생각 하십니까?</td>

                                            <td class="answer">
                                                <label><input type="radio" name="rel2" value="5"> 매우
                                                    만족</label>&nbsp;&nbsp;
                                                <label><input type="radio" name="rel2" value="4"> 만족</label>&nbsp;&nbsp;
                                                <label><input type="radio" name="rel2" value="3"> 보통</label>&nbsp;&nbsp;
                                                <label><input type="radio" name="rel2" value="2">
                                                    불만족</label>&nbsp;&nbsp;
                                                <label><input type="radio" name="rel2" value="1"> 매우 불만족</label>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td class="question">3. 가족이나 친구로부터의 정서적 지원에 대한 만족도는 어떠십니까?</td>
                                            <td class="answer">
                                                <label><input type="radio" name="rel3" value="5"> 매우
                                                    만족</label>&nbsp;&nbsp;
                                                <label><input type="radio" name="rel3" value="4"> 만족</label>&nbsp;&nbsp;
                                                <label><input type="radio" name="rel3" value="3"> 보통</label>&nbsp;&nbsp;
                                                <label><input type="radio" name="rel3" value="2">
                                                    불만족</label>&nbsp;&nbsp;
                                                <label><input type="radio" name="rel3" value="1"> 매우 불만족</label>
                                            </td>
                                        </tr>
                                    </table><br><br>
                                    <!-- 사회 관계 만족도 질문 테이블 끝 -->

                                    <!-- 아래 클릭 이벤트가 통신이 끝나고 난 다음에 해야될거 같음. -->
                                    <button type="submit" class="policyBtn" value="제출"
                                        onclick="fnMove2('#section3')">제출</button><br><br><br>
                                </form>
                            </div>
                        </div>
                    </div><br>
                </div>
                <!-- google survey end -->

                <!-- google survey result start -->
                <form action="surveyGraph.do" method="post">
                    <input type="hidden" value="${surveyDto.getAge()}" name="age">
                    <div id="section3">
                        <div class="satisfactionBOX">
                            <br><br>
                            <P>당신의 <b>삶의 만족도</b>는 [<span id="score0">${totScore}</span>]점 입니다. </P><br><br>


                            <p class="score_box">건강 상태 만족도<br> <span id="score1">${totHth}</span>점</p>
                            <p class="score_box">경제적 만족도 <br> <span id="score2">${totEco}</span>점</p>
                            <p class="score_box">사회적 관계 만족도<br> <span id="score3">${totRel}</span>점</p><br><br><br>

                            <p id="text_box">
                                당신은
                                <span id="text1"><span id="avg1">____</span></span>만족도가 평균보다 높고,
                                <span id="text2"><span id="avg2">____</span></span>만족도가 평균보다 낮습니다.
                            </p><br><br>


                            <p>▼아래 평균 그래프 보기 버튼을 눌러서 평균 만족도를 확인해 보세요.▼</p>
                            <button class="policyBtn" type="submit" onclick="fnMove3('#section4')">평균 그래프
                                보기</button><br><br><br>
                        </div>
                    </div><br><br><br>


                </form>
                <!-- google survey result end -->
                    <!-- graph start -->
                    <div id="section4">
                        <div class="graph">
                            <div class="chartContainer">
                                <canvas id="myChart"></canvas>
                                <canvas id="yourChart"></canvas><br><br><br>
                            </div>
                            <p id="graph_box">
                                당신과 비슷한 연령대, 동일한 성별의 평균 <br><br>
                                <span id="graph_text1">________________</span>만족도가 높고,
                                <span id="graph_text2">________________</span>만족도가 낮습니다.
                            </p><br><br>

                            <p>▼아래 추천 정책 보기 버튼을 눌러서 당신에게 필요한 정책을 확인해 보세요.▼</p>
                            <button class="policyBtn" onclick="location.href='policyJob.do?region_id=1';">정책
                                보기</button><br><br><br>
                        </div>
                    </div>
                    <!-- graph end -->




                <!-- Footer Start -->
                <jsp:include page="common/footer.jsp" flush="true">
                    <jsp:param name="footer" value="푸터호출" />
                </jsp:include>
                <!-- Footer End -->

                <!-- JavaScript Libraries -->
                <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                <!-- Chart.js-->
                <script src="lib/wow/wow.min.js"></script>
                <script src="js/survey.js"></script>
                



            </body>

            </html>