package com.petnolja.petsitter.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petnolja.petsitter.model.service.PetsitterService;

/**
 * Servlet implementation class OldListDeleteController
 */
@WebServlet("/oldlistDelete.ad")
public class OldListDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OldListDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Boolean success = true;
		
		String petsitterNo[] = request.getParameterValues("chk");
		
		int[] result = new PetsitterService().deleteOldPetsitter(petsitterNo);
	
		for(int i=0; i<petsitterNo.length; i++) {
			if(result[i] <= 0) {
				success = false;
				request.setAttribute("errorMsg", "삭제 실패");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);			
			}
		}
		
		if(success == true)
			response.sendRedirect(request.getContextPath() + "/oldlist.ad?currentPage=1");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
