//
//
//  Generated by StarUML(tm) Java Add-In
//
//  @ Project : Untitled
//  @ File Name : RTOpinion.java
//  @ Date : 2017-07-06
//  @ Author : 
//
//


package kr.co.unibate.bean;

import java.sql.Timestamp;
import java.util.Date;

public class RTOpinion {
	private int group_num;
	private int opinion_num;
	private int d_num;
	private String id;
	private String school;
	
	public String getSchool() {
		return school;
	}
	public void setSchool(String school) {
		this.school = school;
	}
	public Timestamp getOpinion_date() {
		return opinion_date;
	}
	public void setOpinion_date(Timestamp opinion_date) {
		this.opinion_date = opinion_date;
	}
	private String d_opinion;
	private Timestamp opinion_date;
	public int getGroup_num() {
		return group_num;
	}
	public void setGroup_num(int group_num) {
		this.group_num = group_num;
	}
	public int getOpinion_num() {
		return opinion_num;
	}
	public void setOpinion_num(int opinion_num) {
		this.opinion_num = opinion_num;
	}
	public int getD_num() {
		return d_num;
	}
	public void setD_num(int d_num) {
		this.d_num = d_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getD_opinion() {
		return d_opinion;
	}
	public void setD_opinion(String d_opinion) {
		this.d_opinion = d_opinion;
	}


}
