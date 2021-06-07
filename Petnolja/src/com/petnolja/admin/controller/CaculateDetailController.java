package com.petnolja.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petnolja.admin.model.service.AdminService;
import com.petnolja.admin.model.vo.Admin;
import com.petnolja.admin.model.vo.Calculate;
import com.petnolja.common.model.vo.PageInfo;

/**
 * Servlet implementation class CaculateDetailController
 */
@WebServlet("/calculateDetail.ad")	// 추후 수정
public class CaculateDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CaculateDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Admin loginAdmin = (Admin)request.getSession().getAttribute("loginAdmin");
		
		if(loginAdmin == null) {
			
			request/*.getSession()*/.setAttribute("errorMsg", "접근이 불가능합니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			
		} else {
			
			String sid = request.getParameter("sid");	
			int month = Integer.parseInt(request.getParameter("month")); // 추후 추가해줘야함
			int year = Integer.parseInt(request.getParameter("year")); // 추후 추가해줘야함
			
			int CNFListCount; 	// CONF 총 갯수 
			int CNCListCount;	// CANC 총 갯수
			int currentPage;	// 현재 페이지 (즉, 사용자가 요청한 페이지)
			int pageLimit;		// 페이지 하단에 보여질 페이징바의 페이지 최대갯수 (몇개 단위씩)
			int boardLimit;		// 한 페이지내에 보여질 게시글 최대갯수 (몇개 단위씩)
			
			int CNFmaxPage;		// CNF 가장 마지막 페이지 (총 페이지 수)
			int CNCmaxPage;		// CNC 가장 마지막 페이지 (총 페이지 수)
			int maxPage;
			int startPage;		
			int CNFendPage;		
			int CNCendPage;
			int endPage;
			
			CNFListCount = new AdminService().CNFcalculateDetailCount(sid, month, year);
			CNCListCount = new AdminService().CNCcalculateDetailCount(sid, month, year);
			
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
			
			pageLimit = 5;
			boardLimit = 10;
			
			CNFmaxPage = (int)Math.ceil((double)CNFListCount / boardLimit);
			CNCmaxPage = (int)Math.ceil((double)CNCListCount / boardLimit);
			maxPage = (int)Math.ceil((double)(CNFListCount + CNCListCount) / boardLimit);
			
			startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
			
			CNFendPage = startPage + pageLimit - 1;
			CNCendPage = startPage + pageLimit - 1;
			endPage = startPage + pageLimit - 1;
			
			if(CNFendPage > CNFmaxPage) {
				CNFendPage = CNFmaxPage;
			}
			
			if(CNCendPage > CNCmaxPage) {
				CNCendPage = CNCmaxPage;
			}
			
			if(endPage > maxPage) {
				endPage = maxPage;
			}
			
			PageInfo CNFpi = new PageInfo(CNFListCount, currentPage, pageLimit, boardLimit, CNFmaxPage, startPage, CNFendPage);
			PageInfo CNCpi = new PageInfo(CNCListCount, currentPage, pageLimit, boardLimit, CNCmaxPage, startPage, CNCendPage);
			PageInfo pi = new PageInfo(CNFListCount+CNCListCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
			
			ArrayList<Calculate> CNFlist = new AdminService().CNFselectCalculateDetail(CNFpi, sid, month, year);
			ArrayList<Calculate> CNClist = new AdminService().CNCselectCalculateDetail(CNCpi, sid, month, year);
			
			
			request.setAttribute("CNFlist", CNFlist);
			request.setAttribute("CNClist", CNClist);
			request.setAttribute("pi", pi);
			request.setAttribute("sid", sid);
			request.setAttribute("year", year);
			request.setAttribute("month", month);
			
			request.getRequestDispatcher("views/admin/calculateDetailView.jsp").forward(request, response);	
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
