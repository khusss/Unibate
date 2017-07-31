package kr.co.unibate.bean;

import java.sql.Date;

public class Proposal {
	
	private int proposal_num;
	private int proposal_flag;
	private String proposal_subject;
	private String proposal_content;
	private String id ;
	private Date proposal_date;
	public int getProposal_num() {
		return proposal_num;
	}
	public void setProposal_num(int proposal_num) {
		this.proposal_num = proposal_num;
	}
	public int getProposal_flag() {
		return proposal_flag;
	}
	public void setProposal_flag(int proposal_flag) {
		this.proposal_flag = proposal_flag;
	}
	public String getProposal_subject() {
		return proposal_subject;
	}
	public void setProposal_subject(String proposal_subject) {
		this.proposal_subject = proposal_subject;
	}
	public String getProposal_content() {
		return proposal_content;
	}
	public void setProposal_content(String proposal_content) {
		this.proposal_content = proposal_content;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getProposal_date() {
		return proposal_date;
	}
	public void setProposal_date(Date proposal_date) {
		this.proposal_date = proposal_date;
	}
	
	
}
