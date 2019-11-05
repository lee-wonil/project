package project.web.movie;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ScoreDAO {
	private Connection conn=null;
	private PreparedStatement pstmt=null;
	private ResultSet rs=null;
	
	private Connection getConnection() throws Exception {
		Context ctx= new InitialContext();
		Context env=(Context)ctx.lookup("java:comp/env");
		DataSource ds=(DataSource)env.lookup("jdbc/xe");
		return ds.getConnection();
	}
	
	public void insert(ScoreVO vo) {
		try {
			conn=getConnection();
			String sql="insert into moviescore values(score_seq.nextval,?,?,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getM_id());
			pstmt.setString(2, vo.getU_id());
			pstmt.setInt(3, vo.getScore());
			pstmt.setString(4, vo.getReview());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
	}
	
	
	public double average(String id) {
		double aver=0, sum=0,num=0;
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement("select* from moviescore where m_id=?");
			pstmt.setInt(1, Integer.parseInt(id));
			rs=pstmt.executeQuery();
			while(rs.next()) {
				sum+=rs.getInt("score");
				num++;				
			}
			if(num!=0) {
				aver=sum/num;				
			}			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}  
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return aver;
	}
	public boolean check(String u_id,String m_id) {
		boolean b = false;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from moviescore where u_id=? and m_id=?");
			pstmt.setString(1, u_id);
			pstmt.setInt(2, Integer.parseInt(m_id));
			rs = pstmt.executeQuery();
			if(rs.next()) {
				b = true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}  
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return b;
	}
	public ArrayList<ScoreVO> list(String id){
		ArrayList<ScoreVO> list= new ArrayList<>();
		try {
			conn = getConnection();
			pstmt=conn.prepareStatement("select * from moviescore where m_id=?");
			pstmt.setInt(1, Integer.parseInt(id));
			rs = pstmt.executeQuery();
			while(rs.next()){
				ScoreVO vo = new ScoreVO();
				vo.setM_id(rs.getInt("m_id"));
				vo.setU_id(rs.getString("u_id"));
				vo.setReview(rs.getString("review"));
				vo.setScore(rs.getInt("score"));
				list.add(vo);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}  
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return list;
	}
	
	
	
	
}