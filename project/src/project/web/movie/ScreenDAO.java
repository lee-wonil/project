package project.web.movie;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ScreenDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private Connection getConnection() throws Exception{
		Context ctv = new InitialContext();
		Context env = (Context)ctv.lookup("java:comp/env");
		DataSource ds = (DataSource)env.lookup("jdbc/xe");
		return ds.getConnection();
	}
	public void insert(ScreenVO vo) {
		try {
			conn = getConnection();
			String sql ="insert into screen values(screen_seq.nextval,?,?,?,?,?,?,?,?)";			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getTheaterId());
			pstmt.setInt(2, vo.getNum());
			pstmt.setString(3, vo.getName());
			pstmt.setInt(4, vo.getCol());
			pstmt.setInt(5, vo.getRow());			
			pstmt.setString(6, vo.getPX());
			pstmt.setString(7, vo.getPY());
			pstmt.setString(8,vo.getNS());
			pstmt.executeUpdate();

		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			if(pstmt!=null) {try{pstmt.close();}catch(SQLException s){s.printStackTrace();}}
			if(conn!=null) {try{conn.close();}catch(SQLException s){s.printStackTrace();}}

		}
	}
	public ArrayList<ScreenVO> list(){
		ArrayList<ScreenVO> list = new ArrayList<>();
		try {
			conn= getConnection();
			pstmt=conn.prepareStatement("select * from screen s, cinema c where s.c_id = c.c_id");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ScreenVO vo = new ScreenVO();
				vo.setId(rs.getInt("id"));
				vo.setTheaterId(rs.getInt("c_id"));
				vo.setTheaterName(rs.getString("c_name"));
				vo.setNum(rs.getInt("num"));
				vo.setName(rs.getString("name"));
				vo.setCol(rs.getInt("col"));
				vo.setRow(rs.getInt("row1"));
				list.add(vo);
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}finally {
			if(rs!=null) {try{rs.close();}catch(SQLException s){s.printStackTrace();}}
			if(pstmt!=null) {try{pstmt.close();}catch(SQLException s){s.printStackTrace();}}
			if(conn!=null) {try{conn.close();}catch(SQLException s){s.printStackTrace();}}
		}

		return list;

	}
	public ArrayList<ScreenVO> list(String id){
		ArrayList<ScreenVO> list = new ArrayList<>();
		try {
			conn= getConnection();
			pstmt=conn.prepareStatement("select * from screen s, cinema c where s.c_id = c.c_id and c.c_id=?");
			pstmt.setInt(1, Integer.parseInt(id));
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ScreenVO vo = new ScreenVO();
				vo.setId(rs.getInt("id"));
				vo.setTheaterId(rs.getInt("c_id"));
				vo.setTheaterName(rs.getString("c_name"));
				vo.setNum(rs.getInt("num"));
				vo.setName(rs.getString("name"));
				vo.setCol(rs.getInt("col"));
				vo.setRow(rs.getInt("row1"));
				list.add(vo);
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}finally {
			if(rs!=null) {try{rs.close();}catch(SQLException s){s.printStackTrace();}}
			if(pstmt!=null) {try{pstmt.close();}catch(SQLException s){s.printStackTrace();}}
			if(conn!=null) {try{conn.close();}catch(SQLException s){s.printStackTrace();}}
		}

		return list;

	}
	public ScreenVO get(String id) {
		ScreenVO vo =new ScreenVO();
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from screen s, cinema c where s.c_id = c.c_id and s.id=?");
			pstmt.setInt(1, Integer.parseInt(id));
			rs=pstmt.executeQuery();
			if(rs.next()) {			
				vo.setId(rs.getInt("id"));
				vo.setTheaterName(rs.getString("c_name"));
				vo.setTheaterId(rs.getInt("c_id"));
				vo.setNum(rs.getInt("num"));
				vo.setName(rs.getString("name"));
				vo.setCol(rs.getInt("col"));
				vo.setRow(rs.getInt("row1"));
				String passX = rs.getString("passageX");
				vo.setPassageX(passX);
				String passY = rs.getString("passageY");
				vo.setPassageY(passY);
				String seat = rs.getString("noseat");
				vo.setNoSeat(seat);				
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			if(rs!=null) {try{rs.close();}catch(SQLException s){s.printStackTrace();}}
			if(pstmt!=null) {try{pstmt.close();}catch(SQLException s){s.printStackTrace();}}
			if(conn!=null) {try{conn.close();}catch(SQLException s){s.printStackTrace();}}
		}
		return vo;
	}
	public void update(ScreenVO vo) {
		try {
			conn = getConnection();
			String sql = "update screen set num=?,name=?, col=?, row1=?, passagex=?,passagey=?, noseat=? where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getNum());
			pstmt.setString(2, vo.getName());
			pstmt.setInt(3, vo.getCol());
			pstmt.setInt(4, vo.getRow());
			pstmt.setString(5, vo.getPX());
			pstmt.setString(6, vo.getPY());
			pstmt.setString(7, vo.getNS());
			pstmt.setInt(8, vo.getId());
			pstmt.executeUpdate();
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally {
			if(rs!=null) {try{rs.close();}catch(SQLException s){s.printStackTrace();}}
			if(pstmt!=null) {try{pstmt.close();}catch(SQLException s){s.printStackTrace();}}
			if(conn!=null) {try{conn.close();}catch(SQLException s){s.printStackTrace();}}
		}
	}
	public void delete(String id) {
		
	}
}

