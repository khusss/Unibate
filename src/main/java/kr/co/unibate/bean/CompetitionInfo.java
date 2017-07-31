package kr.co.unibate.bean;

public class CompetitionInfo {
	
	private int info_code;
	private String competition_date;
	private String competition_name;
	private String competition_url;
	private String competition_local;
	
	
	public String getCompetition_name() {
		return competition_name;
	}
	public void setCompetition_name(String competition_name) {
		this.competition_name = competition_name;
	}
	public int getInfo_code() {
		return info_code;
	}
	public void setInfo_code(int info_code) {
		this.info_code = info_code;
	}
	public String getCompetition_date() {
		return competition_date;
	}
	public void setCompetition_date(String competition_date) {
		this.competition_date = competition_date;
	}
	public String getCompetition_url() {
		return competition_url;
	}
	public void setCompetition_url(String competition_url) {
		this.competition_url = competition_url;
	}
	public String getCompetition_local() {
		return competition_local;
	}
	public void setCompetition_local(String competition_local) {
		this.competition_local = competition_local;
	}
	
	
}
