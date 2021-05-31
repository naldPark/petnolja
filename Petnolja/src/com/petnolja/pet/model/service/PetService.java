package com.petnolja.pet.model.service;

import static com.petnolja.common.JDBCTemplate.*;
import java.sql.Connection;
import java.util.ArrayList;
import com.petnolja.pet.model.dao.PetDao;
import com.petnolja.pet.model.vo.Pet;

public class PetService {
	
	public int insertPet(Pet p) {
		Connection conn = getConnection();
		int result = new PetDao().insertPet(conn, p);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
		
	}
	
	public ArrayList<Pet> petList(int userNo){
		Connection conn = getConnection();
		ArrayList<Pet> result = new PetDao().petList(conn, userNo);
		
		close(conn);
		return result;
	}

	
	
	
}
