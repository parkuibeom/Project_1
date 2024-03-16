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
<title>DLT_일자리</title>
<link rel="stylesheet" href="css/seoulJob.css">
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
						<button id="current" class="policyBtn" type="button"
						onclick="location.href='policyJob.do?region_id=1';">어르신 일자리</button>
						<% } %>
						<% if(regionId == 2){ %>
						<button id="current" class="policyBtn" type="button"
						onclick="location.href='policyJob.do?region_id=2';">어르신 일자리</button>
						<% } %>
						
						<% if(regionId == 1){ %>
							<button class="policyBtn" type="button"
							onclick="location.href='policyWelfare.do?region_id=1';">여가 복지 지원</button>
						<% } %>
						<% if(regionId == 2){ %>
							<button class="policyBtn" type="button"
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

			<% if(regionId == 1){ %>
			<div class="service-item">
				<img src="img/1.png">
				<div>
					<h2 class="service-title">어르신 일자리</h2>
				</div>
			</div>

			<div>
				<ul>
					<li class="as_title1"><strong>◎</strong> 사업목적</li>
					<li class="as_indent_1">어르신이 활기차고 건강한 노후생활을 영위할 수 있도록 다양한
						일자리·사회활동을 지원하여 어르신복지 향상에 기여</li>
					<br>
					<li class="as_title1"><strong>◎</strong> 어르신 일자리·사회활동 지원사업 유형</li>
				</ul>


				<div class="as_seoultable">
					<!-- 어르신 일자리_공익활동 -->
					<ul>
						<li class="as_subTitle1">1) 공익활동</li>
						<p>어르신이 자기만족과 성취감 향상 및 지역사회 공익증진을 위해 자발적으로 참여하는 봉사활동</p>
					</ul>


					<div>
						<table class="as_tableBox1">
							<thead>
								<tr>
									<th width="11%">유형</th>
									<th width="35%">세부사업내용</th>
									<th width="35%">일자리 예시</th>
									<th width="14%">지원내용</th>
								</tr>
							</thead>
							<tbody>
								<%
									for (int i = 0; i < pub.size(); i++) {
								%>
								<tr>
									<td><%=pub.get(i).getCategory()%></td>
									<td><%=pub.get(i).getDtlBizCon()%></td>
									<td><%=pub.get(i).getJobSam()%></td>
									<%
										if(i==0){
									%>
										<td rowspan=<%=pub.size()%>><%=pub.get(i).getSupportCon()%></td> 
									<%
 										}
 									%>
								</tr>
								<%
									}
								%>
							</tbody>
						</table>
					</div><br><br>



					<!-- 어르신 일자리_사회서비스형 -->
					<ul>
						<li class="as_subTitle2">2) 사회서비스형</li>
						<p>취약계층 지원시설 및 돌봄시설 등 사회적 도움이 필요한 영역에 어르신 인력을 활용하여 필요한 서비스를
							제공하는 일자리</p>
					</ul>

					<%
					List<SeniorDto> Social = (ArrayList<SeniorDto>) request.getAttribute("socialDtos");
									int cnt = 1;
					%>

					<div>
						<table class="as_tableBox2">
							<thead>
								<tr>
									<th width="15%">유형</th>
									<th width="18%">세부유형</th>
									<th width="47%">사업내용</th>
									<th width="20%">지원내용</th>
								</tr>
							</thead>
							<tbody>
								<%
									for (int i = 0; i < Social.size(); i++) {
								%>
								<tr>
									<%
										if(Social.get(i).getCategory() != null){
									%>
										<td rowspan=<%=Social.get(i).getSeq()%>><%=Social.get(i).getCategory()%></td>
									<%
										}
									%>
									<td><%=Social.get(i).getDtlCategory()%></td>
									<td><%=Social.get(i).getBizCon()%></td>
									<%
										if(i==0){
									%>
										<td rowspan=<%=Social.size()%>><%=Social.get(i).getSupportCon()%></td> 
									<%
 										}
 									%>
								</tr>
								<%
									}
								%>
							</tbody>
						</table>
					</div><br><br>

					<!-- 어르신 일자리_시장형 -->
					<ul>
						<li class="as_subTitle3">3) 시장형사업단</li>
						<p>어르신에게 적합한 업종 중 소규모 매장 및 전문 직종 사업단 등을 공동으로 운영하여 일자리를 창출하는
							사업으로, 일정기간 사업비 또는 참여자 인건비를 일부 보충지원하고 추가 사업소득으로 연중 운영하는 어르신 일자리</p>
					</ul>

					<%
					List<SeniorDto> market = (ArrayList<SeniorDto>) request.getAttribute("marketDtos");
					%>
					<div>
						<table class="as_tableBox3">
							<thead>
								<tr>
									<th>세부유형</th>
									<th>사업내용</th>
									<th>지원내용</th>
								</tr>
							</thead>
							<tbody>
								<%
									for (int i = 0; i < market.size(); i++) {
								%>
								<tr>
									<%if(market.get(i).getDtlCategory() != null){ %>
										<td rowspan=<%=market.get(i).getSeq()%>><%=market.get(i).getDtlCategory()%></td>
									<%}%>
									<td><%=market.get(i).getJobCon()%></td>
									<%if(i==0){ %>
										<td rowspan=<%=market.size()%>><%=market.get(i).getSupportCon()%></td> 
									<%}%>
								</tr>
								<%
									}
								%>
							</tbody>
						</table>
					</div><br><br>



					<!-- 어르신 일자리_취업알선형 -->
					<ul>
						<li class="as_subTitle4">4) 취업알선형 사업단</li>
						<p>수요처의 요구에 의해서 일정 교육을 수료하거나 관련된 업무능력이 있는 자를 해당 수요처로 파견하여
							근무기간에 대한 일정 보수를 지급받을 수 있는 일자리</p>
					</ul>
					<br>

					<ul>
						<li class="as_title1"><strong>◎</strong> 어르신 일자리 및 사회활동 지원사업
							수행기관</li>
						<li>
							<p>중앙정부 및 지방자치단체에 등록된 비영리단체 또는 기관, 사회적 경제조직, 지자체 출연·출자 기관
								등으로서 어르신일자리 및 사회활동 지원사업에 참여하고자 하는 경우 관련자료를 해당 자치구에 제출</p>
							<p>- 시니어클럽, 노인복지관, 대한노인회, 노인복지센터, 사회복지관, 지역자활센터, 노인보호전문기관,
								지방문화원, 지역NGO, 지자체전담기관, 사회적 협동조합 등</p>
							<p>- 운영안내 통보일 현재 4대 사회보험의 적용을 받는 기관으로 한정</p>
							<p>- 취업알선형을 운영하는 수행기관은 직업안정법 제18조에 따라 국내 무료직업 소개사업을 수행하기 위해
								특별자치도지사·시장·군수 및 구청장에게 신고하여야 함</p>
							<p>※ 수행기관 지정 제외 : 종교시설(교회·사찰 등), 임의 단체(동호회 및 전우회, 부녀회 등)
								경로당(경로당은 대한노인회 지회를 통해 사업 참여 가능)</p>
						</li>
					</ul>
					<br>

					<ul>
						<li class="as_title1"><strong>◎</strong> 모집방법</li>
						<li>공익활동은 인근 수행기관 또는 자치구별 통합 모집 및 선발</li>
						<li>사회서비스형, 시장형 사업단 및 취업알선형은 수행기관별 참여자 공개모집</li>
					</ul>
					<br>

					<ul>
						<li class="as_title1"><strong>◎</strong> 참여자격</li>
					</ul>

					<table class="as_tableBox4">
						<thead>
							<tr>
								<th>구분</th>
								<th>공익활동*</th>
								<th>사회서비스형</th>
								<th>시장형사업단·취업알선형</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>자격</td>
								<td>만 65세 이상 기초연금수급자</td>
								<td>만 65세 이상<br>(단, 일부유형은 만 60세
									이상)
								</td>
								<td>만 60세 이상<br>사업특성 적합자
								</td>
							</tr>
						</tbody>
					</table>
					<br>

					<ul>
						<li><strong>*</strong>공익활동은 만 65세 이상 기초연금수급자 대기자가 없는 경우, 만
							60~64세 차상위 계층 참여가능</li>
					</ul>
					<br>

					<ul>
						<li><b>※</b><b> </b><b>노인일자리 및 사회활동 지원사업 신청 제외자</b></li>
					</ul>
					<table class="as_tableBox5">
						<tbody>
							<tr>
								<td style="font-weight: bold; line-height: 35px;">■<b>
								</b>국민기초생활보장법에 의한 생계급여수급자<br> ※ 의료급여, 교육급여, 주거급여 수급자는 신청 가능<br>
									■<b> </b>국민건강보험 직장가입자(취업알선형 제외)<br> ※ 사회서비스형 및 시장형사업단은 해당
									사업단의 건강보험 직장가입자일 경우 해당 없음<br> ■<b> </b>장기요양보험 등급판정자 1~5등급,
									인지지원등급<br> ■<b> </b>정부부처 및 지자체에서 추진하는 일자리사업에 2개 이상 참여하고 있는
									자<br> -어르신 일자리 및 사회활동 지원사업 내 중복참여 불가<br> ※ 그 외 신청 제외자
									해당 여부(실업급여 수급 이후 재참여 제한 등)는 2022년 직접일자리 사업 중앙 - 자자체합동지침에 따름<br>
									■<b> </b>국내 거주자 중 외국민은 국적 취득자(주민등록번호 소유자)에 한하여 참여 가능
								</td>
							</tr>
						</tbody>
					</table>
					<br>


					<ul>
						<li class="as_title1"><strong>◎</strong> 선정기준</li>
					</ul>

					<table class="as_tableBox6">
						<thead>
							<tr>
								<th>사업유형</th>
								<th>선발 기준</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>공익활동</td>
								<td>소득인정액, 참여경력, 세대구성, 활동역량을 종합적으로 판단하여 선발</td>
							</tr>
							<tr>
								<td>사회서비스형</td>
								<td>활동역량, 필요도, 사무역량, 인성, 대인관계 역량, 유관 자격증 보유를 종합적으로 판단하여 선발
								</td>
							</tr>
							<tr>
								<td>시장형사업단</td>
								<td>관련분야 자격 및 경력, 세대구성, 기초연금 수급여부 등, 종합의견을 종합적으로 판단하여 선발</td>
							</tr>
							<tr>
								<td>취업알선형</td>
								<td>해당 기업의 선발 기준에 따라 선정</td>
							</tr>
						</tbody>
					</table>
				</div><br><br><br>
			</div>
		</div>
			<% } %>
			<% if(regionId == 2){ %>
	<div class="service-item">
					<img src="img/1.png">
					<div>
						<h2 class="service-title">어르신 일자리</h2>
					</div>
				</div>

				<div>
					<ul>
						<li class="aj_title1"><strong>◎</strong> 사업목적</li>
						<li class="aj_indent_1">어르신이 활기차고 건강한 노후생활을 영위할 수 있도록 다양한
							일자리·사회활동을 지원하여 어르신복지 향상에 기여</li>
						<br>
						<li class="aj_title1"><strong>◎</strong> 노인일자리 및 사회활동지원사업 안내</li>
					</ul>
					<div>
						<table class="aj_table">
							<thead>
								<tr>
									<th width="10%">사업유형</th>
									<th width="12%">신청자격</th>
									<th width="8%">참여기간</th>
									<th width="10%">활동시간</th>
									<th width="14%">활동비</th>
									<th width="46%">주요내용</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>공익활동형</td>
									<td>만 65세 이상<br>기초연금 수급자
									</td>
									<td>11개월</td>
									<td>월 30시간</td>
									<td>월 27만원</td>
									<td>노인이 자기만족과 성취감 향상 및 지역사회 공익증진을 위해 참여하는 활동 <br>예)노노케어,
										취약계층 지원, 공공시설 봉사, 경륜전수 활동 등
									</td>
								</tr>
								<tr>
									<td>사회서비스형</td>
									<td>만 65세 이상</td>
									<td>10개월</td>
									<td>월 60시간</td>
									<td>월 71.3만원<br> (주휴수당 포함)
									</td>
									<td>노인의 경력과 활동역량을 활용하여 사회적 도움이 필요한 영역<br>(지역사회 돌봄, 안전
										등)에 서비스를 제공하는 일자리 <br>예)보육교사 보조, 노인맞춤돌봄서비스 보조, 시니어 안전모니터링
										등
									</td>
								</tr>
								<tr>
									<td>시 장 형</td>
									<td>만 60세 이상</td>
									<td>연중</td>
									<td>계약에 따름</td>
									<td>시급(9,160원) 이상</td>
									<td>참여자 인건비 일부를 보충지원하고 추가 사업 수익으로 연중 운영하는 노인일자리 <br>예)식품(공산품)제조
										및·판매, 매장운영, 지역영농 사업 등
									</td>
								</tr>
								<tr>
									<td>취업알선형</td>
									<td>만 60세 이상</td>
									<td>연중</td>
									<td>계약에 따름</td>
									<td>시급(9,160원) 이상</td>
									<td>수요처의 요구에 의해서 일정 교육을 수료하거나, 관련된 업무능력이 있는 자를 해당 수요처로 연계하여
										근무기간에 대한 일정 임금을 지급받을 수 있는 일자리 <br>예)경비원, 주유원, 청소원, 운전원 등
									</td>
								</tr>
							</tbody>
						</table>
					</div><br><br>
				</div>
			</div>
			<% } %>
	</div>


	<!-- Footer Start -->
	<jsp:include page="common/footer.jsp" flush="true">
		<jsp:param name="footer" value="푸터호출" />
	</jsp:include>
	<!-- Footer End -->

</body>

</html>