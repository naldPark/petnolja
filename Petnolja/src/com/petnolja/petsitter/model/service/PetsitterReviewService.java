package com.petnolja.petsitter.model.service;
import static com.petnolja.common.JDBCTemplate.close;
import static com.petnolja.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.petnolja.petsitter.model.dao.PetsitterReviewDao;
import com.petnolja.petsitter.model.vo.PetsitterReview;

public class PetsitterReviewService {

	public ArrayList<PetsitterReview> selectReview(int sitterNo){
		Connection conn = getConnection();
		ArrayList<PetsitterReview> list = new PetsitterReviewDao().selectReview(conn, sitterNo);
		
		close(conn);
		return list;
	}
}
	

