package project.web.movie;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class LocalDAO {
	private Connection conn=null;
	private PreparedStatement pstmt=null;
	private ResultSet rs= null;
	private Connection getConnection() throws Exception{
		Context ctx= new InitialContext(); 
		Context env= (Context)ctx.lookup("java:comp/env");			
		DataSource ds= (DataSource)env.lookup("jdbc/xe");	

		return ds.getConnection();
	}
	public ArrayList<LocalVO> selectAll(){
		ArrayList<LocalVO> list = new ArrayList<>();
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from localtable order by l_id");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				LocalVO vo = new LocalVO();
				vo.setL_id(rs.getInt("l_id"));
				vo.setL_name(rs.getString("l_name"));
				list.add(vo);
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {} 
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return list;
	}
	public LocalVO getLocal(String id) {
		LocalVO vo = new LocalVO();
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from localtable where l_id=?");
			pstmt.setInt(1, Integer.parseInt(id));
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo.setL_id(rs.getInt("l_id"));
				vo.setL_name(rs.getString("l_name"));
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {} 
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return vo;
	}
}