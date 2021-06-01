package com.petnolja.research.model.service;

import static com.petnolja.common.JDBCTemplate.*;
import java.sql.Connection;
import java.util.ArrayList;
import com.petnolja.common.model.vo.PageInfo;
import com.petnolja.member.model.vo.Member;
import com.petnolja.pet.model.vo.Pet;
import com.petnolja.petsitter.model.vo.Sitter;
import com.petnolja.research.model.dao.ResearchDao;
import com.petnolja.research.model.vo.Research;
import com.petnolja.research.model.vo.Review;

public class ResearchService {
	
	// 메인페이지에서 노출될 항목 조회
	public ArrayList<Sitter> indexSitterList(){
		Connection conn = getConnection();
		ArrayList<Sitter> sitterList = new ResearchDao().indexSitterList(conn);
		
		close(conn);
		
		return sitterList;
		
	}
	
	// 메인페이지에서 노출될 항목 조회
	public ArrayList<Review> indexReviewList(){
		Connection conn = getConnection();
	    ArrayList<Review> reviewList = new ResearchDao().indexReviewList(conn);
		
		close(conn);
		
		return reviewList;
		
	}
	
	//검색시 보여줄 시터리스트의 총 갯수
	public int searchListCount(String startDate, String endDate, String[] options) {
		Connection conn = getConnection();
		int result=new ResearchDao().searchListCount(conn, startDate, endDate, options);
		
		close(conn);
		
		return result;
	}
	
	//검색시 보여줄 시터리스트
	public ArrayList<Research> searchSitter(Member m, String startDate, String endDate, String[] options, PageInfo pi, String array) {
		Connection conn = getConnection();
		
		ArrayList<Research> list = new ResearchDao().searchSitter(conn, m, startDate, endDate, options, pi, array);
		
		close(conn);
	
		return list;
		
	}
	
	//searchPetsitterDetail.jsp에 보여줄 화면 구성
	public Research searchSitterDetail(int sitterNo, int memNo) {
		Connection conn = getConnection();
		
		Research sitterInfo = new ResearchDao().searchSitterDetail(conn, sitterNo, memNo);

		close(conn);
		
		return sitterInfo;
	}
	
	//searchPetsitterDetail.jsp에서 특정 펫시터를 검색한 유저와 펫의 정보
	public ArrayList<Pet> memPetInfo(int sitterNo, int userNo) {
		Connection conn = getConnection();
		
		ArrayList<Pet> petList = new ResearchDao().memPetInfo(conn, sitterNo, userNo);
		
		
		close(conn);
		
		return petList;
		
	}

	
	//searchPetsitterDetail.jsp에서 특정 펫시터의 리뷰 갯수
	public int reviewListCount(int sitterNo) {
		Connection conn = getConnection();
		int result = new ResearchDao().reviewListCount(conn, sitterNo);
		
		close(conn);
		
		return result;
	}
	
	//searchPetsitterDetail.jsp에서 특정 펫시터의 리뷰정보
		public ArrayList<Review> sitterReview(int sitterNo, String array) {
			Connection conn = getConnection();
			
			ArrayList<Review> sitterReview = new ResearchDao().sitterReview(conn, sitterNo, array);

			close(conn);
			
			return sitterReview;
			
		}
		
		//searchPetsitterDetail.jsp에서 특정 펫시터의 리뷰정보(ajax)
		public ArrayList<Review> sitterReviewAjax(int sitterNo, int startRow, int endRow, String array) {
			Connection conn = getConnection();
			
			ArrayList<Review> sitterReview = new ResearchDao().sitterReviewAjax(conn, sitterNo, startRow, endRow, array);

			close(conn);
			
			return sitterReview;
			
		}
	
	
	

}
