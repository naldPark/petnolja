package com.petnolja.petsitter.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petnolja.petsitter.model.service.PetsitterService;
import com.petnolja.petsitter.model.vo.Petsitter;

/**
 * Servlet implementation class OldListController
 */
@WebServlet("/oldlist.ad")
public class OldListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OldListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<Petsitter> list = new PetsitterService().selectPetsitterList();
		
		// 기존 펫시터 페이지 (oldPetsitterListView.jsp) 보여줌
		request.setAttribute("list", list);
		request.getRequestDispatcher("views/admin/oldPetsitterListView.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
