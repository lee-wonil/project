package project.web.movie;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BookDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	private Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		Context env = (Context)ctx.lookup("java:comp/env");
		DataSource ds = (DataSource)env.lookup("jdbc/xe");
		return ds.getConnection();
	}
	public ArrayList<BookVO> list(String id) {// 상영시간표에 대한 예매리스트		
		ArrayList<BookVO> list = new ArrayList<>();		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from book where t_id=? order by payment desc");
			pstmt.setInt(1, Integer.parseInt(id));
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BookVO vo = new BookVO();
				vo.setId(rs.getInt("id"));
				vo.setT_id(rs.getInt("t_id"));
				vo.setU_id(rs.getString("u_id"));
				vo.setSeat(rs.getInt("seat"));
				vo.setPayment(rs.getInt("payment"));
				vo.setBooktime(rs.getDate("booktime"));
				list.add(vo);
			}

		}
		catch (Exception e){
			e.printStackTrace();			
		}
		finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}  
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return list;
	}
	public int get(String id) {	// 해당 시간표에 예매된 사람의 수 리턴
		int getNum = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select count(*) from book where t_id=?");
			pstmt.setInt(1, Integer.parseInt(id));
			rs = pstmt.executeQuery();
			if(rs.next()) {
				getNum = rs.getInt("count(*)");
			}
		}
		catch (Exception e){
			e.printStackTrace();			
		}
		finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}  
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return getNum;
	}
	public void insertBook(BookVO vo) { // 예매테이블에 값 삽입
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("insert into book values(book_seq.nextval,?,?,?,0,sysdate)");
			pstmt.setInt(1, vo.getT_id());
			pstmt.setString(2, vo.getU_id());
			pstmt.setInt(3, vo.getSeat());
			pstmt.executeUpdate();
			}
		catch (Exception e){
			e.printStackTrace();			
		}
		finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}  
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
	}
	public int getId(BookVO vo) {//
		int id = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select id from book where t_id=? and seat=?");
			pstmt.setInt(1, vo.getT_id());
			pstmt.setInt(2, vo.getSeat());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				id = rs.getInt("id");
			}
		}catch (Exception e){
			e.printStackTrace();			
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}  
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return id;
	}
	public boolean checkBook(int id, String[] seat) {// 다른 사람이 이미 예매를 했는지 체크
		boolean b = false;
		try {
			conn = getConnection();
			String sql = "select * from book where t_id=? and seat=?";
			pstmt = conn.prepareStatement(sql);
			for(int i=0;i<seat.length;i++) {
				pstmt.setInt(1, id);
				pstmt.setInt(2, Integer.parseInt(seat[i]));
				rs = pstmt.executeQuery();
				if(rs.next()) {
					b= true;
				}
				pstmt.clearParameters();
			}
		}
		catch (Exception e){
			e.printStackTrace();			
		}
		finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}  
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return b;
	}
	public void payment(int id, int num) {// 결제가 완료되면 값 변경
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("update book set payment=? where id=?");
			pstmt.setInt(1, num);
			pstmt.setInt(2, id);
			pstmt.executeUpdate();			
		}catch (Exception e){
			e.printStackTrace();			
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}  
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
	}
	public int getpaymentseq() {	// 결제번호의 시퀀스 값을 가져오는 메서드
		int a = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select payment_seq.nextval from dual");
			rs = pstmt.executeQuery();
			if(rs.next()) {
				a = rs.getInt("nextval");
			}
		}catch (Exception e){
			e.printStackTrace();			
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}  
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return a;
	}
	public int getCount() {	// 전체 예매 수
		int max = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select count(*) count from book");
			rs = pstmt.executeQuery();
			if(rs.next()) {
				max = rs.getInt("count");
			}
		}catch (Exception e){
			e.printStackTrace();			
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}  
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return max;
	}
	public void deleteBook(String id, int payment) {	// 예매 취소
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement("delete from book where u_id=? and payment=?");
			pstmt.setString(1, id);
			pstmt.setInt(2, payment);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}  
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
	}
}
