package com.petnolja.research.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petnolja.common.model.vo.PageInfo;
import com.petnolja.member.model.vo.Member;
import com.petnolja.research.model.service.ResearchService;
import com.petnolja.research.model.vo.Research;
import com.petnolja.research.model.vo.UserSetSearch;

/**
 * Servlet implementation class SearchSitterController
 */
@WebServlet("/searchSitter.mem")
public class SearchSitterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchSitterController() {
        super();
    }

	/**
	 * @날드 내용이 길어서 주석으로 자세히 설명 붙였습니다
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		Member loginUser= null;
		String setAddress = "N"; // jsp로 돌아갔을때 주소를 설정했는지 확인 하기 위한 변수
		String setDate = "N"; // jsp로 돌아갔을때 날짜를 설정했는지 확인 하기 위한 변수
		int countDay = -1;
		Member m = new Member();
		// 날짜 미선택시 전체로 설정하기 위한 세팅
		String startDate = new SimpleDateFormat("yyyy-MM-dd").format(new Date()); // 오늘날짜부터
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.MONTH, +3);
		String endDate = new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());  // 3개월 뒤 날짜까지
		
		// 로그인을 했다면 
		if(request.getSession().getAttribute("loginUser") != null) {
			setAddress = "Y";  // jsp돌아갔을때 주소 설정을 했는지 파악하기 위한 변수
			loginUser= (Member)request.getSession().getAttribute("loginUser");
			// 주소를 선택하지 않았다면 유저 개인정보의 주소를 담음
			m.setMemNo(loginUser.getMemNo());
			m.setMemAddress(loginUser.getMemAddress());
			m.setMemLatitude(loginUser.getMemLatitude());
			m.setMemLongtitude(loginUser.getMemLongtitude());
		}
			// 주소 선택했다면 선택한 주소를 담고
		if(request.getParameter("address")!=null&&request.getParameter("address")!="") {
			setAddress = "Y";  // jsp돌아갔을때 주소 설정을 했는지 파악하기 위한 변수
			m.setMemAddress(request.getParameter("address"));
			m.setMemLatitude(Double.parseDouble(request.getParameter("latitude")));
			m.setMemLongtitude(Double.parseDouble(request.getParameter("longtitude")));
			// 주소를 선택하지 않았다면 유저 개인정보의 주소를 담음
		} else {
			// 로그인도 안하고 주소도 선택 안했으면 일단 DEFAULT로 본사
			m.setMemAddress("서울 강남구 테헤란로14길 6");
			m.setMemLatitude(37.4989966363357);
			m.setMemLongtitude(127.032848249971);
		}
		
		// 날짜 선택시 선택한 날짜로 조건 지정
		if(request.getParameter("chooseDate")!=null&&request.getParameter("chooseDate")!="") {
			setDate = "Y";  // jsp돌아갔을때 날짜 설정을 했는지 파악하기 위한 변수
			startDate = request.getParameter("chooseDate").substring(0, 10);
			if(request.getParameter("chooseDate").length()<22) {
				endDate=startDate;
			}else {
			endDate = request.getParameter("chooseDate").substring(13, 23);
			}
			// 사용자가 지정한 일자 모두 가능한 시터가 있는지 확인 하기 위한 검색한 총 일수 계산
			try {
			Date calStartDate = new SimpleDateFormat("yyyyMMdd").parse(startDate.replace("-", ""));
			Date calEndDate = new SimpleDateFormat("yyyyMMdd").parse(endDate.replace("-", ""));
			countDay = (int)((calEndDate.getTime() -calStartDate.getTime()) / (24 * 60 * 60 * 1000))+1;
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		
		// 선택한 옵션 배열에 담음 (자차픽업, 목욕, 약물, 노령견, 병원이동)
		String[] options = request.getParameterValues("option"); 
		// 페이지수를 계산하기 위해 service로 보냄
		int listCount = new ResearchService().searchListCount(startDate, endDate, options);
		int currentPage = 1;
		if(request.getParameter("searchPage")!=null) {currentPage = Integer.parseInt(request.getParameter("searchPage"));}
		int pageLimit = 10;
		int boardLimit = 5;
		int maxPage = (int)Math.ceil((double)listCount / boardLimit);	
		int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;		 
		int endPage = startPage + pageLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		// 값을 가져오기 위해 service로 보냄
		ArrayList<Research> searchlist = new ResearchService().searchSitter(m, startDate, endDate, options, pi);
		// list: 시터no, 시터이름, 시터제목, 옵션, 1박비용, 당일비용, 평균별점, 사진경로, 검색한날짜중이용가능한날짜수, 검색한곳과의 거리(km)
		
		// ===========================================================
		
		// jsp에서 id값으로 호출하기 위해 value를 id이름으로 변경
		if(options!=null) {
			for (int i = 0; i < options.length; i++) {
				switch (options[i]) {
				case "픽업":	options[i] = "pickup";	break;
				case "목욕": options[i] = "bath"; break;
				case "약물":	options[i] = "medicine"; break;
				case "노령견": options[i] = "oldPet"; break;
				case "병원": options[i] = "hospital"; break;
				}
			}
		}
		// jsp에 보내서 검색한 값 그대로 보여주기 위함 (주소, 날짜, 옵션)
		UserSetSearch us = new UserSetSearch(setDate, countDay, startDate, endDate, setAddress, m.getMemAddress(), m.getMemLatitude(), m.getMemLongtitude(), options);
		
		request.setAttribute("searchlist", searchlist);	
		request.setAttribute("userSet", us);
		request.setAttribute("pi", pi);
		request.getRequestDispatcher("views/research/searchPetsitter.jsp").forward(request, response);

		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
