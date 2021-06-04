package com.petnolja.pet.model.service;

import static com.petnolja.common.JDBCTemplate.*;
import java.sql.Connection;
import java.util.ArrayList;

import com.petnolja.common.model.vo.PageInfo;
import com.petnolja.pet.model.dao.PetDao;
import com.petnolja.pet.model.vo.Pet;
import com.petnolja.pet.model.vo.PetLogList;

public class PetService {
   
   /**
    * 펫추가
    */
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

   
   /** 최서경
    * 특정 회원의 펫 목록 조회
    */
   public ArrayList<Pet> selectPetList(int memNo){
      
      Connection conn = getConnection();
      
      ArrayList<Pet> petList = new PetDao().selectPetList(conn, memNo);
      
      close(conn);
      return petList;
   }
   
   /** 최서경
    * 회원의 펫 목록 -> 클릭하여 펫 상세정보 조회
    */
   public Pet selectAdminPetDetail(int petNo) {
      Connection conn = getConnection();
      
      Pet p = new PetDao().selectAdminPetDetail(conn, petNo);
      
      close(conn);
      return p;
   }
   
   public ArrayList<Pet> petList(int userNo){
      Connection conn = getConnection();
      ArrayList<Pet> result = new PetDao().petList(conn, userNo);
      
      close(conn);
      return result;
   }
   
   public Pet selectPet(int petNo){
      Connection conn = getConnection();
      Pet p = new PetDao().selectPet(conn, petNo);
      close(conn);
      return p;
   }

   /** 최서경
    * 회원의 펫 목록 -> 펫정보 삭제
    */
   public int adminDeletePet(String[] petList) {
      Connection conn = getConnection();
      int result = new PetDao().adminDeletePet(conn, petList);
      
      if(result == petList.length) {
         commit(conn);
      } else {
         rollback(conn);
      }
      
      close(conn);
      return result;
   }
   
   /** 박정빈
    * 펫 정보 수정 관련
    */
   public int updatePet(Pet p) {
         Connection conn = getConnection();
         int result = new PetDao().updatePet(conn, p);

         
         if(result > 0) {
            commit(conn);
         }else {
            rollback(conn);
         }
         
         close(conn);
         return result;
      }
   
   public int deletePet(int petNo, String petImg) {
      Connection conn = getConnection();
      int result = new PetDao().deletePet(conn, petNo, petImg);
      
      close(conn);
      return result;
   }
   
   
   /** 박정빈
    *  회원이 펫시터 예약리스트를 조회할때 목록 갯수 뽑기
    */
   public int dailyLogCount(int memNo, String startDate, String endDate) {
	   Connection conn = getConnection();
	   int listCount = new PetDao().dailyLogCount(conn, memNo, startDate, endDate);
	   close(conn);
	   return listCount;
   }
   
   
   /** 박정빈
    * 펫 일지 보기 관련 
    */
   public ArrayList<PetLogList> dailyLog(int memNo, String startDate, String endDate, PageInfo pi){
      Connection conn = getConnection();
      ArrayList<PetLogList> list = new PetDao().dailyLog(conn, memNo, startDate, endDate, pi);
      close(conn);
      return list;
      
      
   }
   
  
   
   
   
}
   

	

