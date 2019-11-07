
package project.web.movie;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class GenDAO { // ��ȭ ��� - �帣
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	public Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		Context env = (Context)ctx.lookup("java:comp/env");
		DataSource ds = (DataSource)env.lookup("jdbc/xe");
		return ds.getConnection();
	}

	// �帣 ��ü ��ȸ ������ ��ȭ ����� �� ������
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
	public void genInset(GenVO vo) {// �帣 ����
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
	// �ߺ�üũ
	public int genCheck(String name) {
		// üũ�� = 0�̸� �ߺ�x
		int check=0;
		try {
			conn= getConnection();
			pstmt = conn.prepareStatement("select name from gen");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				// dbname�� db�� ����� name�޾ƿͼ�, �̸��� ��.
				// �̹� �ִ� �̸��̸� üũ =1 -> ����x.
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
	public void update(GenVO vo) {// �帣������Ʈ
		try {
			conn = getConnection();
			pstmt=  conn.prepareStatement("update gen set name=? where id=?");			
			pstmt.setString(1,vo.getName());
			pstmt.setInt(2, vo.getId());			
			pstmt.executeUpdate();			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null) {try {pstmt.close();}catch(SQLException s){s.printStackTrace();}}
			if(conn != null) {try {conn.close();}catch(SQLException s){s.printStackTrace();}}
		}
	}
	public GenVO getVO(String id) {// �帣���� ��������
		GenVO vo = new GenVO();
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from gen where id=?");
			pstmt.setInt(1, Integer.parseInt(id));
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo.setId(rs.getInt("id"));
				vo.setName(rs.getString("name"));
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null) {try {rs.close();}catch(SQLException s) {s.printStackTrace();}}
			if(pstmt != null) {try {pstmt.close();}catch(SQLException s) {s.printStackTrace();}}
			if(conn != null) {try {conn.close();}catch(SQLException s) {s.printStackTrace();}}
		}
		return vo;
	}
	public void delete(String id){	// �帣 ����
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement("delete from gen where id=?");
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