package com.petnolja.pet.model.dao;

import static com.petnolja.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.petnolja.pet.model.vo.Pet;

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
	
	public int insertPet(Connection conn, Pet p) {
		// insert문
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertPet");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, p.getMemNo());
			pstmt.setString(2, p.getPetName());
			pstmt.setString(3, p.getPetGender());
			pstmt.setString(4, p.getPetBreed());
			pstmt.setString(5, p.getPetBirth());
			pstmt.setDouble(6, p.getPetWeight());
			pstmt.setString(7, p.getNeutered());
			pstmt.setString(8, p.getPetSize());
			pstmt.setString(9, p.getChip());
			pstmt.setString(10, p.getVaccine());
			pstmt.setString(11, p.getCaution());
			pstmt.setString(12, p.getNote());
			pstmt.setString(13, p.getHospi());
			pstmt.setString(14, p.getHospiTel());
			pstmt.setString(15, p.getPetImg());
			
			result = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public Pet selectPet(Connection conn, int petNo){
		// select문 => ResultSet (여러행)
		Pet p = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectPet");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, petNo);
			
			rset = pstmt.executeQuery();
			
		if(rset.next()) {
			p = new Pet(rset.getInt("pet_No"),
						rset.getString("pet_Name"),
						rset.getString("pet_Birth"),
						rset.getDouble("pet_Weight"),
						rset.getString("pet_Gender"),
						rset.getString("pet_Breed"),
						rset.getString("pet_Img"),
						rset.getString("vaccine"),
						rset.getString("caution"),
						rset.getString("note"),
						rset.getString("hospi"),
						rset.getString("hospi_Tel"),
					    rset.getString("neutered"),
						rset.getString("chip"));
		}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return p;
	}
	
	public ArrayList<Pet> petList(Connection conn, int userNo) {
		ArrayList<Pet> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("petList");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				list.add(new Pet(
					rset.getInt("pet_no"),
					rset.getString("pet_name"),			
					rset.getString("pet_birth"),
					rset.getDouble("pet_weight"),
					rset.getString("pet_gender"),
					rset.getString("pet_size"),
					rset.getString("pet_breed"),
					rset.getString("pet_img")
						));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}
}
