package com.petnolja.petsitter.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.petnolja.common.model.vo.PageInfo;
import com.petnolja.petsitter.model.dao.PetsitterDao;
import com.petnolja.petsitter.model.vo.Petsitter;
import static com.petnolja.common.JDBCTemplate.*;

public class PetsitterService {

	public int selectOldListCount() {
		
		Connection conn = getConnection();
		int listCount = new PetsitterDao().selectOldListCount(conn);
		
		close(conn);
		return listCount;
		
	}
	
	public int selectNewListCount() {
		
		Connection conn = getConnection();
		int listCount = new PetsitterDao().selectNewListCount(conn);
		
		close(conn);
		return listCount;
		
	}
	
	public ArrayList<Petsitter> selectOldPetsitterList(PageInfo pi){
		
		Connection conn = getConnection();
		ArrayList<Petsitter> list = new PetsitterDao().selectOldPetsitterList(conn, pi);
		
		close(conn);
		return list;
		
	}
	
	public ArrayList<Petsitter> selectNewPetsitterList(PageInfo pi){
		
		Connection conn = getConnection();
		ArrayList<Petsitter> list = new PetsitterDao().selectNewPetsitterList(conn, pi);
		
		close(conn);
		return list;
	}
	
	public Petsitter selectNewPetsitter(int sitterNo) {
		Connection conn = getConnection();
		Petsitter p = new PetsitterDao().selectNewPetsitter(conn, sitterNo);
		close(conn);
		return p;		
	}
	
}
