package com.petnolja.petsitter.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.petnolja.member.model.vo.Member;
import com.petnolja.petsitter.model.service.PetsitterService;

/**
 * Servlet implementation class InsertSitServicecontroller
 */
@WebServlet("/insertSitService.sit")
public class InsertSitServicecontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertSitServicecontroller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); 
		
		HttpSession session = request.getSession();
		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getMemNo();
		String checkbox = "";
		
		if(request.getParameterValues("addServ")!=null) {
			checkbox = String.join(",", request.getParameterValues("addServ"));
		}
		
		int result = new PetsitterService().addService(userNo ,checkbox);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg","서비스가 등록 되었습니다.");
			response.sendRedirect(request.getContextPath());
		
		}else {
			request.setAttribute("errorMsg", "서비스 등록 실패.");
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
