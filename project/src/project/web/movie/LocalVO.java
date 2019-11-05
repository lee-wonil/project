package project.web.movie;

public class LocalVO {
	private int l_id;		// 장소분류 id
	private String l_name;	// 이름(ex. 서울, 인천)
	public int getL_id() {
		return l_id;
	}
	public void setL_id(int l_id) {
		this.l_id = l_id;
	}
	public String getL_name() {
		return l_name;
	}
	public void setL_name(String l_name) {
		this.l_name = l_name;
	}
}