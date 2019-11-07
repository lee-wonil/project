package project.web.movie;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class MemberDAO {
	private Connection conn=null;
	private PreparedStatement pstmt=null;
	private ResultSet rs=null;
	
	private Connection getConnection()throws Exception{
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource)envCtx.lookup("jdbc/xe");
		return ds.getConnection();
	}
	
	public void insertUser(MemberVO dto) {	// 회원가입
		try {
			conn=getConnection();
			String sql = "insert into member values(?,?,?,?,?,?,sysdate,0,0)";
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPasswd());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getBirth());
			pstmt.setString(5, dto.getPhone());
			pstmt.setString(6, dto.getEmail());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt!=null) {try {pstmt.close();}catch(SQLException s) {s.printStackTrace();}}
			if(conn!=null) {try {conn.close();}catch(SQLException s) {s.printStackTrace();}}
		}
	}
	
	public boolean loginCheck(String id, String pw) { // 로그인 체크
		boolean result=false;
		try {
			conn=getConnection();
			String sql="select * from member where id=? and passwd=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			
			rs=pstmt.executeQuery();
			if(rs.next()) {
				result=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt!=null) {try {pstmt.close();}catch(SQLException s) {s.printStackTrace();}}
			if(conn!=null) {try {conn.close();}catch(SQLException s) {s.printStackTrace();}}
			if(rs!=null) {try {rs.close();}catch(SQLException s) {s.printStackTrace();}}
		}
		return result;
	}
	
	public MemberVO UserData(String id) {	//user정보 확인
		MemberVO dto = new MemberVO();
		try {
			conn=getConnection();
			String sql = "select * from member where id=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setPasswd(rs.getString("passwd"));
				dto.setName(rs.getString("name"));
				dto.setBirth(rs.getString("birth"));
				dto.setPhone(rs.getString("phone"));
				dto.setEmail(rs.getString("email"));
				dto.setAdmin(rs.getInt("admin"));
				dto.setVisit(rs.getString("visit"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt!=null) {try {pstmt.close();}catch(SQLException s) {s.printStackTrace();}}
			if(conn!=null) {try {conn.close();}catch(SQLException s) {s.printStackTrace();}}
			if(rs!=null) {try {rs.close();}catch(SQLException s) {s.printStackTrace();}}
		}
		return dto;
	}
	
	public boolean update(MemberVO dto) {	// 회원정보 수정
		boolean result=false;
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement("update member set passwd=?, phone=?, email=? where id=?");
			pstmt.setString(1, dto.getPasswd());
			pstmt.setString(2, dto.getPhone());
			pstmt.setString(3, dto.getEmail());
			pstmt.setString(4, dto.getId());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt!=null) {try {pstmt.close();}catch(SQLException s) {s.printStackTrace();}}
			if(conn!=null) {try {conn.close();}catch(SQLException s) {s.printStackTrace();}}
		}
		return result;
	}
	
	public int confirmId(String id) {	// 아이디 중복체크
		int check=0;
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement("select id from member");
			rs=pstmt.executeQuery();
			while(rs.next()) {
				String dbid = rs.getString("id"); 
				if(dbid.equals(id)) {
					check=1;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt!=null) {try {pstmt.close();}catch(SQLException s) {s.printStackTrace();}}
			if(conn!=null) {try {conn.close();}catch(SQLException s) {s.printStackTrace();}}
			if(rs!=null) {try {rs.close();}catch(SQLException s) {s.printStackTrace();}}
		}
		return check;
	}
	
	public int deleteMem(String id){	// 회원탈퇴
		int x = 0;
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement("delete from member where id=?");
			pstmt.setString(1, id);
			x=pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt!=null) {try {pstmt.close();}catch(SQLException s) {s.printStackTrace();}}
			if(conn!=null) {try {conn.close();}catch(SQLException s) {s.printStackTrace();}}
			if(rs!=null) {try {rs.close();}catch(SQLException s) {s.printStackTrace();}}
		}
		return x;
	}
	
	public List<MemberVO> memberlist() {
		List<MemberVO> list = new  ArrayList<MemberVO>();
		
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement("select * from member");
			rs=pstmt.executeQuery();
			while(rs.next()) {
				MemberVO dto = new MemberVO();
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setAdmin(rs.getInt("admin"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt!=null) {try {pstmt.close();}catch(SQLException s){s.printStackTrace();}}
			if(conn!=null) {try {conn.close();}catch(SQLException s){s.printStackTrace();}}
			if(rs!=null) {try {rs.close();}catch(SQLException s){s.printStackTrace();}}
		}
		return list;
	}
	
	public void setAdmin(String id, String ad) {	// 권한 변경
		try {
			conn=getConnection();
			pstmt= conn.prepareStatement("update member set admin=? where id=?");
			pstmt.setInt(1, Integer.parseInt(ad));
			pstmt.setString(2, id);
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