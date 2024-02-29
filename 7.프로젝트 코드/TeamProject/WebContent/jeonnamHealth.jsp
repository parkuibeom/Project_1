<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<title>전남_어르신 건강 증진</title>
<link rel="stylesheet" href="css/jeonnamHealth.css">
<link rel="stylesheet" href="css/button.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous"></script>
<script src="js/jquery-3.7.1.min.js"></script>
<link href="css/style.css" rel="stylesheet" />
</head>
<body>

	<!-- Navbar Start -->
	<jsp:include page="common/navi.jsp" flush="true">
		<jsp:param name="navi" value="네비호출" />
	</jsp:include>
	<!-- Navbar End -->

	<div id="contain">
		<div class="container">

			<div class="side-menu">
				<div>
					<div class="text2">
						<a href="index.jsp">홈</a> > <a href="policy.jsp">정책</a> > 전남 >어르신
						건강 증진
					</div>
				</div>

				<div class="policyButton">
					<button class="policyBtn" type="button"
						onclick="location.href='policyJob.do?region_id=2';">어르신 일자리</button>
					<button class="policyBtn" type="button"
						onclick="location.href='policyWelfare.do?region_id=2';">여가 복지 지원</button>
					<button class="policyBtn" type="button"
						onclick="location.href='jeonnamLife.jsp';">어르신 건강 증진</button>
					<button id="current" class="policyBtn" type="button"
						onclick="location.href='jeonnamHealth.jsp';">어르신 건강 증진</button>
				</div>
			</div>

			<div class="service-item">
				<img src="img/4.png">
				<div>
					<h2 class="service-title">어르신 건강 증진</h2>
				</div>
			</div>

			<div>
				<div class="e_img_nidlogo">
					<a href="https://www.nid.or.kr/main/main.aspx" target="_blank"><img
						src="img/nid_logo.jpg" alt="중앙치매센터로고"></a>
				</div>

				<ul>
					<li class="e_indent_1"><strong
						style="font-size: 1.3rem; color: coral;">중앙치매센터는</strong></li>
					<li class="e_indent_1">치매관리사업수행기관에 대한 기술지원 및 평가지원, 치매관리 지침 개발
						및 보급, 시행계획의 추진실적 평가지원, 치매연구사업지원, 치매관리사업 관련 교육ㆍ훈련 및 지원 업부, 치매환자
						성년후견제 이용지원 업무의 지원, 치매등록통계사업 지원, 치매정보시스템 구축ㆍ운영의 지원, 치매안심센터 업무지원, 치매
						인식개선 교육 및 홍보, 치매관련 정보의 수집ㆍ분석 및 제공, 치매와 관련된 국내외 협력 업무를 수행합니다.</li>
				</ul>
				<br> <br>
			</div>

			<ul>
				<li class="e_title1"><strong>◎</strong> 서울시 및 전라남도 치매광역센터 바로가기
				</li>
			</ul>

			<div>
				<div class="e_imgBox">
					<div class="e_img_seoullogo">

						<a href="https://www.seouldementia.or.kr/" target="_blank"><img
							src="img/seoul_logo.gif" alt="서울시 광역치매센터 로고"></a>

						<ul class="e_text_seoul">
							<li><strong style="font-size: 1.2rem; color: coral;">서울시
									광역치매센터</strong></li>
							<li>- 치매예방 및 인식개선사업</li>
							<li>- 치매조기검진사업</li>
							<li>- 치매예방등록관리사업</li>
							<li>- 지역사회 자원강화사업</li>
							<li>- 정보시스템 구축·운영사업</li>
						</ul>
					</div>



					<div class="e_img_jeonnamlogo">

						<a href="https://jeonnam.nid.or.kr/home/main/main.aspx"
							target="_blank"><img src="img/jeonnam_logo.png"
							alt="전라남도 광역치매센터 로고"></a>

						<ul class="e_text_jeonnam">
							<li><strong style="font-size: 1.2rem; color: coral;">전라남도
									광역치매센터</strong></li>
							<li>- 치매 관리사업</li>
							<li>- 치매예방 및 인식개선 사업</li>
							<li>- 교육 및 연구사업</li>
							<li>- 지역 특화사업</li>
						</ul>
					</div>
				</div>
				<br> <br>

				<ul>
					<li class="e_title1"><strong>◎</strong> 치매 종합포털 모바일 앱 치매체크
						다운로드 바로가기</li>
				</ul>

				<div class="downloadBox">
					<a
						href="https://play.google.com/store/apps/details?id=kr.co.inergy.selftest"
						target="_blank"> <img src="img/img_google.png" alt="구글다운로드"></a>


					<a
						href="https://apps.apple.com/kr/app/%EC%B9%98%EB%A7%A4%EC%B2%B4%ED%81%AC/id664587531?l=en-GB?l=en"
						target="_blank"> <img src="img/img_apple.png" alt="애플다운로드"></a>

				</div>

				<ul>
					<li><strong style="font-size: 1.2rem; color: coral;">치매체크
							애플리케이션</strong></li>
					<li>> 치매예방 서비스</li>
					<li>> 실종노인예방서비스</li>
					<li>> 돌봄 서비스</li>
					<br>
					<li>스마트폰을 사용하시는 분이라면 <strong
						style="font-size: 1.2rem; color: coral;">누구나</strong> 무료로 이용할 수
						있습니다.
					</li>
				</ul>
			</div>
		</div>
	</div>


	<!-- Footer Start -->
	<jsp:include page="common/footer.jsp" flush="true">
		<jsp:param name="footer" value="푸터호출" />
	</jsp:include>
	<!-- Footer End -->

	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
		integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js"
		integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa"
		crossorigin="anonymous"></script>
</body>
</html>