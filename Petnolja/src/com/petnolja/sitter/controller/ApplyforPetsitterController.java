package com.petnolja.sitter.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.petnolja.member.model.vo.Member;
import com.petnolja.petsitter.model.vo.Petsitter;
import com.petnolja.sitter.model.service.SitterService;

/**
 * Servlet implementation class ApplyforPetsitterController
 */
@WebServlet("/applySitterInsert.mem")
public class ApplyforPetsitterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ApplyforPetsitterController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		if(request.getSession().getAttribute("loginUser") == null) {
			
			request.getSession().setAttribute("alertMsg", "로그인 후 이용가능한 서비스입니다.");
			response.sendRedirect(request.getContextPath());
			
		} else if(((Member)request.getSession().getAttribute("loginUser")).getAuthSitter()!=null){
			request.getSession().setAttribute("alertMsg", "이미 신청하셨습니다");
			response.sendRedirect(request.getContextPath());
		
		} else { 
			
			int userNo = ((Member)request.getSession().getAttribute("loginUser")).getMemNo(); // 회원번호
			String raisePet = request.getParameter("raisePet");
			String currentPet = request.getParameter("currentPet");
			String petCertificate = request.getParameter("petCertificate");
			String caringPet = request.getParameter("caringPet");
			String motive = request.getParameter("motive");
			String addContent = request.getParameter("addContent");
			
			Petsitter s = new Petsitter();
			s.setSitterNo(userNo);
			s.setPetPeriod(raisePet);
			s.setPetNo(currentPet);
			s.setLicense(petCertificate);
			s.setExperience(caringPet);
			s.setMotive(motive);
			s.setAddContent(addContent);
			
			int result = new SitterService().applySitterInsert(s);
			
			if(result > 0) {
				HttpSession session = request.getSession();
				session.setAttribute("alertMsg", "신청이 완료되었습니다. 관리자 승인 후 이용가능합니다");		
				response.sendRedirect(request.getContextPath());
			} else {
				request.setAttribute("errorMsg", "펫시터 지원에 실패했습니다.");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
			
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
