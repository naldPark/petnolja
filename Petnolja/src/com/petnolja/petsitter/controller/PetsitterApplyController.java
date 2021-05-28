package com.petnolja.petsitter.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petnolja.petsitter.model.service.PetsitterService;
import com.petnolja.petsitter.model.vo.Petsitter;

/**
 * Servlet implementation class PetsitterApplyController
 */
@WebServlet("/petsitterApply.ad")
public class PetsitterApplyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PetsitterApplyController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int sitterNo = Integer.parseInt(request.getParameter("sno"));
								
		Petsitter p = new PetsitterService().selectNewPetsitter(sitterNo);
		request.setAttribute("p", p);
		request.getRequestDispatcher("views/admin/petsitterApply.jsp").forward(request, response);
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
