package kr.co.unibate.bean;

import java.sql.Timestamp;

public class ClubData {
	private int club_num;
	private String club_name;
	private Timestamp club_make_date;
	private String club_introduce_text;
	private String id;
	private String club_img;
	private String club_mem;
	private int score;
	private int rank;
	private int club_flag;
	
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
	
	
	public int getScore() {
		return score;
	}
	
	public void setScore(int score) {
		this.score = score;
	}
	
	public String getClub_mem() {
		return club_mem;
	}
	public void setClub_mem(String club_mem) {
		this.club_mem = club_mem;
	}
	public int getClub_num() {
		return club_num;
	}
	public void setClub_num(int club_num) {
		this.club_num = club_num;
	}
	public String getClub_name() {
		return club_name;
	}
	public void setClub_name(String club_name) {
		this.club_name = club_name;
	}
	public Timestamp getClub_make_date() {
		return club_make_date;
	}
	public void setClub_make_date(Timestamp club_make_date) {
		this.club_make_date = club_make_date;
	}
	public String getClub_introduce_text() {
		return club_introduce_text;
	}
	public void setClub_introduce_text(String club_introduce_text) {
		this.club_introduce_text = club_introduce_text;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getClub_img() {
		return club_img;
	}
	public void setClub_img(String club_img) {
		this.club_img = club_img;
	}

}
