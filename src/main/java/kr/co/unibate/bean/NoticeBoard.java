package kr.co.unibate.bean;

import java.sql.Date;

public class NoticeBoard {
	
	private int notice_board_num;
	private String notice_content;
	private String notice_subject;
	private Date notice_date;
	private int notice_hits;
	
	
	public int getNotice_board_num() {
		return notice_board_num;
	}
	public void setNotice_board_num(int notice_board_num) {
		this.notice_board_num = notice_board_num;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public String getNotice_subject() {
		return notice_subject;
	}
	public void setNotice_subject(String notice_subject) {
		this.notice_subject = notice_subject;
	}
	public Date getNotice_date() {
		return notice_date;
	}
	public void setNotice_date(Date notice_date) {
		this.notice_date = notice_date;
	}
	public int getNotice_hits() {
		return notice_hits;
	}
	public void setNotice_hits(int notice_hits) {
		this.notice_hits = notice_hits;
	}
}
