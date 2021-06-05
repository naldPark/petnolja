package com.petnolja.petsitter.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petnolja.petsitter.model.service.PetsitterService;

/**
 * Servlet implementation class selectHistController
 */
@WebServlet("/hist.sit")
public class selectHistController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public selectHistController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int listCount; 		// 현재 총 게시글 갯수 
		int currentPage;	// 현재 페이지 (즉, 사용자가 요청한 페이지)
		int pageLimit;		// 페이지 하단에 보여질 페이징바의 페이지 최대갯수 (몇개 단위씩)
		int boardLimit;		// 한 페이지내에 보여질 게시글 최대갯수 (몇개 단위씩)
		
		int maxPage;		// 가장 마지막 페이지 (총 페이지 수)
		int startPage;		// 페이지 하단에 보여질 페이징바의 시작수 
		int endPage;		// 페이지 하단에 보여질 페이징바의 끝수
		
		listCount = new PetsitterService().selectListCount();
		
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		// * pageLimit : 하단에 보여질 페이징바의 페이지 최대 갯수 (페이지 목록들 몇 개 단위)
		pageLimit = 10;
		
		// * boardLimit : 한 페이지내에 보여질 게시글 최대 갯수 (게시글 몇 개 단위)
		boardLimit = 10;
		
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		
		endPage = startPage + pageLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}