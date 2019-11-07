package project.web.movie;

import java.util.Date;

public class MpVO {
	private int m_id;	// 영화아이디
	private String m_title; // 영화이름
	private String c_name; // 상영관 이름
	private String name;
	private Date m_date;// 해당 영화의 상영일자
	private String m_startTime;// 시작시간
	private String m_endTime;//종료시간
	private int payNum;
	public int getPayNum() {
		return payNum;
	}
	public void setPayNum(int payNum) {
		this.payNum = payNum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public Date getM_date() {
		return m_date;
	}
	public void setM_date(Date m_date) {
		this.m_date = m_date;
	}
	public String getM_startTime() {
		return m_startTime;
	}
	public void setM_startTime(String m_startTime) {
		this.m_startTime = m_startTime;
	}
	public String getM_endTime() {
		return m_endTime;
	}
	public void setM_endTime(String m_endTime) {
		this.m_endTime = m_endTime;
	}
	

}
