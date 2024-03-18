<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>DLT_지역별 통계</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport" />

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Libre+Baskerville:wght@700&family=Open+Sans:wght@400;500;600&display=swap"
	rel="stylesheet" />

<!-- Icon Font Stylesheet -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet" />
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
<!-- Libraries Stylesheet -->
<link rel="stylesheet" type="text/css"
	href="<c:url value="/lib/animate/animate.css" />" />
<link rel="stylesheet" type="text/css"
	href="<c:url value="/lib/lightbox/css/lightbox.min.css" />" />
<link rel="stylesheet" type="text/css"
	href="<c:url value="/css/bootstrap.min.css" />" />
<link rel="stylesheet" type="text/css"
	href="<c:url value="/css/style.css" />" />
</head>
<body>
	<!-- Navbar Start -->
	<jsp:include page="../common/navi.jsp" flush="true">
		<jsp:param name="navi" value="navi" />
	</jsp:include>
	<!-- Navbar End -->

	<div class="jumbotron text-center">
		<h1>"지역별 질병률 데이터 제공 서비스"</h1>
		<p>지역별 질병률 정보를 한눈에 제공합니다.</p>
	</div>

	<!-- Kakao Map -->
	<div id="mapContainer" class="container mb-5 wow fadeInUp"
		data-wow-delay="0.3s">
		<div class="text-center mx-auto" style="max-width: 500px;">
			<p class="px-3" style="font-weight: bold; color: #454678;">KOREA
				Map</p>
		</div>
		<div class="row mt-3">
			<div class="col-xs-12">
				<div id="map"
					style="width: 100%; height: 800px; border-radius: 50px;"></div>
			</div>
		</div>
	</div>
	<!-- Kakao Map Initialization Script -->


	<!-- Footer Start -->
	<jsp:include page="../common/footer.jsp" flush="true">
		<jsp:param name="footer" value="footer" />
	</jsp:include>
	<!-- Footer End -->

	<!-- JavaScript Libraries -->

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="<c:url value="/lib/lightbox/js/lightbox.min.js" />"></script>
	<!-- WOW Library -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/wow/1.1.2/wow.min.js"></script>
	
	<!-- Template Javascript -->
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<!--깃허브 올릴 때 API 키 빼기 -->
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=834c577e5b93d39bfec9a81ef3ef9005"></script>
	<script src="<c:url value="/js/map.js" />"></script>
	<script src="<c:url value="/lib/wow/wow.min.js" />"></script>
</body>
</html>