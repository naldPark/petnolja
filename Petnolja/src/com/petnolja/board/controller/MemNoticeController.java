package com.petnolja.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petnolja.board.model.service.MemNoticeService;
import com.petnolja.board.model.vo.MemNotice;
import com.petnolja.common.model.vo.PageInfo;

/**
 * Servlet implementation class MemNoticeController
 */
@WebServlet("/memNotice.me")
public class MemNoticeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemNoticeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 페이지수를 계산하기 위해 service로 보냄
   		int listCount = new MemNoticeService().memNoticeCount();
   		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
   		int pageLimit = 10;
   		int boardLimit = 10;
   		int maxPage = (int)Math.ceil((double)listCount / boardLimit);	
   		int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;		 
   		int endPage = startPage + pageLimit - 1;
   		
   		if(endPage > maxPage) {
   			endPage = maxPage;
   		}
		
   		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		ArrayList<MemNotice> list = new MemNoticeService().selectMemNoticeList(pi);
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		request.getRequestDispatcher("views/board/memnotice.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
