package com.petnolja.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petnolja.common.model.vo.PageInfo;
import com.petnolja.member.model.service.MemberService;
import com.petnolja.member.model.vo.Member;

/**
 * Servlet implementation class MemberListController
 */
@WebServlet("/memlist.ad")
public class MemberListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// ---------------- 페이징 처리 --------------------
		int listCount; 		// 현재 총 게시글 갯수
		int currentPage; 	// 현재 페이지(즉, 사용자가 요청한 페이지)
		int pageLimit;		// 페이지 하단에 보여질 페이징바의 페이지 최대기수 (몇개 단위씩)
		int boardLimit;		// 한 페이지내에 보여질 게시글 최대개수 (몇개 단위씩)
		
		int maxPage;		// 가장 마지막 페이지(총 페이지 수)
		int startPage;		// 페이지 하단에 보여질 페이징바의 시작수
		int endPage;		// 페이지 하단에 보여질 페이징바의 끝수
		
		// * listCount : 총 게시글 개수
		listCount = new MemberService().selectListCount();
		
		//System.out.println(listCount);
	
		// * currentPage : 현재페이지(즉, 사용자가 요청한 페이지)
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		// * pageLimit : 하단에 보여질 페이징바의 페시지 최대 게수 (페이지 목록들 몇 개 단위)
		pageLimit = 5;
		
		// * boardLimit : 한 페이지 내에 보여질 게시글 최대 개수(게시글 몇 개 단위)
		boardLimit = 10;
		
		// * maxPage : 제일 마지막 페이지수 (총 페이지 수)

		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		
		// * startPage : 페이지 하단에 보여질 페이징 바의 시작 수

		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		
		// * endPage : 페이지 하단에 보여질 페이징바의 끝 수
		
		endPage = startPage + pageLimit - 1;
		
		// startPage가 11이어서 endPage 20으로 됨	(근데 maxPage가 고작 13까지밖에 안된다면?)
		// => endPage를 maxPage로 변경
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		// 페이지 정보들을 하나의 공간에 담아서 보내자!!!
		// 1. 페이징 바 만들 때 필요한 객체
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		ArrayList<Member> list = new MemberService().selectList(pi);
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("views/admin/memberListView.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
