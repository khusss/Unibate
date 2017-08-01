package kr.co.unibate.bean;

import java.sql.Timestamp;

public class SuggestionBoard {
	
	private int suggestion_board_num;
	private String suggestion_content;
	private String suggestion_subject;
	private Timestamp suggestion_date;
	private String id;
	private int suggestion_hit;
	
	public int getSuggestion_board_num() {
		return suggestion_board_num;
	}
	public void setSuggestion_board_num(int suggestion_board_num) {
		this.suggestion_board_num = suggestion_board_num;
	}
	public String getSuggestion_content() {
		return suggestion_content;
	}
	public void setSuggestion_content(String suggestion_content) {
		this.suggestion_content = suggestion_content;
	}
	public String getSuggestion_subject() {
		return suggestion_subject;
	}
	public void setSuggestion_subject(String suggestion_subject) {
		this.suggestion_subject = suggestion_subject;
	}
	public Timestamp getSuggestion_date() {
		return suggestion_date;
	}
	public void setSuggestion_date(Timestamp suggestion_date) {
		this.suggestion_date = suggestion_date;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getSuggestion_hit() {
		return suggestion_hit;
	}
	public void setSuggestion_hit(int suggestion_hit) {
		this.suggestion_hit = suggestion_hit;
	}
	
}
