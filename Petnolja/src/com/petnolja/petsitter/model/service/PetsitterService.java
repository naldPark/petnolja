package com.petnolja.petsitter.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.petnolja.petsitter.model.dao.PetsitterDao;
import com.petnolja.petsitter.model.vo.Petsitter;
import static com.petnolja.common.JDBCTemplate.*;

public class PetsitterService {

	
	public ArrayList<Petsitter> selectPetsitterList(){
		
		Connection conn = getConnection();
		ArrayList<Petsitter> list = new PetsitterDao().selectPetsitterList(conn);
		
		close(conn);
		return list;
		
	}
}
