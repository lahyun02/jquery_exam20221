package kr.kopo.domain;

public class SampleVO {
	
	private Integer mno;
	private String firstname;
	private String lastName;
	
	public SampleVO() {
		super();
	}
	
	public SampleVO(Integer mno, String firstname, String lastName) {
		super();
		this.mno = mno;
		this.firstname = firstname;
		this.lastName = lastName;
	}
	     
	public Integer getMno() {
		return mno;
	}
	public void setMno(Integer mno) {
		this.mno = mno;
	}
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	
	
}
