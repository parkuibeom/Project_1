<%@ page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.dlt.senior.policy.dao.SeniorDao"%>
<%@ page import="com.dlt.senior.policy.model.SeniorDto"%>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>	

					<%
						int regionId = Integer.parseInt(request.getParameter("region_id"));
						List<SeniorDto> pub = (ArrayList<SeniorDto>) request.getAttribute("publicDtos");
					%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<title>서울_여가 복지 지원</title>
<link rel="stylesheet" href="css/seoulWelfare.css">
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
						<% if(regionId == 1){ %>
						<a href="index.jsp">홈</a> > <a href="policy.jsp">정책</a> > 서울 > 어르신  일자리
						<% } %>
						<% if(regionId == 2){ %>
						<a href="index.jsp">홈</a> > <a href="policy.jsp">정책</a> > 전남 > 어르신 일자리
						<% } %>
					</div>
				</div>


				<div class="policyButton">
						<% if(regionId == 1){ %>
						<button class="policyBtn" type="button"
						onclick="location.href='policyJob.do?region_id=1';">어르신 일자리</button>
						<% } %>
						<% if(regionId == 2){ %>
						<button class="policyBtn" type="button"
						onclick="location.href='policyJob.do?region_id=2';">어르신 일자리</button>
						<% } %>
						
						<% if(regionId == 1){ %>
							<button id="current" class="policyBtn" type="button"
							onclick="location.href='policyWelfare.do?region_id=1';">여가 복지 지원</button>
						<% } %>
						<% if(regionId == 2){ %>
							<button id="current" class="policyBtn" type="button"
							onclick="location.href='policyWelfare.do?region_id=2';">여가 복지 지원</button>
						<% } %>
						
						<% if(regionId == 1){ %>
								<button class="policyBtn" type="button"
								onclick="location.href='seoulLife.jsp';">생활 안정 지원</button>
						<% } %>
						<% if(regionId == 2){ %>
								<button class="policyBtn" type="button"
								onclick="location.href='jeonnamLife.jsp';">생활 안정 지원</button>
						<% } %>
						<% if(regionId == 1){ %>
									<button class="policyBtn" type="button"
									onclick="location.href='seoulHealth.jsp';">어르신 건강 증진</button>
						<% } %>
						<% if(regionId == 2){ %>
									<button class="policyBtn" type="button"
									onclick="location.href='jeonnamHealth.jsp';">어르신 건강 증진</button>
						<% } %>
				</div>
			</div>


			<div class="service-item">
				<img src="img/2.png">
				<div>
					<h2 class="service-title">여가 복지 지원</h2>
				</div>
			</div>


			<ul>
				<li class="ds_title"><strong>◎</strong> 노인복지관</li>
				<br>
				<li class="ds_title1"><strong>◆ 복지관 현황</strong></li>
				<li class="ds_indent_1"><strong>- 시설현황 :</strong> 87개소</li>
				<li class="ds_indent_1"><strong>- 주요사업 :</strong> 종합상담지원, 사회교육,
					취미여가지원, 사회참여지원, 건강지원, 재가노인 지원 등</li>
				<li class="ds_indent_1"><strong>- 서울시 노인복지관 현황</strong></li>
			</ul>

			
			<%
							List<SeniorDto> welfare = (ArrayList<SeniorDto>) request.getAttribute("welfareDtos");
						%>
			<div>
				<table class="ds_table">
					<thead>
						<tr>
							<th width="5%">연번</th>
							<th width="10%">자치구</th>
							<th width="25%">기관명</th>
							<th width="40%">주소</th>
							<th width="20%">전화번호</th>
						</tr>
					</thead>

				<tbody>
						<% for(int i=0; i<welfare.size(); i++){ %>
						<tr>
							<td><%= welfare.get(i).getSeq() %></td>						
							<td><%= welfare.get(i).getJachigu() %></td>						
							<td><%= welfare.get(i).getOrgName() %></td>						
							<td><%= welfare.get(i).getAddress() %></td>						
							<td><%= welfare.get(i).getTelno() %></td>						
						</tr>
						<%} %>
					</tbody>
				</table>
			</div>

			<br>

			<ul>
				<li class="ds_title1"><strong>◆ 이용방법</strong></li>
				<li class="ds_indent_1">- 지원대상 : 만60세 이상 서울시 거주 어르신</li>
				<li class="ds_indent_1">- 참여하고자 하는 복지관에 회원가입 후 프로그램 신청 등 절차 진행
					후 수강 및 지원</li>
				<br>
				<br>
			</ul>

			<ul>
				<% if(regionId == 1){ %>
				<li class="ds_title"><strong>◎</strong> 경로당</li>
				<li>어르신들의 친목도모 및 취미활동, 각종 정보교환의 장인 경로당 활성화를 위하여 지원합니다.</li>
				<br>
				<li class="ds_title1"><strong>◆ 경로당 현황</strong></li>
				<li class="ds_indent_1"><strong>- 시설현황 :</strong> 3,472개소(2020년
					12월 기준)</li>
				<li class="ds_indent_1"><strong>- 등록인원 :</strong> 131,931명</li>
				<li class="ds_indent_1"><strong>- 지원사업 :</strong> 경로당 냉·난방비 및
					양곡비 지원, 경로당 특화프로그램 및 개방형 경로당 운영, 경로당순회프로그램 관리자 및 특화프로그램 전담인력 지원 등</li>
				<li class="ds_indent_1"><strong>- 이용대상 :</strong> 65세 이상 어르신</li>
				<li class="ds_indent_1"><strong>- 문 의 처 :</strong> 자치구 경로당 담당부서</li>
				<% } %>
				<% if(regionId == 2){ %>
				<ul>
            <li class="dj_title"><strong>◎</strong> 경로당</li>
            <br>
            <li class="dj_title1"><strong>◆ 경로당 현황</strong></li>
            <li class="dj_indent_1"><strong>- 등록 경로당 수 :</strong> 9,179개소
               (2021년 12월 기준)</li>
         </ul>
         <div>
            <!-- <p style="margin-left: 20px;">전라남도 경로당 현황표 삽입예정</p> -->
            <table class="dj_table">
               <thead>
                  <tr>
                     <th width="20%" class="dj_rightline">시군명</th>
                     <th width="20%" class="dj_rightline">등록 경로당</th>
                     <th width="20%" class="dj_rightline">시군명</th>
                     <th width="20%" class="dj_rightline">등록 경로당</th>
                  </tr>
               </thead>
               <tbody>
                  <tr>
                     <td class="dj_rightline">광양시</td>
                     <td class="dj_rightline">327</td>
                     <td class="dj_rightline">나주시</td>
                     <td class="dj_rightline">616</td>
                  </tr>
                  <tr>
                     <td class="dj_rightline">목포시</td>
                     <td class="dj_rightline">200</td>
                     <td class="dj_rightline">순천시</td>
                     <td class="dj_rightline">685</td>
                  </tr>
                  <tr>
                     <td class="dj_rightline">여수시</td>
                     <td class="dj_rightline">528</td>
                     <td class="dj_rightline">강진군</td>
                     <td class="dj_rightline">340</td>
                  </tr>
                  <tr>
                     <td class="dj_rightline">고흥군</td>
                     <td class="dj_rightline">645</td>
                     <td class="dj_rightline">곡성군</td>
                     <td class="dj_rightline">324</td>
                  </tr>
                  <tr>
                     <td class="dj_rightline">구례군</td>
                     <td class="dj_rightline">285</td>
                     <td class="dj_rightline">담양군</td>
                     <td class="dj_rightline">369</td>
                  </tr>
                  <tr>
                     <td class="dj_rightline">무안군</td>
                     <td class="dj_rightline">411</td>
                     <td class="dj_rightline">보성군</td>
                     <td class="dj_rightline">451</td>
                  </tr>
                  <tr>
                     <td class="dj_rightline">신안군</td>
                     <td class="dj_rightline">406</td>
                     <td class="dj_rightline">영광군</td>
                     <td class="dj_rightline">379</td>
                  </tr>
                  <tr>
                     <td class="dj_rightline">영암군</td>
                     <td class="dj_rightline">465</td>
                     <td class="dj_rightline">완도군</td>
                     <td class="dj_rightline">308</td>
                  </tr>
                  <tr>
                     <td class="dj_rightline">장성군</td>
                     <td class="dj_rightline">340</td>
                     <td class="dj_rightline">장흥군</td>
                     <td class="dj_rightline">408</td>
                  </tr>
                  <tr>
                     <td class="dj_rightline">진도군</td>
                     <td class="dj_rightline">279</td>
                     <td class="dj_rightline">함평군</td>
                     <td class="dj_rightline">378</td>
                  </tr>
                  <tr>
                     <td class="dj_rightline">해남군</td>
                     <td class="dj_rightline">597</td>
                     <td class="dj_rightline">화순군</td>
                     <td class="dj_rightline">438</td>
                  </tr>
               </tbody>
            </table>
         </div>
         <br><br><br>
				
			</ul>
		</div><br><br>
		<% } %>
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