package kr.co.unibate.bean;

import java.sql.Timestamp;

public class SuggestReply {
	private int suggestion_board_num;
	private int sg_reply_num;
	private String sg_reply;
	private int sg_like;
	private int sg_dislike;
	private Timestamp sg_reply_date;
	private String id;
	
	
	public int getSuggestion_board_num() {
		return suggestion_board_num;
	}
	public void setSuggestion_board_num(int suggestion_board_num) {
		this.suggestion_board_num = suggestion_board_num;
	}
	public int getSg_reply_num() {
		return sg_reply_num;
	}
	public void setSg_reply_num(int sg_reply_num) {
		this.sg_reply_num = sg_reply_num;
	}
	public String getSg_reply() {
		return sg_reply;
	}
	public void setSg_reply(String sg_reply) {
		this.sg_reply = sg_reply;
	}
	public int getSg_like() {
		return sg_like;
	}
	public void setSg_like(int sg_like) {
		this.sg_like = sg_like;
	}
	public int getSg_dislike() {
		return sg_dislike;
	}
	public void setSg_dislike(int sg_dislike) {
		this.sg_dislike = sg_dislike;
	}
	public Timestamp getSg_reply_date() {
		return sg_reply_date;
	}
	public void setSg_reply_date(Timestamp sg_reply_date) {
		this.sg_reply_date = sg_reply_date;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
}
