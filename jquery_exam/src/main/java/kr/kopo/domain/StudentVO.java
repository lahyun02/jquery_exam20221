package kr.kopo.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class StudentVO {
	private long sid;
	private String sname;
	private String dept;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date birth;
	private String sex;
	
	private long pid;
	
	public long getPid() {
		return pid;
	}
	public void setPid(long pid) {
		this.pid = pid;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public long getSid() {
		return sid;
	}
	public void setSid(long sid) {
		this.sid = sid;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	
	
}
