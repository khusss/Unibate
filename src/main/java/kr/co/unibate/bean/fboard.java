package kr.co.unibate.bean;

import java.sql.Timestamp;

public class fboard {
	private int fboard_num;
	private String fboard_content;
	private String fboard_subject;
	private Timestamp fboard_date;
	private String id;
	private int fboard_hit;
	private String urldata;
	private int f_like;
	private int f_dislike;
	
	public int getF_like() {
		return f_like;
	}
	public void setF_like(int f_like) {
		this.f_like = f_like;
	}
	public int getF_dislike() {
		return f_dislike;
	}
	public void setF_dislike(int f_dislike) {
		this.f_dislike = f_dislike;
	}
	public String getUrldata() {
		return urldata;
	}
	public void setUrldata(String urldata) {
		this.urldata = urldata;
	}
	public int getFboard_num() {
		return fboard_num;
	}
	public void setFboard_num(int fboard_num) {
		this.fboard_num = fboard_num;
	}
	public String getFboard_content() {
		return fboard_content;
	}
	public void setFboard_content(String fboard_content) {
		this.fboard_content = fboard_content;
	}
	public String getFboard_subject() {
		return fboard_subject;
	}
	public void setFboard_subject(String fboard_subject) {
		this.fboard_subject = fboard_subject;
	}
	public Timestamp getFboard_date() {
		return fboard_date;
	}
	public void setFboard_date(Timestamp fboard_date) {
		this.fboard_date = fboard_date;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getFboard_hit() {
		return fboard_hit;
	}
	public void setFboard_hit(int fboard_hit) {
		this.fboard_hit = fboard_hit;
	}
}
