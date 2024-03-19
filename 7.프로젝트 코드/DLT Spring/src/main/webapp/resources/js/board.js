
/*댓글 관련 함수*/
//답글 달 때
function showReplyForm(cName, group) {
	var commentTextElement = document.getElementById("commentText");
	var insertbtnElement = document.getElementById("insertbtn");
	commentTextElement.value = "@" + cName + " ";
	insertbtnElement.value = "답글 등록";	
	var commentForm = document.getElementById("commentform");
	commentForm.action = "comment.do?group=" + group; // 원하는 URL로 변경
}

//로그인 시
function loginPage() {
	alert("로그인이 필요합니다.");
	window.location.href = "./beforeLogin.do";
}


//댓글 검사
function commentCheck() {
	var comment = document.commentform.commentText.value;
	
	if (comment.length == 0) {
		alert("댓글은 내용을 입력해주세요.");
		boardWriteForm.bTitle.focus();
		return;
	}else if(comment.length > 300){
		alert("댓글의 내용이 너무 많습니다. \n 글자 수 제한 : 300개");
		return;
	}
	
	document.commentform.submit();
}

