package project.web.movie;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MovieDAO { 
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	public Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		Context env = (Context)ctx.lookup("java:comp/env");
		DataSource ds = (DataSource)env.lookup("jdbc/xe");
		return ds.getConnection();
	}
	
	// 영화 등록
	public void insertMovie(MovieVO vo) {
		try {
			conn = getConnection();
			String sql = "insert into movie values(movie_seq.nextval,?,?,?,?,0,0,?)";
			// 0 = 별점과 관객 수 나중에 예매하면 관객수 +1 하게 할거고, 별점은 영화 표 산 사람이 등록하게 할 것.
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, vo.getM_title());
			pstmt.setInt(2, vo.getM_time());
			pstmt.setInt(3, vo.getM_gen());
			pstmt.setString(4, vo.getM_pic());
			pstmt.setInt(5, vo.getM_grade());
			
			pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null) {try {pstmt.close();}catch(SQLException s) {s.printStackTrace();}}
			if(conn != null) {try {conn.close();}catch(SQLException s) {s.printStackTrace();}}
		}
	}
	
	// 영화 목록 전체 조회
	public ArrayList<MovieVO> selectAll() {
		ArrayList<MovieVO> movielist = null;
		try {
			conn = getConnection();
			String sql = "select m.*,g.name gen,gr.name grade,"
					+ "(select count(*) from book b, mscrn msc where msc.id =b.t_id and m.m_id=msc.m_id  group by msc.m_id) count "
					+ "from movie m, gen g, grade gr where m.m_gen = g.id and gr.id=m.m_grade order by m.m_id";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			movielist = new ArrayList<>();
			// 포스터 이미지 저장할 경로 -> 이걸로 조회
			String poster = "/project/movie/posterImage";
			while(rs.next()) {
				MovieVO vo = new MovieVO();
				vo.setM_id(rs.getInt("m_id"));
				vo.setM_title(rs.getString("m_title"));
				vo.setM_time(rs.getInt("m_time"));
				vo.setM_gen(rs.getInt("m_gen"));	// 여기서 int로 id 받아옴-> movieMain의 for문으로 처리
				vo.setM_pic(poster+"/"+rs.getString("m_pic"));	// 포스터 주소 출력
				vo.setM_sco(rs.getInt("m_sco"));
				if(rs.getString("count")!=null) {
					vo.setM_public(rs.getInt("count"));
				}
				else {
					vo.setM_public(0);
				}
				vo.setM_grade(rs.getInt("m_grade"));	// 연령등급도 int로 받아옴 -> movieMain의 for문으로 처리
				vo.setM_genName(rs.getString("gen"));
				vo.setM_gradeName(rs.getString("grade"));
				movielist.add(vo);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {			
			if(rs != null) {try {rs.close();}catch(SQLException s) {s.printStackTrace();}}
			if(pstmt != null) {try {pstmt.close();}catch(SQLException s) {s.printStackTrace();}}
			if(conn != null) {try {conn.close();}catch(SQLException s) {s.printStackTrace();}}
		}
		return movielist;
	}
	public MovieVO findById(String id) {
		MovieVO vo = new MovieVO();
		try {
			conn = getConnection();
			String sql = "select m.*,g.name gen,gr.name grade from movie m, gen g, grade gr where m.m_gen = g.id and gr.id=m.m_grade and m.m_id=?" ;
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(id));
			String poster = "/project/movie/posterImage";
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo.setM_id(rs.getInt("m_id"));
				vo.setM_title(rs.getString("m_title"));
				vo.setM_time(rs.getInt("m_time"));
				vo.setM_pic(poster+"/"+rs.getString("m_pic"));
				vo.setM_genName(rs.getString("gen"));
				vo.setM_gradeName(rs.getString("grade"));
				
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
	public ArrayList<MovieVO> getMovieList(int startRow, int endRow) throws Exception{
		ArrayList<MovieVO> movieDbList = null;
		String poster = "/project/movie/posterImage";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from( select rownum as rnum, A.* "
					+ "from (select m.*,g.name gen,gr.name grade,(select count(*) from book b, mscrn msc where msc.id =b.t_id and m.m_id=msc.m_id  group by msc.m_id) count "
					+ "from movie m, gen g, grade gr where m.m_gen = g.id and gr.id=m.m_grade order by count desc nulls last) a where "
					+ "rownum <= ? ) where rnum >= ? ");
			pstmt.setInt(1, endRow);
			pstmt.setInt(2, startRow);
			
			rs = pstmt.executeQuery();
			movieDbList = new ArrayList<>();
			while(rs.next()) {				
					MovieVO vo = new MovieVO();
					vo.setM_id(rs.getInt("m_id"));
					vo.setM_title(rs.getString("m_title"));
					vo.setM_grade(rs.getInt("m_grade"));
					vo.setM_pic(poster+"/"+rs.getString("m_pic"));					
					if(rs.getString("count")!=null) {
						vo.setM_public(rs.getInt("count"));				
					}
					else {
						vo.setM_public(0);
					}
					vo.setM_gen(rs.getInt("m_gen"));
					vo.setM_time(rs.getInt("m_time"));
					vo.setM_genName(rs.getString("gen"));
					vo.setM_gradeName(rs.getString("grade"));
					movieDbList.add(vo);
				
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) {try{rs.close();}catch (SQLException s) {s.printStackTrace();}}
			if(pstmt!=null) {try{pstmt.close();}catch (SQLException s) {s.printStackTrace();}}
			if(conn!=null) {try{conn.close();}catch (SQLException s) {s.printStackTrace();}}
			
		}
		return movieDbList;
		
	}
	public int getListCount() throws Exception{
		int x = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select count(*) from movie");
			rs = pstmt.executeQuery();
			if(rs.next()) {
				x = rs.getInt(1);
			}
		}catch (Exception e) {
		e.printStackTrace();
		}finally {
			if(rs!=null) {try{rs.close();}catch (SQLException s) {s.printStackTrace();}}
			if(pstmt!=null) {try{pstmt.close();}catch (SQLException s) {s.printStackTrace();}}
			if(conn!=null) {try{conn.close();}catch (SQLException s) {s.printStackTrace();}}
		}
		return x;
	}
}