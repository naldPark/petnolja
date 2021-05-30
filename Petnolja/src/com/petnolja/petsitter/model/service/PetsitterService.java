package com.petnolja.petsitter.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.petnolja.common.model.vo.PageInfo;
import com.petnolja.petsitter.model.dao.PetsitterDao;
import com.petnolja.petsitter.model.vo.Petsitter;
import static com.petnolja.common.JDBCTemplate.*;

public class PetsitterService {

	// 기존 펫시터 리스트 카운트
	public int selectOldListCount() {
		
		Connection conn = getConnection();
		int listCount = new PetsitterDao().selectOldListCount(conn);
		
		close(conn);
		return listCount;
		
	}
	
	// 새로운 펫시터 리스트 카운트
	public int selectNewListCount() {
		
		Connection conn = getConnection();
		int listCount = new PetsitterDao().selectNewListCount(conn);
		
		close(conn);
		return listCount;
		
	}
	
	// 기존 펫시터 리스트
	public ArrayList<Petsitter> selectOldPetsitterList(PageInfo pi){
		
		Connection conn = getConnection();
		ArrayList<Petsitter> list = new PetsitterDao().selectOldPetsitterList(conn, pi);
		
		close(conn);
		return list;
		
	}
	
	// 새로운 펫시터 리스트
	public ArrayList<Petsitter> selectNewPetsitterList(PageInfo pi){
		
		Connection conn = getConnection();
		ArrayList<Petsitter> list = new PetsitterDao().selectNewPetsitterList(conn, pi);
		
		close(conn);
		return list;
	}
	
	// 지원서 상세내용
	public Petsitter selectNewPetsitter(int sitterNo) {
		Connection conn = getConnection();
		Petsitter p = new PetsitterDao().selectNewPetsitter(conn, sitterNo);
		close(conn);
		return p;		
	}
	
	
	//기존 펫시터 삭제
	public int[] deleteOldPetsitter(String[] petsitterNo) {
		Connection conn = getConnection();
		int[] result = new PetsitterDao().deleteOldPetsitter(conn, petsitterNo);
		
		
		for(int i=0; i<petsitterNo.length; i++) {
			if(result[i] < 0) {
				rollback(conn);
				close(conn);
				return result;
			}
		}
		
		commit(conn);
		
		close(conn);
		
		return result;
	}
}
