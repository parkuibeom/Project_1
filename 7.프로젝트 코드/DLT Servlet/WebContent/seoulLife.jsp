<%@ page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<title>서울_생활 안전 지원</title>
<link rel="stylesheet" href="css/seoulLife.css">
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
						<a href="index.jsp">홈</a> > <a href="policy.jsp">정책</a> > 서울 > 어르신  일자리

					</div>
				</div>

				<div class="policyButton">
					<button class="policyBtn" type="button"
						onclick="location.href='policyJob.do?region_id=1';">어르신 일자리</button>
					<button class="policyBtn" type="button"
						onclick="location.href='policyWelfare.do?region_id=1';">여가 복지 지원</button>
					<button id="current" class="policyBtn" type="button"
						onclick="location.href='seoulLife.jsp';">생활 안정 지원</button>
					<button class="policyBtn" type="button"
						onclick="location.href='seoulHealth.jsp';">어르신 건강 증진</button>
				</div>
			</div>

			<div class="service-item">
				<img src="img/3.png">
				<div>
					<h2 class="service-title">생활 안정 지원</h2>
				</div>
			</div>

			<div>
				<ul>
					<li class="bs_title"><strong>◎</strong> 사업목적</li>
					<li class="bs_indent">어르신에게 기초연금을 지급하여 안정적인 소득기반을 제공함으로써 어르신의
						생활안정을 지원하고 복지를 증진</li>
					<br>
				</ul>

				<ul>
					<li class="bs_title1"><strong>◆ 지원대상 : 만65세이상, 소득인정액이
							선정기준이하 어르신(소득 하위 70% 어르신)</strong></li>
					<li class="bs_indent">- 소득인정액 : 소득평가액 + 재산의 소득환산액</li>
					<li class="bs_indent">- 선정기준액 : 단독가구 2,020천원 이하, 부부가구 3,232천원
						이하</li>
				</ul>

				<ul>
					<li class="bs_title1"><strong>◆ 신청기간 : 연중 만 65세 생일이
							속하는 달의 1개월 전 초일부터 신청 접수 가능 (만 65세 생일이 도래한 월부터 지급)</strong></li>
				</ul>

				<ul>
					<li class="bs_title1"><strong>◆ 지급기준 : 연금 신청한 날이 속한
							달부터 지급(대상자 선정이 지연된 경우)</strong></li>
					<li class="bs_indent">만 65세 생일이 '23년 3월인 분은 '23년 2월 1일부터 기초연금
						신청이 가능하고, 3월분 급여부터 수급 가능</li>
					<br>
					<li class="bs_title1"><strong>◆ 신청절차</strong></li>
				</ul>


				<div class="bs_box">
					<span class="bs_textbox"> <span class="bs_line_1"><strong><br>기초연금
								신청<br></strong> (동주민센터, 국민연금공단지사)</span>
					</span> <span class="bs_chevron"> <span><img
							src="imgs/icon-right-chevron.png" alt=""></span>
					</span> <span class="bs_textbox"> <span class="bs_line_2"><strong><br>소득재산조사</strong><br>(30일
							이내)</span>
					</span> <span class="bs_chevron"> <span><img
							src="imgs/icon-right-chevron.png" alt=""></span>
					</span> <span class="bs_textbox"> <span class="bs_line_3"><strong>연급지급
								결정</strong></span>
					</span> <span class="bs_chevron"> <span><img
							src="imgs/icon-right-chevron.png" alt=""></span>
					</span> <span class="bs_textbox"> <span class="bs_line_3"><strong>이의신청</strong></span>
					</span> <span class="bs_chevron"> <span><img
							src="imgs/icon-right-chevron.png" alt=""></span>
					</span> <span class="bs_textbox"> <span class="bs_line_3"><strong>연금지급</strong></span>
					</span>
				</div>

				<br>
				<br>
				<br>

				<ul>
					<li class="bs_title1"><strong>◆ 혜택사항</strong></li>
					<li class="bs_indent">개인별 32,318원 ~ 323,180원 차등 지원</li>
				</ul>

				<div class="bs_tableBox">
					<table class="bs_intableBox">
						<thead>
							<tr>
								<th class="bs_title2" id="bs_rightlineid">2022</th>
								<th class="bs_title2">2023</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="bs_rightline2022">
									<div class="bs_y2022">
										<ul>
											<li><strong>2022년 선정기준액</strong></li>
											<li>- 노인 단독가구 : 1,800,000원 (전년대비 11만원 인상)</li>
											<li>- 노인 부부가구 : 2,880,000원 (전년대비 17만 6천원 인상)</li>
										</ul>
										<ul>
											<li><strong>근로소득공제 상향 : 103만원 기본공제 (전년대비 5만원 인상)</strong></li>
										</ul>
										<ul>
											<li><strong>증여재산에서 제외하는 자연적 소비금액</strong></li>
											<li>- 노인 단독가구 : 2,097,351원 (전년대비 105,376원 인상)</li>
											<li>- 노인 부부가구 : 2,560,540원 (전년대비 122,395원 인상)</li>
										</ul>
										<ul>
											<li><strong>2022년 기준연금액 : 307,500원</strong></li>
										</ul>
									</div>
								</td>
								<td class="bs_rightline2023">
									<div class="bs_y2023">
										<ul>
											<li><strong>2023년 선정기준액</strong></li>
											<li>- 노인 단독가구 : 2,020,000원 (전년대비 22만원 인상)</li>
											<li>- 노인 부부가구 : 3,232,000원 (전년대비 35만 2천원 인상)</li>
										</ul>
										<ul>
											<li><strong>근로소득공제 상향 : 108만원 기본공제 (전년대비 5만원
													인상)</strong></li>
										</ul>
										<ul>
											<li><strong>증여재산에서 제외하는 자연적 소비금액</strong></li>
											<li>- 노인 단독가구 : 2,217,408원 (전년대비 120,057원 인상)</li>
											<li>- 노인 부부가구 : 2,700,482원 (전년대비 139,942원 인상)</li>
										</ul>
										<ul>
											<li><strong>2023년 기준연금액 : 323,180원</strong></li>
										</ul>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>

				<br>
				<br>
				<br>
				<br>

				<ul>
					<li class="bs_title1"><strong>◆ 문의처</strong></li>
					<li class="bs_indent">각 구청 및 동주민센터, 국민연금공단 지사</li>
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