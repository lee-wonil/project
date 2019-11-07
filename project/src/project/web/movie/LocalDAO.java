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
	public ArrayList<LocalVO> selectAll(){	// 지역 전체 조회
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
	public int check(String name) {	// 지역 중복체크
		int check = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select l_name from localtable");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String dbname = rs.getString("l_name");
				if(dbname.equals(name)) {
					check = 1;
				}
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null) {try {rs.close();}catch(SQLException s) {s.printStackTrace();}}
			if(pstmt != null) {try {pstmt.close();}catch(SQLException s) {s.printStackTrace();}}
			if(conn != null) {try {conn.close();}catch(SQLException s) {s.printStackTrace();}}
		}
		return check;
	}
	public LocalVO getLocal(String id) { // 지역 정보 리턴
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
	public void insert(String name) {	// 지역 삽입
		try {
			conn = getConnection();
			pstmt=  conn.prepareStatement("insert into localtable values (local_seq.nextval,?)");
			pstmt.setString(1,name);
			pstmt.executeUpdate();			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null) {try {pstmt.close();}catch(SQLException s){s.printStackTrace();}}
			if(conn != null) {try {conn.close();}catch(SQLException s){s.printStackTrace();}}
		}
	}
	public void update(LocalVO vo) { // 지역 수정
		try {
			conn = getConnection();
			pstmt=  conn.prepareStatement("update localtable set l_name=? where l_id=?");			
			pstmt.setString(1,vo.getL_name());
			pstmt.setInt(2, vo.getL_id());			
			pstmt.executeUpdate();			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null) {try {pstmt.close();}catch(SQLException s){s.printStackTrace();}}
			if(conn != null) {try {conn.close();}catch(SQLException s){s.printStackTrace();}}
		}
	}
	public void delete(String id){ // 지역 삭제
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement("delete from localtable where l_id=?");
			pstmt.setInt(1, Integer.parseInt(id));
			pstmt.executeUpdate();			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt!=null) {try {pstmt.close();}catch(SQLException s) {s.printStackTrace();}}
			if(conn!=null) {try {conn.close();}catch(SQLException s) {s.printStackTrace();}}
			if(rs!=null) {try {rs.close();}catch(SQLException s) {s.printStackTrace();}}
		}
	}
}