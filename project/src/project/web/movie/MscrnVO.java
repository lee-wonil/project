package project.web.movie;

import java.util.Date;

public class MscrnVO {
	private int id;
	private int m_id;
	private int s_id;
	private Date m_date;
	private String m_startTime;
	private String m_endTime;
	private int m_poseat;
	private int m_price;
	private String m_title;
	
	public String getM_title() {
		return m_title;
	}
	public void setM_title(String m_title) {
		this.m_title = m_title;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getM_id() {
		return m_id;
	}
	public void setM_id(int m_id) {
		this.m_id = m_id;
	}
	public int getS_id() {
		return s_id;
	}
	public void setS_id(int s_id) {
		this.s_id = s_id;
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
	public int getM_poseat() {
		return m_poseat;
	}
	public void setM_poseat(int m_poseat) {
		this.m_poseat = m_poseat;
	}
	public int getM_price() {
		return m_price;
	}
	public void setM_price(int m_price) {
		this.m_price = m_price;
	}
	
}
