package project.web.movie;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MscrnDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	private Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		Context env = (Context)ctx.lookup("java:comp/env");
		DataSource ds = (DataSource)env.lookup("jdbc/xe");
		return ds.getConnection();
	}

	// 상영예정 영화 등록
	public void insertMscrn(MscrnVO dto) throws Exception {
		try {
			conn = getConnection();
			String sql = "insert into mscrn values(mscrn_seq.nextVal,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getM_id());
			pstmt.setInt(2, dto.getS_id());
			pstmt.setDate(3, new java.sql.Date(dto.getM_date().getTime()));
			pstmt.setString(4, dto.getM_startTime());
			pstmt.setString(5, dto.getM_endTime());	
			pstmt.setInt(6, dto.getM_poseat());
			pstmt.setInt(7, dto.getM_price());
			pstmt.executeUpdate();			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null) {try{pstmt.close();}catch (SQLException s) {s.printStackTrace();}}
			if(conn != null) {try{conn.close();}catch (SQLException s) {s.printStackTrace();}}
		}
	}
	public ArrayList<MscrnVO> list(String id){
		ArrayList<MscrnVO> list = new ArrayList<>();
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from mscrn where m_id=? and m_date>=? order by m_date");
			pstmt.setInt(1, Integer.parseInt(id));
			pstmt.setDate(2, new java.sql.Date(System.currentTimeMillis()));// 현재 시간
			rs = pstmt.executeQuery();

			while(rs.next()) {
				MscrnVO vo = new MscrnVO();
				Calendar cal = Calendar.getInstance();
				Date d1 = rs.getDate("m_date");
				String [] s = rs.getString("m_starttime").split(":");
				cal.setTime(d1);
				cal.add(Calendar.HOUR_OF_DAY, Integer.parseInt(s[0]));
				cal.add(Calendar.MINUTE, Integer.parseInt(s[1]));
				if(cal.getTime().getTime()>System.currentTimeMillis()) {
					vo.setId(rs.getInt("id"));
					vo.setS_id(rs.getInt("s_id"));
					vo.setM_id(rs.getInt("m_id"));				
					vo.setM_date(rs.getDate("m_date"));
					vo.setM_startTime(rs.getString("m_starttime"));
					vo.setM_endTime(rs.getString("m_endtime"));
					vo.setM_poseat(rs.getInt("m_poseat"));
					vo.setM_price(rs.getInt("m_price"));
					list.add(vo);
				}
			}			
		}
		catch (Exception e) {
			e.printStackTrace();
		}finally {			
			if(rs != null) {try {rs.close();}catch(SQLException s) {s.printStackTrace();}}
			if(pstmt != null) {try {pstmt.close();}catch(SQLException s) {s.printStackTrace();}}
			if(conn != null) {try {conn.close();}catch(SQLException s) {s.printStackTrace();}}
		}
		return list;
	}
	public ArrayList<MscrnVO> listAll(String id){
		ArrayList<MscrnVO> list = new ArrayList<>();
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from mscrn where m_id=? order by m_date desc");
			pstmt.setInt(1, Integer.parseInt(id));
			rs = pstmt.executeQuery();

			while(rs.next()) {
				MscrnVO vo = new MscrnVO();
				vo.setId(rs.getInt("id"));
				vo.setS_id(rs.getInt("s_id"));
				vo.setM_id(rs.getInt("m_id"));				
				vo.setM_date(rs.getDate("m_date"));
				vo.setM_startTime(rs.getString("m_starttime"));
				vo.setM_endTime(rs.getString("m_endtime"));
				vo.setM_poseat(rs.getInt("m_poseat"));
				vo.setM_price(rs.getInt("m_price"));
				list.add(vo);

			}			
		}
		catch (Exception e) {
			e.printStackTrace();
		}finally {			
			if(rs != null) {try {rs.close();}catch(SQLException s) {s.printStackTrace();}}
			if(pstmt != null) {try {pstmt.close();}catch(SQLException s) {s.printStackTrace();}}
			if(conn != null) {try {conn.close();}catch(SQLException s) {s.printStackTrace();}}
		}
		return list;
	}
	public ArrayList<MscrnVO> listAll(){
		ArrayList<MscrnVO> list = new ArrayList<>();
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from mscrn order by m_date desc");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MscrnVO vo = new MscrnVO();
				vo.setId(rs.getInt("id"));
				vo.setS_id(rs.getInt("s_id"));
				vo.setM_id(rs.getInt("m_id"));
				vo.setM_date(rs.getDate("m_date"));
				vo.setM_startTime(rs.getString("m_starttime"));
				vo.setM_endTime(rs.getString("m_endtime"));
				vo.setM_poseat(rs.getInt("m_poseat"));
				vo.setM_price(rs.getInt("m_price"));
				list.add(vo);
			}			
		}
		catch (Exception e) {
			e.printStackTrace();
		}finally {			
			if(rs != null) {try {rs.close();}catch(SQLException s) {s.printStackTrace();}}
			if(pstmt != null) {try {pstmt.close();}catch(SQLException s) {s.printStackTrace();}}
			if(conn != null) {try {conn.close();}catch(SQLException s) {s.printStackTrace();}}
		}
		return list;
	}
	public ArrayList<MscrnVO> list(){
		ArrayList<MscrnVO> list = new ArrayList<>();
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from mscrn where m_date>?");
			pstmt.setDate(1, new java.sql.Date(System.currentTimeMillis()));// 현재 시간
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MscrnVO vo = new MscrnVO();
				vo.setId(rs.getInt("id"));
				vo.setS_id(rs.getInt("s_id"));
				vo.setM_id(rs.getInt("m_id"));
				vo.setM_date(rs.getDate("m_date"));
				vo.setM_startTime(rs.getString("m_starttime"));
				vo.setM_endTime(rs.getString("m_endtime"));
				vo.setM_poseat(rs.getInt("m_poseat"));
				vo.setM_price(rs.getInt("m_price"));
				list.add(vo);
			}			
		}
		catch (Exception e) {
			e.printStackTrace();
		}finally {			
			if(rs != null) {try {rs.close();}catch(SQLException s) {s.printStackTrace();}}
			if(pstmt != null) {try {pstmt.close();}catch(SQLException s) {s.printStackTrace();}}
			if(conn != null) {try {conn.close();}catch(SQLException s) {s.printStackTrace();}}
		}
		return list;
	}
	public MscrnVO get(String id) {
		MscrnVO vo = new MscrnVO();
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from mscrn m1,movie m2 where m1.id=? and m1.m_id=m2.m_id ");
			pstmt.setInt(1, Integer.parseInt(id));
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo.setId(rs.getInt("id"));
				vo.setM_title(rs.getString("m_title"));
				vo.setM_id(rs.getInt("m_id"));
				vo.setS_id(rs.getInt("s_id"));
				vo.setM_date(rs.getDate("m_date"));
				vo.setM_startTime(rs.getString("m_starttime"));
				vo.setM_endTime(rs.getString("m_endtime"));
				vo.setM_poseat(rs.getInt("m_poseat"));
				vo.setM_price(rs.getInt("m_price"));
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
	public ArrayList<Date> getDate() {	// DB에 저장되어 있는 날짜만 조회(중복되는 날짜를 한 데이터로 처리하기 위해서 )
		ArrayList<Date> list  = new ArrayList<>();
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select DISTINCT m_date from mscrn where m_date>sysdate order by m_date asc");			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(rs.getDate("m_date"));
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}finally {			
			if(rs != null) {try {rs.close();}catch(SQLException s) {s.printStackTrace();}}
			if(pstmt != null) {try {pstmt.close();}catch(SQLException s) {s.printStackTrace();}}
			if(conn != null) {try {conn.close();}catch(SQLException s) {s.printStackTrace();}}
		}
		return list;
	}
	public boolean checkTime(int s_id,Date m_date ,String startTime, String endTime) {
		boolean b = false;
		try {
			conn = getConnection();
			String sql = "select * from mscrn where s_id =? and m_date=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, s_id);
			pstmt.setDate(2, new java.sql.Date(m_date.getTime()));
			rs = pstmt.executeQuery();
			SimpleDateFormat df = new SimpleDateFormat("HH:mm");
			Date d1 = df.parse(startTime);
			Date d2 = df.parse(endTime);
			while(rs.next()) {
				String st = rs.getString("m_starttime");
				Date d3 = df.parse(st);
				String en = rs.getString("m_endtime");
				Date d4 = df.parse(en);
				int compares1 = d1.compareTo(d3);	// 시작시간 비교
				int compares2 = d1.compareTo(d4);	// 끝나는 시간 비교
				if(compares1>=0&&compares2<=0) {	// 만약 저장할 시작시간이 시작시간과 끝나는 시간 사이 인 경우 true 리턴
					return true;						
				}
				compares1 = d2.compareTo(d3);
				compares2 = d2.compareTo(d4);
				if(compares1>=0&&compares2<=0) {	// 만약 저장할 시작시간이 시작시간과 끝나는 시간 사이 인 경우 true 리턴
					return true;						
				}
				compares1 = d1.compareTo(d3);
				compares2 = d2.compareTo(d4);
				if(compares1<=0&&compares2>=0) {
					return true;
				}

			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {			
			if(rs != null) {try {rs.close();}catch(SQLException s) {s.printStackTrace();}}
			if(pstmt != null) {try {pstmt.close();}catch(SQLException s) {s.printStackTrace();}}
			if(conn != null) {try {conn.close();}catch(SQLException s) {s.printStackTrace();}}
		}
		return b;
	}

}
