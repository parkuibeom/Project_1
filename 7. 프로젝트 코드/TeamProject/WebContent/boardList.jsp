<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

             
                    <!DOCTYPE html>
                    <html>

                    <head>
                        <meta charset="UTF-8">
                        <meta name="viewport" content="width=device-width, initial-scale=1.0">
                        <title>DLT_커뮤니티</title>
                        <link rel="stylesheet" href="css/css.css">

                        <link rel="stylesheet"
                            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
                        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
                            rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
                        <link href="css/style.css" rel="stylesheet" />
                    </head>

                    <body>

                        <!-- Navbar Start -->
                        <jsp:include page="common/navi.jsp" flush="true">
                            <jsp:param name="navi" value="네비호출" />
                        </jsp:include>
                        <!-- Navbar End -->


                        <div id="conatain" class="board_wrap">
                            <div class="board_title">
                                <strong>DLT 커뮤니티</strong>
                                <p>질문하고 소통하는 공간! 커뮤니티에 오신것을 환영합니다.</p>
                            </div>
                            <div class="board_list_wrap">
                                <div class="board_list">
                                    <div class="top">
                                        <div class="num">번호</div>
                                        <div class="title">제목</div>
                                        <div class="writer">작성자</div>
                                        <div class="date">작성일</div>
                                        <div class="count">조회</div>
                                    </div>
                                	<c:if test = "${not empty boardList }">
                 <!--         	<div class="num">${(param.page - 1) * 10 + status.count}</div> -->                                                                                        
	<div>
    	<c:forEach var="dto" items="${boardList}" varStatus="status">
			  <div class="num">${dto.getBoardId() }</div>
        	<div class="title">
            	<a href="./boardView.do?boardId=${dto.getBoardId()}" style="text-decoration:none">${dto.getBoardTitle()}</a>
        	</div>
        	<div class="writer">${dto.getUserName() }</div>
        	<div class="date">${dto.getBoardDate()}</div>
        	<div class="count">${dto.getBoardViews()}</div>
    	</c:forEach>
	</div>
                                    
                                    </c:if>
                                    
<c:if test="${empty boardList}">
    <div>
        <div class="num">&nbsp;</div>
        <div class="title">&nbsp;</div>
        <div class="writer">&nbsp;</div>
        <div class="date">&nbsp;</div>
        <div class="count">&nbsp;</div>
    </div>
        <div>
        <div class="num">&nbsp;</div>
        <div class="title">&nbsp;</div>
        <div class="writer">&nbsp;</div>
        <div class="date">&nbsp;</div>
        <div class="count">&nbsp;</div>
    </div>
</c:if>

    </div>
			<c:set var="currentPage" value="${param.page}" />
			<div class="board_page">

				<a href="boardList.do?page=1" class="bt first"> << </a> 
			<c:choose>
			<c:when test = "${param.page <= endPage  }">
				<a href="boardList.do?page=${startPage}" class="bt next"> < </a> 
			</c:when>	
			<c:otherwise>
				<a href="boardList.do?page=${currentPage - 1}" class="bt next"> > </a> 
			</c:otherwise>
			</c:choose>


				<c:forEach var="pageNumber" begin="${startPage}" end="${endPage}">
					<c:set var="onClass"
						value="${pageNumber eq currentPage ? 'on' : ''}" />
					<a href="boardList.do?page=${pageNumber}" class="num ${onClass}">${pageNumber}</a>
				</c:forEach>

			<c:choose>
			<c:when test = "${param.page >= endPage  }">
				<a href="boardList.do?page=${endPage}" class="bt next"> > </a> 
			</c:when>
			<c:otherwise>
				<a href="boardList.do?page=${currentPage + 1}" class="bt next"> > </a> 
			</c:otherwise>
			</c:choose>
				<a href="boardList.do?page=${totalPages}" class="bt last"> >> </a>

			</div>

                                <!--URL 이동-->
                                <div class="bt_wrap">
                                    <c:choose>
                                    <c:when test = "${user_id == null }">
                                        <a href="beforeLogin.do" class="on">등록</a>
                                    </c:when>
                                    	<c:when test = "${user_id != null }">
                                            <a href="boardWrite.jsp" class="on">등록</a>
                                    	</c:when>
                                     </c:choose>
                                </div>

                            </div>
                        </div>

                        <!-- Footer Start -->
                        <jsp:include page="common/footer.jsp" flush="true">
                            <jsp:param name="footer" value="푸터호출" />
                        </jsp:include>
                        <!-- Footer End -->


                        <!-- JavaScript Libraries -->
                        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
                        <script
                            src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                        <!-- Chart.js-->
                        <script src="lib/wow/wow.min.js"></script>
                    </body>

                    </html>