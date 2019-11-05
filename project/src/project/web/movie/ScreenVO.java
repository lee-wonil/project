package project.web.movie;

public class ScreenVO {
	private int theaterId;	// ��ȭ�� ID	
	private int id=0;			// �󿵰� ID
	private int num;		// �¼���
	private String name;	// �󿵰� �̸�
	private int col;		// �󿵰� ��
	private int row;		// �󿵰� ��
	private int [] passageX=null;// �󿵰� X�� ���
	private int [] passageY=null;// �󿵰� Y�� ���
	private int [] noSeat=null;	// ����Ҽ� ���� �¼�
	private String theaterName; // ��ȭ�� �̸�

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
	public void setPassageX(String passageX) {		// DB�� ����Ǿ� �ִ� ���� ���� �����ϱ� ���� ���
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
	public void setPassageY(String passageY) {		// DB�� ����Ǿ� �ִ� ���� ���� �����ϱ� ���� ���
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
	public void setNoSeat(String noSeat) {		// DB�� ����Ǿ� �ִ� ���� ���� �����ϱ� ���� ���
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
