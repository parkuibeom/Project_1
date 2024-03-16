package com.project.dlt.member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dlt.member.dao.IMemberRepository;
import com.project.dlt.member.model.MemberVO;
@Service
public class MemberService implements IMemberService{
	@Autowired
	IMemberRepository memberRepository;
	
	@Override
	public String login(HttpServletRequest request, HttpSession session) {
		String userId = request.getParameter("user_id");
        String userPw = request.getParameter("user_pw");

        // 로그인 로직 처리
        MemberVO user = memberRepository.login(userId, userPw);

        if (user == null) { // 로그인 실패
            if (session.getAttribute("login_try") == null) { // 새로운 세션인 경우
                session.setAttribute("login_try", 1);
            } else { // 로그인 시도 횟수 증가
            	Integer loginTry = (Integer) session.getAttribute("login_try");
            	int tryCount = (loginTry != null) ? loginTry.intValue() : 0;
                session.setAttribute("login_try", tryCount + 1);
            }
            return "member/loginFail"; // 로그인 실패 시 보여줄 뷰 이름
        } else { // 로그인 성공
            session.setAttribute("user_id", userId);
            session.setAttribute("user_name", user.getName());

            String returnURL = (String) session.getAttribute("returnURL");
            session.removeAttribute("returnURL"); // 로그인 후 이전 페이지로 리다이렉트하기 위해 세션에서 URL 제거

            if (returnURL == null || returnURL.equals("http://localhost:8181/TeamProject/registration.jsp")) {
                return "redirect:/"; // 로그인 후 이동할 URL
            } else {
                return "redirect:" + returnURL; // 이전 페이지로 리다이렉트
            }
        }
	}
	
	
	
	@Override
	public String beforeLogin(HttpServletRequest request, HttpSession session) {
		String returnURL = request.getHeader("Referer");
		session.setAttribute("returnURL", returnURL);
		return "redirect:/dlt/member/login";
	}


	@Override
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}



	@Override
	public String registerMember(MemberVO memberVO) {
		System.out.println(memberVO);
		return null;
	}

	
	
}
