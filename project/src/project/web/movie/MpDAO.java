package project.web.movie;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MpDAO {	// 마이페이지
	private Connection conn=null;
	private PreparedStatement pstmt=null;
	private ResultSet rs=null;
	
	private Connection getConnection()throws Exception{
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource)envCtx.lookup("jdbc/xe");
		return ds.getConnection();
	}

	public ArrayList<MpVO> mp (String id) {	// 영화 예매 내역 확인
		ArrayList<MpVO> list = new ArrayList<MpVO>();
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement("select ms.m_id, mv.m_title, c.c_name, sc.name, ms.m_date, ms.m_starttime, ms.m_endtime, bk.payment " + 
					"from member mem, book bk, mscrn ms, screen sc, cinema c , movie mv " + 
					"where ms.s_id = sc.id and sc.c_id = c.c_id and mem.id= bk.u_id and bk.t_id = ms.id and mv.m_id=ms.m_id and mem.id=? and bk.payment!=0 "
					+"order by bk.payment desc"
					);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				MpVO vo = new MpVO();
				vo.setM_id(rs.getInt("m_id"));
				vo.setM_title(rs.getString("m_title"));
				vo.setC_name(rs.getString("c_name"));
				vo.setName(rs.getString("name"));
				vo.setM_date(rs.getDate("m_date"));
				vo.setM_startTime(rs.getString("m_startTime"));
				vo.setM_endTime(rs.getString("m_endTime"));
				vo.setPayNum(rs.getInt("payment"));
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt!=null) {try {pstmt.close();}catch(SQLException s) {s.printStackTrace();}}
			if(conn!=null) {try {conn.close();}catch(SQLException s) {s.printStackTrace();}}
			if(rs!=null) {try {rs.close();}catch(SQLException s) {s.printStackTrace();}}
		}
		return list;
	}
	public ArrayList<Integer> mp2 (String id) {	// 영화 예매번호만 추출
		ArrayList<Integer> list = new ArrayList<Integer>();
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement("select DISTINCT payment from book where u_id=? and payment!=0 order by payment desc");
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				list.add(rs.getInt("payment"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt!=null) {try {pstmt.close();}catch(SQLException s) {s.printStackTrace();}}
			if(conn!=null) {try {conn.close();}catch(SQLException s) {s.printStackTrace();}}
			if(rs!=null) {try {rs.close();}catch(SQLException s) {s.printStackTrace();}}
		}
		return list;
	}
	
	public HashMap<Integer, ArrayList<MpVO>> payHash (String id) {	// 결제번호로 해당 데이터를 묶어서 보여줌
		ArrayList<MpVO> list1 = mp(id);
		ArrayList<Integer> list2 = mp2(id); 
		Iterator<Integer> it = list2.iterator();
		HashMap<Integer,  ArrayList<MpVO>> has = new HashMap<Integer,  ArrayList<MpVO>>();
		int a = 0;		
		for(int i=0;i<list1.size();i++) {			
			MpVO vo = list1.get(i);
			ArrayList<MpVO> li = new ArrayList<>();
			if(vo.getPayNum()==a) {
				if(has.get(a)!=null) {
					li = has.get(a);
				}
				li.add(vo);
				has.put(a, li);
			}else {
				if(it.hasNext()) {
					a = it.next();
				}
				li.add(vo);
				has.put(a,li);
			}			
		}		
		return has;
	}

}