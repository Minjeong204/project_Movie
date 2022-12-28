package vo;

import java.sql.Date;

public class ReviewVO {
	int num;
	String id;
	String content;
	int movieNo;
	Date writedate;
<<<<<<< HEAD
=======
	String score;
	int score_avg;
	
	
	public int getScore_avg() {
		return score_avg;
	}
	public void setScore_avg(int score_avg) {
		this.score_avg = score_avg;
	}
>>>>>>> 271c4ebc2215e7e9646ae9ff5b791bccf6166c70
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
<<<<<<< HEAD
=======
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
>>>>>>> 271c4ebc2215e7e9646ae9ff5b791bccf6166c70
	public Date getWritedate() {
		return writedate;
	}
	public void setWritedate(Date writedate) {
		this.writedate = writedate;
	}
<<<<<<< HEAD
	public ReviewVO(int num, String id, String content, int movieNo, Date writedate) {
=======
	
	public ReviewVO(int num, String id, String content, int movieNo, String score, Date writedate) {
>>>>>>> 271c4ebc2215e7e9646ae9ff5b791bccf6166c70
		super();
		this.num = num;
		this.id = id;
		this.content = content;
		this.movieNo = movieNo;
<<<<<<< HEAD
=======
		this.score = score;
>>>>>>> 271c4ebc2215e7e9646ae9ff5b791bccf6166c70
		this.writedate = writedate;
	}
	
	public ReviewVO() {}
	
}
