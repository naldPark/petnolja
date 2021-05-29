package com.petnolja.pet.model.service;

import static com.petnolja.common.JDBCTemplate.*;

import java.sql.Connection;

import com.petnolja.pet.model.dao.PetDao;
import com.petnolja.pet.model.vo.Pet;

public class PetService {
	
	public int insertPet(Pet p) {
		Connection conn = getConnection();
		int result = new PetDao().insertPet(conn, p);
		System.out.println(result);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}
	
}
