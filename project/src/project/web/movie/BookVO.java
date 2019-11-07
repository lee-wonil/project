package project.web.movie;

import java.util.Date;

public class BookVO {
	private int id;	// 테이블 아이디
	private int t_id;	// 시간표 아이디
	private String u_id;	// 유저 아이디
	private int seat;	// 좌석번호
	private int payment;	// 결제번호
	private Date booktime;	// 예매시간
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getT_id() {
		return t_id;
	}
	public void setT_id(int t_id) {
		this.t_id = t_id;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public int getSeat() {
		return seat;
	}
	public void setSeat(int seat) {
		this.seat = seat;
	}
	public int getPayment() {
		return payment;
	}
	public void setPayment(int payment) {
		this.payment = payment;
	}
	public Date getBooktime() {
		return booktime;
	}
	public void setBooktime(Date booktime) {
		this.booktime = booktime;
	}
}
