package com.dlt.senior;

import java.io.IOException;



import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;

import com.dlt.senior.board.service.BCDeleteCommand;
import com.dlt.senior.board.service.BCWriteCommand;
import com.dlt.senior.board.service.BCommand;
import com.dlt.senior.board.service.BDeleteCommand;
import com.dlt.senior.board.service.BEditCommand;
import com.dlt.senior.board.service.BEditViewCommand;
import com.dlt.senior.board.service.BListCommand;
import com.dlt.senior.board.service.BViewCommand;
import com.dlt.senior.board.service.BWriteCommand;
import com.dlt.senior.disease.service.SCCheckData;
import com.dlt.senior.disease.service.SDCommand;
import com.dlt.senior.disease.service.SDDataCommand;
import com.dlt.senior.disease.service.SDiseaseCommand;
import com.dlt.senior.disease.service.SDistrictCommand;
import com.dlt.senior.life.model.LifeServiceDto;
import com.dlt.senior.life.service.SLCommand;
import com.dlt.senior.life.service.SLifeRegionCommand;
import com.dlt.senior.life.service.SLifePersonalCommand;
import com.dlt.senior.policy.service.SJobCommand;
import com.dlt.senior.policy.service.SPCommand;
import com.dlt.senior.policy.service.SWelfareCommand;
import com.dlt.senior.survey.service.SSurveyCommand;
import com.dlt.senior.survey.service.SSurveyGraphCommand;
import com.dlt.senior.survey.service.SSurveyScoreCommand;
import com.dlt.senior.userMgmt.service.UCommand;
import com.dlt.senior.userMgmt.service.ULoginCommand;
import com.dlt.senior.userMgmt.service.URegisterCommand;



