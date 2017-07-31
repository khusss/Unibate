package kr.co.unibate.bean;

import java.sql.Timestamp;

public class FboardReply {
	private int fboard_num;
	private int f_reply_num;
	private String f_reply;
	private String id;
	private int f_like;
	private int f_dislike;
	private Timestamp f_reply_date;
	
	public Timestamp getF_reply_date() {
		return f_reply_date;
	}
	public void setF_reply_date(Timestamp f_reply_date) {
		this.f_reply_date = f_reply_date;
	}
	public int getFboard_num() {
		return fboard_num;
	}
	public void setFboard_num(int fboard_num) {
		this.fboard_num = fboard_num;
	}
	public int getF_reply_num() {
		return f_reply_num;
	}
	public void setF_reply_num(int f_reply_num) {
		this.f_reply_num = f_reply_num;
	}
	public String getF_reply() {
		return f_reply;
	}
	public void setF_reply(String f_reply) {
		this.f_reply = f_reply;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
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


}
