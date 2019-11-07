package project.web.movie;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class CinemaDAO {
	private Connection conn=null;
	private PreparedStatement pstmt=null;
	private ResultSet rs= null;
	
	private Connection getConnection() throws Exception{
		Context ctx= new InitialContext(); 
		Context env= (Context)ctx.lookup("java:comp/env");			
		DataSource ds= (DataSource)env.lookup("jdbc/xe");	
		
		return ds.getConnection();
	}
	public ArrayList<CinemaVO> list(){	// cinema 전체 리스트 리턴
		ArrayList<CinemaVO> list = new ArrayList<>();
		try {
			conn=getConnection();
			String sql = "select * from cinema c, localtable l where l.l_id=c.l_id order by c.c_id";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				CinemaVO vo=new CinemaVO();
				vo.setC_name(rs.getString("c_name"));
				vo.setC_id(rs.getInt("c_id"));
				vo.setC_address(rs.getString("c_address"));
				vo.setL_id(rs.getInt("l_id"));
				vo.setL_name(rs.getString("l_name"));
				list.add(vo);
			}
		}catch (Exception e){e.printStackTrace();}
		finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}  
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return list;
	}
	public ArrayList<CinemaVO> list(String id){	// 지역별 cinema 리스트 리턴
		ArrayList<CinemaVO> list = new ArrayList<>();
		try {
			conn=getConnection();
			int id1=Integer.parseInt(id);
			String sql = "select * from cinema c, localtable l where l.l_id=c.l_id and l.l_id=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, id1);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				CinemaVO vo=new CinemaVO();
				vo.setC_name(rs.getString("c_name"));
				///////////////////////////////////
				vo.setC_id(rs.getInt("c_id"));
				vo.setC_address(rs.getString("c_address"));
				vo.setL_id(rs.getInt("l_id"));
				vo.setL_name(rs.getString("l_name"));
				list.add(vo);
			}
		}catch(Exception e){e.printStackTrace();}
		finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}  
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return list;
	}

	public CinemaVO getcvo(String id) {	// cinema id에 대한 정보 리턴
		CinemaVO cvo=new CinemaVO();
		try {
			int id1=Integer.parseInt(id);
			conn=getConnection();
			String sql="select * from localtable l1,cinema c1  where l1.l_id=c1.l_id and c_id=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, id1);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				cvo.setC_address(rs.getString("c_address"));
				cvo.setC_id(rs.getInt("c_id"));
				cvo.setC_name(rs.getString("c_name"));
				cvo.setL_id(rs.getInt("l_id"));
				cvo.setL_name(rs.getString("l_name"));				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}  
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return cvo;
	}
	
	public void insert(CinemaVO vo) {	// cinema 삽입 메서드
		try {
			conn=getConnection();			
			String sql="insert into cinema values(cinema_seq.nextval,?,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,vo.getC_name());
			pstmt.setString(2,vo.getC_address());
			pstmt.setInt(3, vo.getL_id());
			pstmt.executeUpdate();
		} catch (Exception e) {e.printStackTrace();
		}finally { 
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
	
	}
	
	public boolean update(CinemaVO vo) {	// cinema 수정
		boolean result=false;
		try {
			conn=getConnection();
			String sql="update cinema set c_name=?,l_id=?,c_address=? where c_id=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, vo.getC_name());
			pstmt.setInt(2, vo.getL_id());
			pstmt.setString(3, vo.getC_address());
			pstmt.setInt(4, vo.getC_id());
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}  
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return result;
	}
	public void favorinsert(String v_id,String id) {	// 멤버에 자주가는 상영관 삽입
		try {
			conn=getConnection();
			String sql="update member set visit=? where id=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, v_id);
			pstmt.setString(2, id);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
	}
	public CinemaVO favorload(String id) {	// 자주가는 상영관 로드
		CinemaVO vo = new CinemaVO();		
		try {
			conn=getConnection();
			String sql="select c_id,c_name from cinema where c_id=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(id));
			rs=pstmt.executeQuery();
			if(rs.next()) {
				vo.setC_id(rs.getInt("c_id"));
				vo.setC_name(rs.getString("c_name"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}  
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return vo;
	}
	
	public String getFavorlist(String id) {	// DB에 자주가는 상영관 가져오기
		String s ="";
		try {
			conn = getConnection();
			pstmt= conn.prepareStatement("select * from member where id=?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				s= rs.getString("visit");
			}			
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return s;
	}
	
	
}