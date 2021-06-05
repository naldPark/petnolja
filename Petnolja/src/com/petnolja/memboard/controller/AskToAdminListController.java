package com.petnolja.memboard.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.petnolja.common.model.vo.PageInfo;
import com.petnolja.member.model.vo.Member;
import com.petnolja.memboard.model.service.MemBoardService;
import com.petnolja.qna.model.vo.Qna;

/**
 * Servlet implementation class MemNoticeController
 */
@WebServlet("/askToAdminList.mem")
public class AskToAdminListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AskToAdminListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getMemNo();	
		
		// 페이지수를 계산하기 위해 service로 보냄
   		int listCount = new MemBoardService().askToAdminListCount(userNo);
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
		
		ArrayList<Qna> list = new MemBoardService().askToAdminList(pi, userNo);
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		System.out.println(pi);
		System.out.println(list);
		request.getRequestDispatcher("views/memboard/askToAdminList.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
