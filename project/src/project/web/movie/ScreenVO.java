package project.web.movie;

public class ScreenVO {
	private int theaterId;	// 영화관 ID	
	private int id=0;			// 상영관 ID
	private int num;		// 좌석수
	private String name;	// 상영관 이름
	private int col;		// 상영관 행
	private int row;		// 상영관 열
	private int [] passageX=null;// 상영관 X축 통로
	private int [] passageY=null;// 상영관 Y축 통로
	private int [] noSeat=null;	// 사용할수 없는 좌석
	private String theaterName; // 영화관 이름

	public String getTheaterName() {
		return theaterName;
	}
	public void setTheaterName(String theaterName) {
		this.theaterName = theaterName;
	}
	public int getTheaterId() {
		return theaterId;
	}
	public void setTheaterId(int theaterId) {
		this.theaterId = theaterId;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getCol() {
		return col;
	}
	public void setCol(int col) {
		this.col = col;
	}
	public int getRow() {
		return row;
	}
	public void setRow(int row) {
		this.row = row;
	}
	public int[] getPassageX() {
		return passageX;
	}
	public void setPassageX(int[] passageX) {
		this.passageX = passageX;
	}
	public void setPassageX(String passageX) {		// DB에 저장되어 있는 값을 쉽게 저장하기 위해 사용
		int tmp[] = null;
		if(passageX!=null) {
			String temp [] = passageX.split("/");
			tmp = new int[temp.length];
			for(int i=0;i<tmp.length;i++) {
				tmp[i]=Integer.parseInt(temp[i]);
			}			
		}			
		this.passageX=tmp;
	}

	public int[] getPassageY() {
		return passageY;
	}
	public String getPX(){
		String tmp="";
		if(passageX!=null) {
			for(int i=0;i<passageX.length;i++) {
				if(i!=passageX.length-1) {
				tmp+=passageX[i]+"/";
				}
				else {
					tmp+=passageX[i];
				}
			}
		}
		return tmp;
	}
	public String getPY(){
		String tmp="";
		if(passageY!=null) {
			for(int i=0;i<passageY.length;i++) {
				if(i!=passageY.length-1) {
				tmp+=passageY[i]+"/";
				}
				else {
					tmp+=passageY[i];
				}
			}
		}
		return tmp;
	}
	public void setPassageY(int[] passageY) {
		this.passageY = passageY;
	}
	public void setPassageY(String passageY) {		// DB에 저장되어 있는 값을 쉽게 저장하기 위해 사용
		int tmp[] = null;
		if(passageY!=null) {
			String temp [] = passageY.split("/");
			tmp =new int[temp.length];
			for(int i=0;i<tmp.length;i++) {
				tmp[i]=Integer.parseInt(temp[i]);
			}
		}
		this.passageY=tmp;
	}
	public int[] getNoSeat() {
		return noSeat;
	}
	public void setNoSeat(int[] noSeat) {
		this.noSeat = noSeat;
	}
	public void setNoSeat(String noSeat) {		// DB에 저장되어 있는 값을 쉽게 저장하기 위해 사용
		int tmp[] = null;
		if(noSeat!=null) {
			String[] temp = noSeat.split("/");
			tmp = new int[temp.length];
			for(int i=0;i<tmp.length;i++) {
				tmp[i]=Integer.parseInt(temp[i]);
			}
		}
		this.noSeat = tmp;
	}
	public String getNS() {
		String tmp="";
		if(noSeat!=null) {
			for(int i=0;i<noSeat.length;i++) {
				if(i!=noSeat.length-1) {
					tmp+=noSeat[i]+"/";
				}
				else {
					tmp+=noSeat[i];
				}
			}
		}
		return tmp;
	}
}
