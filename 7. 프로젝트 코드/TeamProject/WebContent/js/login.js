function loginCheck() {
    let loginForm = document.loginForm;
    let id = loginForm.user_id.value;
    let pw = loginForm.user_pw.value;

    if (id.length == 0 || id == "") {
        alert("아이디는 필수입니다.");
        return false; //서블릿 이동 방지
    }
    else if (pw.length == 0 || pw == "") {
        alert("비밀번호는 필수입니다.");
        return false;
    }

    return true;
}