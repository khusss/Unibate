package kr.co.unibate.bean;

import java.sql.Timestamp;

public class RecruitingBoard {
	private int recruit_board_num;
	private String recruit_content;
	private String recruit_subject;
	private Timestamp recruit_date;
	private int recruit_hits; 
	private String id;
	private String img;
	
	
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public int getRecruit_board_num() {
		return recruit_board_num;
	}
	public void setRecruit_board_num(int recruit_board_num) {
		this.recruit_board_num = recruit_board_num;
	}
	public String getRecruit_content() {
		return recruit_content;
	}
	public void setRecruit_content(String recruit_content) {
		this.recruit_content = recruit_content;
	}
	public String getRecruit_subject() {
		return recruit_subject;
	}
	public void setRecruit_subject(String recruit_subject) {
		this.recruit_subject = recruit_subject;
	}
	public Timestamp getRecruit_date() {
		return recruit_date;
	}
	public void setRecruit_date(Timestamp recruit_date) {
		this.recruit_date = recruit_date;
	}
	public int getRecruit_hits() {
		return recruit_hits;
	}
	public void setRecruit_hits(int recruit_hits) {
		this.recruit_hits = recruit_hits;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
}
