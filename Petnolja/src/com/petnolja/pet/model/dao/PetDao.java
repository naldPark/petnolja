package com.petnolja.pet.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

public class PetDao {
	
	private Properties prop = new Properties();
	
	public PetDao() {
		
		String fileName = PetDao.class.getResource("/sql/pet/pet-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
}
