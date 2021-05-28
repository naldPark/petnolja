package com.petnolja.member.controller;

import java.io.IOException;
import java.util.ArrayList;
import com.petnolja.member.model.vo.Member;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petnolja.common.model.vo.PageInfo;
import com.petnolja.member.model.service.MemberService;
import com.petnolja.petsitter.model.vo.Sitter;

/**
 * Servlet implementation class FavoriteListController
 */
@WebServlet("/favoriteList.mem")
public class FavoriteListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FavoriteListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @nald favoriteList.jsp에서 조회할때 쓰이는 서블릿입니다
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getMemNo();

		int listCount = new MemberService().favoriteListCount(userNo);
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		int pageLimit = 10;
		int boardLimit = 3;
		int maxPage = (int)Math.ceil((double)listCount / boardLimit);	
		int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;		 
		int endPage = startPage + pageLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}

		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		
		// 시터번호,시터제목,시터이름,시터메인사진경로
		ArrayList<Sitter> list = new MemberService().favoriteList(pi, userNo);
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("views/member/favoriteList.jsp").forward(request, response);	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
