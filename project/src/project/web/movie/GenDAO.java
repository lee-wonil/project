
package project.web.movie;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class GenDAO { // 영화 등록 - 장르
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	public Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		Context env = (Context)ctx.lookup("java:comp/env");
		DataSource ds = (DataSource)env.lookup("jdbc/xe");
		return ds.getConnection();
	}

	// 장르 전체 조회 폼에서 영화 등록할 때 쓰려고
	public ArrayList<GenVO> selectAll() {
		ArrayList<GenVO> list = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from gen order by id asc");
			rs = pstmt.executeQuery();
			list = new ArrayList<>();
			while(rs.next()) {
				GenVO vo = new GenVO();
				vo.setId(rs.getInt("id"));
				vo.setName(rs.getString("name"));
				list.add(vo);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null) {try {rs.close();}catch(SQLException s) {s.printStackTrace();}}
			if(pstmt != null) {try {pstmt.close();}catch(SQLException s) {s.printStackTrace();}}
			if(conn != null) {try {conn.close();}catch(SQLException s) {s.printStackTrace();}}
		}
		return list;
	}
	public void genInset(GenVO vo) {
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("insert into gen values (gen_seq.nextval, ?)");
			pstmt.setString(1,vo.getName());
			pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null) {try {pstmt.close();}catch(SQLException s) {s.printStackTrace();}}
			if(conn != null) {try {conn.close();}catch(SQLException s) {s.printStackTrace();}}
		}
	}
	// 중복체크
	public int genCheck(String name) {
		// 체크값 = 0이면 중복x
		int check=0;
		try {
			conn= getConnection();
			pstmt = conn.prepareStatement("select name from gen");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				// dbname에 db에 저장된 name받아와서, 이름들 비교.
				// 이미 있는 이름이면 체크 =1 -> 저장x.
				String dbname = rs.getString("name");
				if(dbname.equals(name)) {
					check=1;
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