function writeCheck(){
    let writeForm = document.writeForm;
    let title = writeForm.title.value;
    let content = writeForm.content.value;
    
    if(title.length == 0 || title == ""){
    	alert("제목은 필수입니다.");
    	return false;
    }
    else if(content.length == 0 || content == ""){
    	alert("내용은 필수입니다.");
    	return false;
    }
    return true;
}