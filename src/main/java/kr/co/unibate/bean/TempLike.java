
package kr.co.unibate.bean;

import java.sql.Timestamp;
import java.util.Date;



public class TempLike {
	private String id;
	private Timestamp tmp_date;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Timestamp getTmp_date() {
		return tmp_date;
	}
	public void setTmp_date(Timestamp tmp_date) {
		this.tmp_date = tmp_date;
	}
}
