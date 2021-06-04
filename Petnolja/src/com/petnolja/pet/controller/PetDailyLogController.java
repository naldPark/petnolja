package com.petnolja.pet.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petnolja.member.model.vo.Member;
import com.petnolja.pet.model.service.PetService;
import com.petnolja.pet.model.vo.PetLogList;

/**
 * Servlet implementation class PetDailyLogController
 */
@WebServlet("/dailyLogList.me")
public class PetDailyLogController extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PetDailyLogController() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
      int loginUser = ((Member)request.getSession().getAttribute("loginUser")).getMemNo();
      String startDate = "1900-01-01";
      String endDate = "2999-12-31";
         
      if(request.getParameter("startDate")!=null&&!request.getParameter("startDate").equals("")) {
      startDate = request.getParameter("startDate");
      request.setAttribute("startDate", startDate);}
      
      if(request.getParameter("endDate")!=null&&!request.getParameter("endDate").equals("")) {
      endDate = request.getParameter("endDate");
      request.setAttribute("endDate", endDate);}
      
      ArrayList<PetLogList> dailyLog = new PetService().dailyLog(loginUser, startDate, endDate);
      request.setAttribute("dailyLog", dailyLog);
      request.getRequestDispatcher("views/pet/dailyLog.jsp").forward(request, response);
      
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(request, response);
   }

}