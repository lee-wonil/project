package project.web.movie;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class GradeDAO { // 연령등급 dao
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	public Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		Context env = (Context)ctx.lookup("java:comp/env");
		DataSource ds = (DataSource)env.lookup("jdbc/xe");
		return ds.getConnection();
	}

	// 영화등록 폼에서 연령등급을 셀렉트 박스로 보여줘서 선택하게 함.
	public ArrayList<GradeVO> selectAllGrade(){
		ArrayList<GradeVO> gradelist = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from grade");
			rs = pstmt.executeQuery();
			gradelist = new ArrayList<>();
			while(rs.next()) {
				GradeVO dto = new GradeVO();
				dto.setId(rs.getInt("id"));
				dto.setName(rs.getString("name"));
				gradelist.add(dto);
			}

		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null) {try {rs.close();}catch(SQLException s) {s.printStackTrace();}}
			if(pstmt != null) {try {pstmt.close();}catch(SQLException s) {s.printStackTrace();}}
			if(conn != null) {try {conn.close();}catch(SQLException s) {s.printStackTrace();}}
		}
		return gradelist;
	}
	//insert
	public void gradeInsert(GradeVO vo) {
		try {
			conn = getConnection();
			pstmt=  conn.prepareStatement("insert into grade values (grade_seq.nextval,?)");
			pstmt.setString(1,vo.getName());
			pstmt.executeUpdate();			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null) {try {pstmt.close();}catch(SQLException s){s.printStackTrace();}}
			if(conn != null) {try {conn.close();}catch(SQLException s){s.printStackTrace();}}
		}
	}
	public int gradeCheck(String name) {
		int check = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select name from grade");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String dbname = rs.getString("name");
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

}