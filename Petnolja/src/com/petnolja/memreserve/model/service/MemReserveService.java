package com.petnolja.memreserve.model.service;
import static com.petnolja.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.petnolja.memreserve.model.dao.MemReserveDao;
import com.petnolja.memreserve.model.vo.MemReserve;
import com.petnolja.memreserve.model.vo.ReserveContent;

public class MemReserveService {
	
	
	public ArrayList<MemReserve> reserveList(int userNo, String startDate, String endDate) {
		Connection conn = getConnection();
		ArrayList<MemReserve> list = new MemReserveDao().reserveList(conn, userNo, startDate, endDate);
		
		close(conn);
		return list;
		
		
	}
	
	public ArrayList<ReserveContent> reserveProceed(int sitterNo, String petList, String careDay, String startDate, String endDate) {
		Connection conn = getConnection();
		ArrayList<ReserveContent> list = new MemReserveDao().reserveProceed(conn, sitterNo, petList, careDay, startDate, endDate);
		close(conn);
		
		return list;
	}

}
