<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>${area}질병정보 페이지</title>

<!-- 부트스트랩 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">


<!-- 부트스트랩 아이콘 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">



<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Nanum+Myeongjo:wght@800&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="lib/animate/animate.css">
</head>

<body>
	<div class="container" id="wrap">
		<div class="row">


			<div class="ms-sm-auto col-md-12 col-lg-10 px-md-4 mb-5"
				id="card-main">
				<div class="card">
					<div
						class="d-flex justify-content-between flex-wrap flex-md-nowrap pt-3 pb-2 mb-3 border-bottom">
						<h1 class="h2 mx-3 p-3 wow fadeIn" id="chart-title">${area}
							질병 정보</h1>
					</div>


					<!-- 반응형 수정  -->
					<canvas class="my-4 mx-2 wow fadeIn" data-wow-delay="0.1s"
						id="myChart"></canvas>


					<!-- 카드 -->
					<div class="row" id="card-option">
						<div class="col-12 col-lg-4 mb-2" id="box">
							<div class="card m-2">
								<div class="card-body">
									<div
										class="text-xs font-weight-bold text-uppercase mb-1 heading">
										<h4 class="card-title wow fadeIn">연도</h4>
									</div>
									<select class="form-select form-select-lg mb-3 wow fadeIn"
										id="year-select-start" onchange="addYearOption(),chartSet()">
										<option value="2009" selected>2009</option>
										<option value="2010">2010</option>
										<option value="2011">2011</option>
										<option value="2012">2012</option>
										<option value="2013">2013</option>
										<option value="2014">2014</option>
										<option value="2015">2015</option>
										<option value="2016">2016</option>
										<option value="2017">2017</option>
										<option value="2018">2018</option>
										<option value="2019">2019</option>
										<option value="2020">2020</option>
										<option value="2021">2021</option>
									</select> <span class="wow fadeIn">~</span> <select
										class="form-select form-select-lg mb-3 wow fadeIn"
										id="year-select-end" onchange="chartSet()">
										<option value="0">선택해주세요</option>
										<option value="2010">2010</option>
										<option value="2011">2011</option>
										<option value="2012">2012</option>
										<option value="2013">2013</option>
										<option value="2014">2014</option>
										<option value="2015">2015</option>
										<option value="2016">2016</option>
										<option value="2017">2017</option>
										<option value="2018">2018</option>
										<option value="2019">2019</option>
										<option value="2020">2020</option>
										<option value="2021" selected>2021</option>
									</select>
								</div>
							</div>
						</div>
						<div class="col-6 col-lg-4 mb-2" id="box">
							<div class="card m-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="row no-gutters align-items-center">

											<div
												class="text-xs font-weight-bold text-uppercase mb-1 heading">
												<h4 class="card-title wow fadeIn">${area}</h4>
												<select class="form-select form-select-lg mb-3 wow fadeIn"
													id="seoul-select">
													<c:forEach var="dto" items="${list}">
														<c:choose>
															<c:when
																test="${dto.district_Name eq '해남군' or dto.district_Name eq '강남구'}">
																<option value="${dto.district_Id}" selected="selected">${dto.district_Name}
																</option>
															</c:when>
															<c:otherwise>
																<option value="${dto.district_Id}">
																	${dto.district_Name}</option>
															</c:otherwise>
														</c:choose>
													</c:forEach>
												</select>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-6 col-lg-4 mb-2" id="box">
							<div class="card m-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center wow fadeIn"
										data-wow-delay="0.3s">
										<div
											class="text-xs font-weight-bold text-uppercase mb-1 heading">
											<h4 class="card-title">4대 질병</h4>
										</div>
										<!-- <input type="checkbox" class="btn-check" id="hyper" autocomplete="on">
                  <label class="btn btn-outline-danger w-50" for="hyper">고지혈증</label> -->
										<button type="button" class="btn btn-outline-danger"
											id="hyper">고지혈증</button>

										<button type="button" class="btn btn-outline-success"
											id="dementia">치매</button>

										<button type="button" class="btn btn-outline-secondary"
											id="diabetes">당뇨병</button>

										<button type="button" class="btn btn-outline-info" id="hbp">고혈압</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="container">
						<div class="row">
							<div id="data-card" style="width: 100%;">
								<div class="card-body wow fadeIn" data-wow-delay="0.5s">
									<div class="row no-gutters align-items-center">
										<div>
											<h4>4대 질병이란?</h4>
											<button id="infoBoxbtm" onclick="toggleInfo()">차트 단위 확인하기</button>
										</div>
										<div id="infoBox" class = "mt-3">
											<p>해당 차트에서 사용된 단위는 %단위로 전 국민 중 의료 서비스를 이용하여 해당 질병이 있다고 판정받은 사람의 비율입니다.<br>
												(계산식 : 질병 판정 인원/전체 인구 x 100, 출처 : 국민건강보험공단)
											</p>
											<!-- 추가적인 설명을 여기에 추가할 수 있습니다. -->
										</div>
									</div>
									<div class="col-auto mt-3">
										<p>
											<strong>고지혈증</strong> : 혈중의 지질(콜레스테롤 및 중성지방) 수치가 정상 수치를 초과할 때
											발생하며, 동맥경화 및 심혈관 질환의 위험을 증가시킬 수 있습니다.
										</p>
										<p>
											<strong>치매</strong> : 퇴행성 뇌질환 또는 뇌 혈관계 질환 등에 의해 기억력, 언어능력,
											판단력 및 수행 능력등의 인지기능 저하를 일으켜 일상생활에 지장을 초래하는 후천적인 다발성 장애를 말합니다.
										</p>
										<p>
											<strong>당뇨</strong> : 혈액 속의 포도당 수치가 정상인보다 높은 상태를 말하며, 인슐린의
											분비량이 부족하거나 정상적인 기능이 이루어지지 않는 질환입니다.
										</p>
										<p>
											<strong>고혈압</strong> : 혈관에 과도한 압력이 가해짐으로써 발생하며, 이는 심장 질환, 뇌졸중
											및 기타 심혈관 질환의 원인이 될 수 있습니다.
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<a class="btn sticky-bottom btn-secondary rounded-circle" href="#"
		role="button" id="top-button" style="color: white"><i
		class="fa-solid fa-up-long"></i></a>
	</div>
	<!-- chart.js -->
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<!-- font-awesome -->
	<script src="https://kit.fontawesome.com/f006d59106.js"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>

	<!-- script 파일 복붙시 수정 -->
	<script src="js/statisticsService.js"></script>
	<script src="./lib/wow/wow.min.js"></script>
</body>

</html>