package com.petnolja.research.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petnolja.petsitter.model.vo.Sitter;
import com.petnolja.research.model.service.ResearchService;
import com.petnolja.research.model.vo.Review;


/**
 * Servlet implementation class IndexController
 */
@WebServlet("/index.mem")
public class IndexController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IndexController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Sitter> sitterList = new ResearchService().indexSitterList();
		ArrayList<Review> reviewList = new ResearchService().indexReviewList();
		
		request.getSession().setAttribute("sitterList", sitterList);
		request.getSession().setAttribute("reviewList", reviewList);
		response.sendRedirect(request.getContextPath());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
