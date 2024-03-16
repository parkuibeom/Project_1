<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title>DLT_함께 만들어나가는 노인 건강</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Libre+Baskerville:wght@700&family=Open+Sans:wght@400;500;600&display=swap"
	rel="stylesheet">

<!-- Icon Font Stylesheet -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="lib/animate/animate.css" rel="stylesheet">
<link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="css/style.css" rel="stylesheet">
</head>

<body>

	<!-- Navbar Start -->
	<jsp:include page="./common/navi.jsp" flush="true">
		<jsp:param name="navi" value="네비호출" />
	</jsp:include>
	<!-- Navbar End -->

	<!-- Carousel Start -->
	<div class="container-fluid px-0 mb-5">
		<div id="header-carousel" class="carousel slide"
			data-bs-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img class="w-100" src="img/city-1.jpg" alt="Image">
					<div class="carousel-caption">
						<div class="container">
							<div class="row justify-content-start">
								<div class="col-lg-8 text-start">
									<p class="fs-4 text-white wow fadeInUp">질병 정보 한눈에 보기</p>
									<!-- fs-4는 font size 4-->
									<h2 class="display-5 text-white mb-1 animated slideInRight">함께
										하는 오늘, 더 나은 미래를 위해</h2>
									<button type="button" class="btn btn-warning btn-lg mt-1">
										<a href="map.jsp" style="color: black;">서비스 바로가기</a>
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<img class="w-100" src="img/city-2.jpg" alt="Image">
					<div class="carousel-caption">
						<div class="container">
							<div class="row justify-content-end">
								<div class="col-lg-8 text-end">
									<p class="fs-4 text-white wow fadeInUp">기대 수명 측정 해보기</p>
									<h1 class="display-5 text-white animated slideInRight">
										오래도록 행복한 삶을 위한 첫걸음</h1>
									<button type="button" class="btn btn-warning btn-lg mt-1">
										<a href="lifeService.jsp" style="color: black;">서비스 바로가기</a>
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<img class="w-100" src="img/city-3.jpg" alt="Image">
					<div class="carousel-caption">
						<div class="container">
							<div class="row justify-content-end">
								<div class="col-lg-8 text-end">
									<p class="fs-4 text-white">정책 살펴보기</p>
									<!-- fs-4는 font size 4-->
									<h1 class="display-5 text-white animated slideInRight">
										삶의 만족 정책으로 이루어집니다 <br>: 당신의 의견이 중요해요
									</h1>
									<button type="button" class="btn btn-warning btn-lg mt-1">
										<a href="policy.jsp" style="color: black;">서비스 바로가기</a>
									</button>
									<!-- 정책 페이지 추가시 등록 -->
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<button class="carousel-control-prev" type="button"
				data-bs-target="#header-carousel" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#header-carousel" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
	</div>
	<!-- Carousel End -->
	<!-- About Start -->
	<div id="sectionContainer">
		<div class="container mt-5 mb-5">
			<div class="row" id="sectionContainerBox">
				<div class="col-md-6 px-5 section">
					<p class="section-title text-start">소개합니다</p>
					<h1 class="title wow fadeInUp">Desired Of Lifetime</h1>
					<h2 class="title2 mb-4 wow fadeInUp">DLT는 어르신들의 수명을 예측하고 복지
						정책을 제공 받을 수 있도록 도와드리고 있습니다.</h2>
					<!-- <p class="mb-4">아래와 같이 각 자치구별 사회안전지수(생활안전)를
                    한 눈에 볼 수 있도록 정보를 제공하고 있습니다.
                </p> -->
					<img class="img-fluid mb-4 wow fadeInUp" data-wow-delay="0.3s"
						src="img/map-2.jpg" alt="">
				</div>
				<div class="col-md-6 section">
					<p class="section-title text-start">커뮤니티</p>
					<h2 class="title mb-4 wow fadeInUp">어르신들을 위한 정보와 지식을 공유하는 장소,
						정보 게시판입니다!</h2>
					<p class="title2 mb-4 wow fadeInUp">노년기의 건강과 행복을 더 잘 관리할 수 있는
						다양한 정보를 찾을 수 있습니다. 여러분의 경험과 지식을 공유하고, 다른 이들과 소통하며, 노인들을 위한 더 나은
						미래를 고민하는 곳입니다."</p>
					<div class="row wow fadeInUp" data-wow-delay="0.3s">
						<div class="table-responsive">
							<table id="board-table"
								class=" table table-bordered table-condensed table-hover">
								<thead>
									<tr class="success">
										<th>No</th>
										<th>제목</th>
										<th>작성자</th>
										<th>작성일</th>
									</tr>
								</thead>
								<tbody>
									<c:set var="currentPage" value="1" scope="request" />
									<c:forEach var="dto" items="${boardList}" varStatus="status"
										begin="0" end="4">
										<tr>
											<td>${(page - 1) * 10 + status.count}</td>
											<td><a href="./boardView.do?boardId=${dto.getBoardId()}"
												style="text-decoration: none">${dto.getBoardTitle()}</a></td>
											<td>${dto.getUserName()}</td>
											<td>${dto.getBoardDate()}</td>
										</tr>
									</c:forEach>

								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- service -->
	<div id="sectionService">
		<div id="intro-container" class="container wow fadeInUp">
			<div id="intro-one" class="imgBox wow fadeInUp" data-wow-delay="0.3s">
				<div id="intro-one-img">
					<img src="img/main1.png" alt="" class="intro-img">
				</div>
				<div id="one-text">
					<div class="text1">지역별 통계 확인</div>
					<button type="button" class="btn btns btn-outline-light"
						style="background-color: gray;">
						<a href="map.jsp" style="color: white;">자세히 알아보기</a>
					</button>
				</div>
			</div>
			<div id="intro-three" class="imgBox wow fadeInUp"
				data-wow-delay="0.3s">
				<div id="intro-three-img">
					<img src="img/main2.png" alt="" class="intro-img">
				</div>
				<div id="three-text">
					<div class="text3">기대 수명 예측 서비스</div>
					<button type="button" class="btn btns btn-outline-light"
						style="background-color: gray;">
						<a href="lifeService.jsp" style="color: white;">자세히 알아보기</a>
					</button>
				</div>
			</div>

			<div id="intro-two" class="imgBox wow fadeInUp" data-wow-delay="0.3s">
				<div id="intro-two-img">
					<img src="img/main3.png" alt="" class="intro-img">
				</div>
				<div id="two-text">
					<div class="text2">정책 보기</div>
					<button type="button" class="btn btns btn-outline-light"
						style="background-color: gray;">
						<a href="policy.jsp" style="color: white;">자세히 알아보기</a>
					</button>
				</div>
			</div>
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="./common/footer.jsp" flush="true">
		<jsp:param name="footer" value="푸터호출" />
	</jsp:include>


	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="lib/wow/wow.min.js"></script>

</body>

</html>