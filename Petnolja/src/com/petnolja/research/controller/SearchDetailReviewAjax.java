package com.petnolja.research.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.petnolja.common.model.vo.PageInfo;
import com.petnolja.pet.model.vo.Pet;
import com.petnolja.research.model.service.ResearchService;
import com.petnolja.research.model.vo.Review;

/**
 * Servlet implementation class SearchDetailReviewAjax
 */
@WebServlet("/moreReview.mem")
public class SearchDetailReviewAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchDetailReviewAjax() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int sitterNo = Integer.parseInt(request.getParameter("sitterNo"));
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		int startRow = currentPage==1 ?  1 : (currentPage*3)+1;	 
		int endRow = startRow+2;		
		
		// 하단의 리뷰리스트를 가져온다
		ArrayList<Review> rwList = new ResearchService().sitterReviewAjax(sitterNo, startRow, endRow);
		
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(rwList, response.getWriter());

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
