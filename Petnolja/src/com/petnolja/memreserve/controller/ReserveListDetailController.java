package com.petnolja.memreserve.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petnolja.memreserve.model.service.MemReserveService;
import com.petnolja.memreserve.model.vo.MemReserve;
import com.petnolja.pet.model.vo.Pet;

/**
 * Servlet implementation class ReserveListDetailController
 */
@WebServlet("/reservListDetail.mem")
public class ReserveListDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReserveListDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		long reserveNo = Long.parseLong(request.getParameter("rno"));
		MemReserve mr =  new MemReserveService().reserveListDetail(reserveNo);
		ArrayList<Pet> plist = new MemReserveService().reserveListDetailPet(reserveNo);
		
		request.setAttribute("info", mr);
		request.setAttribute("plist", plist);
		request.getRequestDispatcher("views/memreserve/reserveListDetail.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