@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	//API로 가져오는 데이터
	@Override
	public void init() throws ServletException {
	    // 데이터가 이미 존재하는지 여부를 확인합니다.
		SCCheckData checkData = new SCCheckData();

        // 데이터 초기화를 위해 서비스 클래스를 호출합니다.
		checkData.initializeIfNeeded();
	}
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doHandle(request, response);
	}
	
	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset = utf-8");
		
		//session
		HttpSession sess = request.getSession();	
		BCommand board;
		
		//mapping path
		String path = request.getContextPath(); 
		String uri = request.getRequestURI();	
		String command = uri.substring(path.length());
		System.out.println("사용한 커맨드  : " + command);
		
		/*main page*/
		if(command.equals("/") || command.equals("/index.do")) {
			board = new BListCommand();
			request.setAttribute("page", 1);
			
			board.execute(request, response);
			
			RequestDispatcher dispatch = request.getRequestDispatcher("index.jsp");
			dispatch.forward(request, response);
		}
		
		
		/*게시판 코드(Board)*/
		
		//board list
		if(command.equals("/boardList.do")) {
			board  = new BListCommand();
			
			board.execute(request, response);

			
			RequestDispatcher dispatch = request.getRequestDispatcher("boardList.jsp");
			dispatch.forward(request, response);
		}
		
		//board write view
		else if(command.equals("/boardWriteView.do")) {
			String userId = (String) sess.getAttribute("user_id");
			
			//로그인 되어있는지 체크
			if(userId == null) {
				response.sendRedirect("beforeLogin.do");
			}
			else {
				response.sendRedirect("boardWrite.jsp");
			}

		}
		
		//board write
		else if(command.equals("/boardWrite.do")) {
//			String cspPolicy = "script-src 'self'; style-src 'self';";// CSP setting
//			response.setHeader("Content-Security-Policy", cspPolicy); //XSS prevetion
			board  = new BWriteCommand();
			
			String userId = (String) sess.getAttribute("user_id");
			
			//로그인 되어있는지 체크
			if(userId == null) {
				response.sendRedirect("beforeLogin.do");
			}
			else {
				board.execute(request, response);
				response.sendRedirect("boardView.do?boardId="+request.getAttribute("boardId"));
//				RequestDispatcher dispatch = request.getRequestDispatcher("boardView.do");
//				dispatch.forward(request, response);
			}
		}

		//board view
		else if(command.equals("/boardView.do")) {
			board = new BViewCommand();
			
			board.execute(request, response);
			
			RequestDispatcher dispatch = request.getRequestDispatcher("boardView.jsp");
			dispatch.forward(request, response);
		}
		
		//board edit View
		else if(command.equals("/boardEditView.do")) {
			board = new BEditViewCommand();
			
			board.execute(request, response);
			
			
			if(request.getAttribute("boardTitle").equals("differ")) {
				response.sendRedirect("boardEditError.jsp");
			}
			else {
				RequestDispatcher dispatch = request.getRequestDispatcher("boardEdit.jsp");
				dispatch.forward(request, response);
			}
		}
		
		//board edit
		else if(command.equals("/boardEdit.do")) {
			String cspPolicy = "script-src 'self'; style-src 'self';";// CSP setting
			response.setHeader("Content-Security-Policy", cspPolicy); //XSS prevetion
			board = new BEditCommand();
			board.execute(request, response);
			response.sendRedirect("boardView.do?boardId=" + request.getParameter("boardId"));
		}
		
		//board delete
		else if(command.equals("/boardDelete.do")) {
			board = new BDeleteCommand();
			board.execute(request, response);
			response.sendRedirect("boardList.do?page=1");
		}
		
		//comment add
		else if(command.equals("/comment.do")) {
			board = new BCWriteCommand();
			String cName = (String) sess.getAttribute("user_name");
			request.setAttribute("user_name", cName);
			
			String userId = (String) sess.getAttribute("user_id");
			request.setAttribute("user_id", userId);
			
			//서버 리부트 후 댓글 페이지에 로그인 세션이 남아있을 때(예외 방지)
			if(userId == null) {
				response.sendRedirect("beforeLogin.do");
			}
			else {
				board.execute(request, response);
				response.sendRedirect("boardView.do?boardId="+ request.getParameter("b_id"));
			}
		}
		
		//comment delete
		else if(command.equals("/commentDelete.do")) {
			board = new BCDeleteCommand();
			
			String userId = (String) sess.getAttribute("user_id");
			request.setAttribute("user_id", userId);
			
			//서버 리부트 후 댓글 페이지에 로그인 세션이 남아있을 때(예외 방지)
			if(userId == null) {
				response.sendRedirect("beforeLogin.do");
			}
			else {
				board.execute(request, response);
				response.sendRedirect("boardView.do?boardId="+request.getParameter("boardId"));
			}
			
			
		}
		
		
		/*유저 관리 코드(UserMgmtController)*/
		
		//login
	    if ("/login.do".equals(command)) {
	    	UCommand login = new ULoginCommand();
	    	
	    	String returnURL = (String) sess.getAttribute("returnURL");
	    	login.execute(request, response);
	    	
	    	String userName = (String) request.getAttribute("user_name");
	    	//Login logic
	    	if(userName == null) { //login fail
	    		if(sess.getAttribute("login_try") == null) { //new session
	    			int loginTry = 1;
	    			sess.setAttribute("login_try", loginTry);
	    		}
	    		else {//login try count
	    			int loginTry = (int) sess.getAttribute("login_try");
	    			++loginTry;
	    			sess.setAttribute("login_try",loginTry);
	    		}
	    		RequestDispatcher dispatch = request.getRequestDispatcher("loginFail.jsp");
	    		dispatch.forward(request,response);
	    	}else {//login success
	    		String userId = (String) request.getAttribute("user_id");
	    		
	    		sess.setAttribute("user_id", userId); //session input loginid
	    		sess.setAttribute("user_name", userName); //session input loginname For board input
	    	
	    		if(returnURL == null) {
	    			response.sendRedirect("index.jsp"); //Login after server initialization
	    		}
	    		else if(returnURL.equals("http://localhost:8181/TeamProject/registration.jsp")){
	    			response.sendRedirect("index.jsp");
	    		}
	    		else {
		    		response.sendRedirect(returnURL); //request thRe previous page
	    		}	
	    	}
	    }
	    
		//logout
	    else if ("/logout.do".equals(command)) {
			String returnURL = request.getHeader("Referer");
			sess.setAttribute("returnURL", returnURL);
	    	sess.invalidate();
	    	response.sendRedirect(returnURL);
	    	}
	    
	    //before page save
	    else if("/beforeLogin.do".equals(command)) {
			String returnURL = request.getHeader("Referer");
			sess.setAttribute("returnURL", returnURL);
			response.sendRedirect("login.jsp");
			}
	    
	  //register member
	    else if("/registerMember.do".equals(command)) {
	    	UCommand register = new URegisterCommand();
	    	String returnURL = request.getHeader("Referer");
	    	sess.setAttribute("returnURL", returnURL);
	    	

	    	register.execute(request, response);
	    	response.sendRedirect("registrationCheck.jsp");
	    }
	    
	    /*서비스 코드*/
		
		//life expectancy Code
		if("/regionLife.do".equals(command)) {
			SLCommand sLife = new SLifeRegionCommand();
			sLife.execute(request, response);
			
			List<LifeServiceDto> list = (ArrayList<LifeServiceDto>) request.getAttribute("lifeList");
			
			JSONArray jsonArray = new JSONArray();
			
			for(LifeServiceDto data : list) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.put("year", data.getYear());
				jsonObject.put("region_id", data.getRegionId());
				jsonObject.put("value", data.getExpectancyLife());
				jsonArray.put(jsonObject);
			}
		
			String json = jsonArray.toString();
			
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			
			response.getWriter().write(json);
		}
		
		//Life Service
		if("/personalLife.do".equals(command)) {
			SLCommand sLife = new SLifePersonalCommand();

			sLife.execute(request, response);
			
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("age", request.getAttribute("age"));
			
			String json = jsonObject.toString();
			
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			
			response.getWriter().write(json);
		}
		
		
		//Statistics by district service
		//Region information to be used in the chart
		else if ("/Chart.do".equals(command)) {
//			SDDataCommand test = new SDDataCommand(); //경량화 필요
			SDCommand acc = new SDistrictCommand();
			acc.execute(request, response);
			RequestDispatcher dispatcher = request.getRequestDispatcher("statisticsService.jsp");
			dispatcher.forward(request, response);
		}
		
		//Data to be used in the chart
		else if ("/getChart.do".equals(command)) {
			response.setHeader("Access-Control-Allow-Origin", "*");
			SDCommand gcc = new SDiseaseCommand();
			gcc.execute(request, response);
			JSONArray list = (JSONArray) request.getAttribute("list");
			PrintWriter out = response.getWriter();
			out.print(list.toString());
			out.flush();
		}
		
		//policy job load
		else if("/policyJob.do".equals(command)) {
			SPCommand policy = new SJobCommand();
			policy.execute(request, response);
			
			RequestDispatcher dispatch = request.getRequestDispatcher("seoulJob.jsp");
			dispatch.forward(request, response);
		}
		
		//policy welfare load
		else if("/policyWelfare.do".equals(command)) {
			SPCommand policy = new SWelfareCommand();
			policy.execute(request, response);
			
			RequestDispatcher dispatch = request.getRequestDispatcher("seoulWelfare.jsp");
			dispatch.forward(request, response);
		}
		
		//Survey Input
		else if("/surveyInsertScore.do".equals(command)) {
			SSurveyCommand survey = new SSurveyScoreCommand();
			survey.execute(request, response);
			
			RequestDispatcher rd = request.getRequestDispatcher("survey.jsp");
			rd.forward(request, response);
		} 
		
		//Survey Graph display
		else if("/surveyGraph.do".equals(command)) {	// 평균값 조회하기
			SSurveyCommand survey = new SSurveyGraphCommand();
			survey.execute(request, response);
			
			RequestDispatcher rd = request.getRequestDispatcher("survey.jsp");
			rd.forward(request, response);
		} 
		
	}
	
	

}
