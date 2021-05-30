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
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int userNo=-1;
		int sitterNo = Integer.parseInt(request.getParameter("sno"));
		
		if(request.getSession().getAttribute("loginUser") != null) {
		userNo = ((Member)request.getSession().getAttribute("loginUser")).getMemNo();	
		}
		
		Research sitterInfo = new ResearchService().searchSitterDetail(sitterNo, userNo);
		for (int i = sitterInfo.getPath().split(",").length; i < 4; i++) {
			sitterInfo.setPath(sitterInfo.getPath()+",resources/images/member/welcome.png");
		}		
		
		String[] sitterPic = sitterInfo.getPath().split(",");
		
		if(userNo != -1) {
		ArrayList<Pet> petList = new ResearchService().memPetInfo(sitterNo, userNo);
		request.setAttribute("petList", petList);
		}
		
		Review sitterReview = new ResearchService().sitterReview(sitterNo);
		
		request.setAttribute("sitterPic", sitterPic);	
		request.setAttribute("sitterInfo", sitterInfo);	
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
