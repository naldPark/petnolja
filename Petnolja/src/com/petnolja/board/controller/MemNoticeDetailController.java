package com.petnolja.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petnolja.board.model.service.MemNoticeService;
import com.petnolja.board.model.vo.MemNotice;


/**
 * Servlet implementation class MemNoticeDetailController
 */
@WebServlet("/memdetail.me")
public class MemNoticeDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemNoticeDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 클릭했을때 공지사항 글 번호
		int MemnoticeNo = Integer.parseInt(request.getParameter("nno"));
		
		// 조회수 증가용 서비스 호출
		int result = new MemNoticeService().increaseCount(MemnoticeNo);
		
		if(result > 0) { // 성공
			
			MemNotice n = new MemNoticeService().selectMemNotice(MemnoticeNo);
			request.setAttribute("n", n);
			request.getRequestDispatcher("views/board/memnoticeDetail.jsp").forward(request, response);
			
		}else { // 실패
			request.setAttribute("errorMsg", "회원정보 수정에 실패했습니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
