package project.web.movie;

public class MovieVO {
	private int m_id;		// 영화테이블id
	private String m_title;	// 영화제목
	private int m_time;		// 상영시간
	private int m_gen;		// 장르id
	private String m_pic;	// 포스터 저장경로
	private int m_sco;		// 별점
	private int m_public;	// 관객수 
	private int m_grade;	// 등급
	private String m_genName;
	private String m_gradeName;
	
	public String getM_genName() {
		return m_genName;
	}
	public void setM_genName(String m_genName) {
		this.m_genName = m_genName;
	}
	public String getM_gradeName() {
		return m_gradeName;
	}
	public void setM_gradeName(String m_gradeName) {
		this.m_gradeName = m_gradeName;
	}
	public int getM_id() {
		return m_id;
	}
	public void setM_id(int m_id) {
		this.m_id = m_id;
	}
	public String getM_title() {
		return m_title;
	}
	public void setM_title(String m_title) {
		this.m_title = m_title;
	}
	public int getM_time() {
		return m_time;
	}
	public void setM_time(int m_time) {
		this.m_time = m_time;
	}
	public int getM_gen() {
		return m_gen;
	}
	public void setM_gen(int m_gen) {
		this.m_gen = m_gen;
	}
	public String getM_pic() {
		return m_pic;
	}
	public void setM_pic(String m_pic) {
		this.m_pic = m_pic;
	}
	public int getM_sco() {
		return m_sco;
	}
	public void setM_sco(int m_sco) {
		this.m_sco = m_sco;
	}
	public int getM_public() {
		return m_public;
	}
	public void setM_public(int m_public) {
		this.m_public = m_public;
	}
	public int getM_grade() {
		return m_grade;
	}
	public void setM_grade(int m_grade) {
		this.m_grade = m_grade;
	}
	
	
}
