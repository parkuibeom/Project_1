<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>DLT_작성한 글</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/css/css.css" />" />
<link rel="stylesheet" type="text/css"
	href="<c:url value="/css/style.css" />" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">

</head>


<body>
	<!-- Navbar Start -->
	<jsp:include page="../common/navi.jsp" flush="true">
		<jsp:param name="navi" value="네비호출" />
	</jsp:include>
	<!-- Navbar End -->


	<div id="conatain" class="board_wrap">
		<div class="board_title">
			<strong>DLT 커뮤니티</strong>
			<p>질문하고 소통하는 공간! 커뮤니티에 오신것을 환영합니다.</p>
		</div>
		<div class="board_view_wrap">
			<div class="board_view">
				<div class="title">${board.getBoardTitle() }</div>
				<div class="info">
					<dl>
						<dt>작성자</dt>
						<dd>${board.getUserName() }</dd>
					</dl>
					<dl>
						<dt>작성일</dt>
						<dd>${board.getBoardDate() }</dd>
					</dl>
					<dl>
						<dt>조회</dt>
						<dd>${board.getBoardViews() }</dd>
					</dl>
				</div>
				<div class="cont">${board.getBoardContent() }</div>
			</div>

			<!--URL 이동-->
			<div class="bt_wrap">
				<a href="boardList.do?page=1" class="on">목록</a>

				<c:choose>
					<c:when test="${board.getUserId() == user_id }">
						<a href="boardEditView.do?boardId=${board.getBoardId() }"
							class="on">수정</a>
					</c:when>
				</c:choose>
			</div>


			<form action="comment.do" method="post" name="commentform"
				id="commentform">
				<input type="hidden" name="b_id" value="${board.getBoardId() }" />
				<div class="comments-container">


					<!-- 댓글 목록 -->
					<c:forEach items="${list}" var="dto">
						<div
							class="comment ${dto.getcStep() == 0 ? 'comment' : 'special-comment'}">
							<c:choose>
								<c:when test="${dto.getcStep() == 0}">
									<strong>${dto.getcName() } :</strong>${dto.getComment() }
            </c:when>
								<c:otherwise>
									<strong>${dto.getcName() } :</strong>${dto.getComment() }
            </c:otherwise>
							</c:choose>

							<div class="comment-info">${dto.getcDate() }</div>

							<c:choose>
								<c:when test="${user_id != null}">
									<c:choose>
										<c:when test="${dto.getcStep() == 0}">
											<div class="reply-button"
												onclick="showReplyForm('${dto.getcName() }', ${dto.getGroup() })">답글
												달기</div>
										</c:when>
										<c:otherwise>
											<div class="different-reply-button"></div>
										</c:otherwise>
									</c:choose>

									<!-- ${dto.userId}와 ${sessionId}를 비교하여 일치하면 삭제하기 버튼 추가 -->
									<c:if test="${dto.getUserId() == user_id}">
										<div class="delete-button">
											<a
												href="commentDelete.do?group=${dto.getGroup() }&cId=${dto.getcId() }&cStep=${dto.getcStep() }&boardId=${board.getBoardId() }">삭제하기</a>
										</div>
									</c:if>
								</c:when>
								<c:otherwise>
									<div class="reply-button" onclick="loginPage()">답글 달기</div>
								</c:otherwise>
							</c:choose>
						</div>
					</c:forEach>


					<!-- 댓글 입력 폼 -->
					<div class="comment-form">
						<textarea id="commentText" name="commentText"
							placeholder="댓글을 입력하세요"></textarea>


						<c:choose>
							<c:when test="${user_id != null}">
								<input id="insertbtn" type="button" value="댓글 등록 "
									onclick="commentCheck()">
							</c:when>
							<c:otherwise>
								<input id="insertbtn" type="button" value="댓글 등록"
									onclick="loginPage()">
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</form>

		</div>
	</div>


	<!-- Footer Start -->
	<jsp:include page="../common/footer.jsp" flush="true">
		<jsp:param name="footer" value="푸터호출" />
	</jsp:include>
	<!-- Footer End -->


	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>

	<!-- Chart.js-->
	<script src="lib/wow/wow.min.js"></script>
	<script src="js/board.js"></script>

</body>

</html>