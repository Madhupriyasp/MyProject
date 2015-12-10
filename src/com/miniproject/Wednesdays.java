package com.miniproject;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

import com.google.appengine.api.datastore.Key;


@PersistenceCapable
public class Wednesdays {
	Wednesdays() {}
		
	
	@PrimaryKey
    @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
    Key wkey;
	
	
		public Key getWkey() {
		return wkey;
	}
	public void setWkey(Key wkey) {
		this.wkey = wkey;
	}

	public String getPeriod2() {
		return period2;
	}
	public void setPeriod2(String period2) {
		this.period2 = period2;
	}
	public String getPeriod3() {
		return period3;
	}
	public void setPeriod3(String period3) {
		this.period3 = period3;
	}
	public String getPeriod4() {
		return period4;
	}
	public void setPeriod4(String period4) {
		this.period4 = period4;
	}
	public String getPeriod5() {
		return period5;
	}
	public void setPeriod5(String period5) {
		this.period5 = period5;
	}
	public String getStaffname() {
		return staffname;
	}
	public void setStaffname(String staffname) {
		this.staffname = staffname;
	}
	public String getBranch() {
		return branch;
	}
	public void setBranch(String branch) {
		this.branch = branch;
	}
	public String getSemester() {
		return semester;
	}
	public void setSemester(String semester) {
		this.semester = semester;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}

	@Persistent
	private String period1;
	public String getPeriod1() {
		return period1;
	}
	public void setPeriod1(String period1) {
		this.period1 = period1;
	}
	@Persistent
	private String period2;
	@Persistent
	private String period3;
	@Persistent
	private String period4;
	@Persistent
	private String period5;
	@Persistent
	private String staffname;
	@Persistent
	private String branch;
	@Persistent
	private String semester;
	@Persistent
	private String year;

}
