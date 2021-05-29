package com.petnolja.memreserve.service;
import static com.petnolja.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.petnolja.memreserve.dao.MemReserveDao;
import com.petnolja.memreserve.vo.MemReserve;

public class MemReserveService {
	
	
	public ArrayList<MemReserve> reserveList(int userNo, String startDate, String endDate) {
		Connection conn = getConnection();
		ArrayList<MemReserve> list = new MemReserveDao().reserveList(conn, userNo, startDate, endDate);
		
		close(conn);
		return list;
		
		
	}

}
