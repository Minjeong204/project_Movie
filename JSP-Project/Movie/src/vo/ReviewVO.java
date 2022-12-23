package vo;

import java.sql.Date;

public class ReviewVO {
	int num;
	String id;
	String content;
	int movieNo;
	Date writedate;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getMovieNo() {
		return movieNo;
	}
	public void setMovieNo(int movieNo) {
		this.movieNo = movieNo;
	}
	public Date getWritedate() {
		return writedate;
	}
	public void setWritedate(Date writedate) {
		this.writedate = writedate;
	}
	public ReviewVO(int num, String id, String content, int movieNo, Date writedate) {
		super();
		this.num = num;
		this.id = id;
		this.content = content;
		this.movieNo = movieNo;
		this.writedate = writedate;
	}
	
	public ReviewVO() {}
	
}
