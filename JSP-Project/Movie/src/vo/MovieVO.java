package vo;

public class MovieVO {
	private int movieNo;
	private String movieName;
	private int category;
	private int runtime;
	private String img;
	private String info;
<<<<<<< HEAD

	public MovieVO(int movieNo, String movieName, int category, int runtime, String img, String info) {
=======
	private int like_;

	public MovieVO(int movieNo, String movieName, int category, int runtime, String img, String info, int like_) {
>>>>>>> 271c4ebc2215e7e9646ae9ff5b791bccf6166c70
		this.movieNo = movieNo;
		this.movieName = movieName;
		this.category = category;
		this.runtime = runtime;
		this.img = img;
		this.info = info;
<<<<<<< HEAD
	}
	
	public MovieVO() {}
=======
		this.like_ = like_;
	}

	public MovieVO() {
	}

	public int getLike_() {
		return like_;
	}

	public void setLike_(int like_) {
		this.like_ = like_;
	}
>>>>>>> 271c4ebc2215e7e9646ae9ff5b791bccf6166c70

	public int getMovieNo() {
		return movieNo;
	}

	public void setMovieNo(int movieNo) {
		this.movieNo = movieNo;
	}

	public String getMovieName() {
		return movieName;
	}

	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}

	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
	}

	public int getRuntime() {
		return runtime;
	}

	public void setRuntime(int runtime) {
		this.runtime = runtime;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

}
