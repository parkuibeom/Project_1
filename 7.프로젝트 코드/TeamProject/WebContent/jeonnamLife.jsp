<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<title>전남_생활 안정 지원</title>
<link rel="stylesheet" href="css/jeonnamLife.css">
<link rel="stylesheet" href="css/button.css">


<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
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
						<a href="index.jsp">홈</a> > <a href="policy.jsp">정책</a> > 전남 >생활
						안정 지원
					</div>
				</div>

				<div class="policyButton">
					<button id="policyBtn" class="policyBtn" type="button"
						onclick="location.href='policyJob.do?region_id=2';">어르신 일자리</button>
					<button class="policyBtn" type="button"
						onclick="location.href='policyWelfare.do?region_id=2';">여가 복지 지원</button>
					<button id="current" class="policyBtn" type="button"
						onclick="location.href='jeonnamLife.jsp';">생활 안정 지원</button>
					<button class="policyBtn" type="button"
						onclick="location.href='jeonnamHealth.jsp';">어르신 건강 증진</button>
				</div>
			</div>

			<div class="service-item">
				<img src="img/2.png">
				<div>
					<h2 class="service-title">생활 안정 지원</h2>
				</div>
			</div>

			<div>
				<ul>
					<li class="bj_title"><strong>◎</strong> 기초연금이란?</li>
					<li class="bj_indent_1">65세 이상의 소득인정액 선정기준액 이하인 어르신에게 일정금액을
						지급하여 국가와 자녀를 위해 열심히 살아오신 우리 어르신들의 어려움을 덜어드리기 위한제도입니다.</li>
				</ul>

				<ul>
					<li class="bj_title1"><strong>◆ 목적</strong></li>
					<li class="bj_indent_1">- 현재의 심각한 노인 빈곤문제를 해결하면서 미래세대의 부담을
						덜어드리고 노후에 안정된 혜택을 누릴 수 있도록 합니다.</li>
				</ul>

				<ul>
					<li class="bj_title1"><strong>◆ 법적 근거</strong></li>
					<li class="bj_indent_1">- 기초연금법</li>
					<li class="bj_indent_2">* 종전 기초노령연금법(제도)는 폐지되며, 종전 기초노령연금 수급자는
						기초연금 수급자로 전환</li>
				</ul>

				<ul>
					<li><strong>◆ 대상자</strong></li>
					<li class="bj_indent_1">- (수급대상) 만 65세 이상 한국 국적을 가지고 국내 거주하시는
						선정기준액 이하인 어르신</li>
					<li class="bj_indent_3">• 종전 기초노령연금법(제도)는 폐지되며, 종전 기초노령연금 수급자는
						기초연금 수급자로 전환</li>
					<li class="bj_indent_3">• 제외대상 : 공무원, 사립학교 교직원, 군인, 별정우체국직원 등
						직역연금 수급권자 및 그 배우자는 기초연금 수급대상에서 제외</li>
				</ul>

				<ul>
					<li><strong>◆ 월 지급액 : 월 최대 307.5천원(부부가구의 경우 492천원)</strong></li>
					<li class="bj_indent_1">- 기초연금법</li>
					<li class="bj_indent_2">* 종전 기초노령연금법(제도)는 폐지되며, 종전 기초노령연금 수급자는
						기초연금 수급자로 전환</li>
				</ul>

				<ul>
					<li><strong>◆ 지급신청 및 결정</strong></li>
					<li class="bj_indent_1">- 신청절차</li>
				</ul>

				<div class="bj_box">
					<span class="bj_textbox"> <span class="bj_line_1"><strong><br>신청인<br></strong>
							신청서 작성</span>
					</span> <span class="bj_chevron"> <span><img
							src="img/icon-right-chevron.png" alt="화살표"><br>신청</span>
					</span> <span class="bj_textbox"> <span class="bj_line_2"><strong>읍면동</strong></span>
					</span> <span class="bj_chevron"> <span><img
							src="img/icon-right-chevron.png" alt="화살표"><br>전달</span>
					</span> <span class="bj_textbox"> <span class="bj_line_3"><strong>시·군</strong></span>
					</span> <span class="bj_chevron"> <span><img
							src="img/icon-right-chevron.png" alt="화살표"><br>통지(30일)</span>
					</span> <span class="bj_textbox"> <span class="bj_line_3"><strong>신청인</strong></span>
					</span>
				</div>
				<br>

				<ul>
					<li class="bj_indent_3">* 만 65세 생일이 속하는 달의 1개월전부터 신청·접수 가능</li>
					<li class="bj_indent_3">본인이나 대리인(배우자, 자녀, 친족, 사회복지시설장)자격으로 위임장
						첨부하여 신청</li>
					<li class="bj_indent_3">* 신청장소 : 주소지 관할 읍,면사무소 및 동 주민센터 도는 가까운
						국민연금공단지사 및 상담센터국민연금공단 지사, 온라인신청(복지로)</li>
				</ul>

				<ul>
					<li><strong>◆ 지급시기 및 방법</strong></li>
					<li class="bj_indent_1">- 최초 지급시기</li>
					<li class="bj_indent_3">• 신청일이 속하는 달부터 지급(사전신청의 경우 만 65세 생일이
						속한 달부터 지급)</li>
					<li class="bj_indent_3">• 연금지급일 : 매달 25일에 지급</li>
					<li class="bj_indent_3">• 지급 방법 : 수급자 본인 금융계좌에 개별 입금을 원칙으로 하되,
						금융기관이 없는 지역에 거주하는 등 부득이한 사유가 있는 경우에는 직접 지급 가능</li>
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