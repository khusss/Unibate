package kr.co.unibate.bean;


public class User {
	private String id;
	private String pwd;
	private String name;
	private String gender;
	private String area;
	private String school;
	private String major;
	private String email;
	private int score;
	private int club_num;
	private int club_flag;
	private int rank;
	private int opinion_num;
	private String club_name;
	
	public String getClub_name() {
		return club_name;
	}
	public void setClub_name(String club_name) {
		this.club_name = club_name;
	}
	public int getClub_flag() {
		return club_flag;
	}
	public void setClub_flag(int club_flag) {
		this.club_flag = club_flag;
	}
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getSchool() {
		return school;
	}
	public void setSchool(String school) {
		this.school = school;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public int getClub_num() {
		return club_num;
	}
	public void setClub_num(int club_num) {
		this.club_num = club_num;
	}
	public int getOpinion_num() {
		return opinion_num;
	}
	public void setOpinion_num(int opinion_num) {
		this.opinion_num = opinion_num;
	}

}


