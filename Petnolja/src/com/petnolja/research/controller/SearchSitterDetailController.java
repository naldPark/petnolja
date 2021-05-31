package com.petnolja.research.controller;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.petnolja.member.model.vo.Member;
import com.petnolja.pet.model.vo.Pet;
import com.petnolja.research.model.service.ResearchService;
import com.petnolja.research.model.vo.Research;
import com.petnolja.research.model.vo.Review;

/**
 * Servlet implementation class SearchSitterDetailController
 */
@WebServlet("/searchSitterDetail.mem")
public class SearchSitterDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchSitterDetailController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int userNo=-1;
		int sitterNo = Integer.parseInt(request.getParameter("sno"));
		
		// 로그인을 했다면 유저no를 담는다
		if(request.getSession().getAttribute("loginUser") != null) {
		userNo = ((Member)request.getSession().getAttribute("loginUser")).getMemNo();	
		}
		
		// 검색한 sitter의 정보를 가져온다 (위의 유저no도 같이 보내서 favorite여부도 체크)
		Research sitterInfo = new ResearchService().searchSitterDetail(sitterNo, userNo);
		for (int i = sitterInfo.getPath().split(",").length; i < 4; i++) {
			sitterInfo.setPath(sitterInfo.getPath()+",resources/images/member/welcome.png");
		}		
		
		String[] sitterPic = sitterInfo.getPath().split(",");
		
		// 예약을 위한 펫리스트를 가져온다
		if(userNo != -1) {
		ArrayList<Pet> petList = new ResearchService().memPetInfo(sitterNo, userNo);
		request.setAttribute("petList", petList);
		}
		
		// 하단의 리뷰리스트를 가져온다
		ArrayList<Review> rwList = new ResearchService().sitterReview(sitterNo);
		
		// 리뷰리스트의 총 갯수확인
		int listCount = new ResearchService().reviewListCount(sitterNo);
		int maxPage = (int)Math.ceil((double)listCount / 3);
		
		
		request.setAttribute("rwList", rwList);	
		request.setAttribute("sitterPic", sitterPic);	
		request.setAttribute("sitterInfo", sitterInfo);	
		request.setAttribute("maxPage", maxPage);
		request.getRequestDispatcher("views/research/searchPetsitterDetail.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
