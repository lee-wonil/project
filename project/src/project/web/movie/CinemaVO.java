package project.web.movie;

public class CinemaVO {
	private int c_id; // ��ȭ�� ���̵�
	private String c_name;// ��ȭ���̸�
	private String c_address;// ��ȭ�� �ּ�
	private int l_id; // ��ȭ�� ���� ���̵�
	private String l_name;// �����̸�
	public String getL_name() {
		return l_name;
	}
	public void setL_name(String l_name) {
		this.l_name = l_name;
	}
	public int getC_id() {
		return c_id;
	}
	public void setC_id(int c_id) {
		this.c_id = c_id;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public String getC_address() {
		return c_address;
	}
	public void setC_address(String c_address) {
		this.c_address = c_address;
	}
	public int getL_id() {
		return l_id;
	}
	public void setL_id(int l_id) {
		this.l_id = l_id;
	}
	
}