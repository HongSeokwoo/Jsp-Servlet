package com.studt.jsp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BDao {

	private static BDao instance = new BDao();
	DataSource dataSource;
	
	int listCount = 10;			// 한 페이지당 보여줄 게시물의 갯수
	int pageCount = 10;			// 하단에 보여줄 페이지 리스트의 갯수
	public BDao() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static BDao getInstane() {
		return instance;
	}
	public void write(String bName, String bTitle, String bContent) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = dataSource.getConnection();
			String query = "insert into mvc_board " +
						   " (bId, bName, bTitle, bContent, bHit, bGroup, bStep, bIndent) " +
						   " values " +
						   " (mvc_board_seq.nextval, ?, ?, ?, 0, mvc_board_seq.currval, 0 ,0 )";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, bName);
			pstmt.setString(2, bTitle);
			pstmt.setString(3, bContent);
			int rn = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) pstmt.close();
				if (con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	public ArrayList<BDto> list(int curPage) {
		
		ArrayList<BDto> dtos = new ArrayList<BDto>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet resultSet = null;
		
		int nStart = (curPage - 1) * listCount + 1;
		int nEnd = (curPage - 1) * listCount + listCount;
		
		try {
			con = dataSource.getConnection();
			
			String query = "select * " +
						   " from ( " +
						   "   select rownum num, A.*" +
						   "  	from ( " +
						   " 	   select * " + 
						   "   		 from mvc_board " +
						   " 	   order by bgroup desc, bstep asc ) A " +
						   "  	  where rownum <= ? ) B " +
						   "where B.num >= ? ";
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, nEnd);
			pstmt.setInt(2, nStart);
			resultSet = pstmt.executeQuery();
			
			while (resultSet.next()) {
				int bId = resultSet.getInt("bId");
				String bName = resultSet.getString("bName");
			}
						   
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		
	}
}
