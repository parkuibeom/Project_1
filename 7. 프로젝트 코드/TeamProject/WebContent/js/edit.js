let content;


window.onload = function(){
	content = document.getElementById("summernote").value;
}





document.getElementById('editForm').addEventListener('submit', function(event) {
	let editContent = document.getElementById("summernote").value;

	let boardTitle = document.getElementById("title").value;
	
	
	//제목 입력 요구
	if(boardTitle == ""){
		event.preventDefault(); // 폼 제출 취소
		alert("제목을 입력해주세요.");
	}
	//제목 길이 제한
	else if(boardTitle.length > 30){
		event.preventDefault();
		alert("제목의 길이가 너무 깁니다.");
	}
	
	//글 내용 입력 요구
	else if(editContent == ""){
		event.preventDefault(); // 폼 제출 취소
		alert("글 내용을 입력해주세요.");
	}
	
	//글 내용 수정 요구
	else if(content == editContent){
		event.preventDefault(); // 폼 제출 취소
		alert("글 내용을 수정해주세요.");
	}
});






