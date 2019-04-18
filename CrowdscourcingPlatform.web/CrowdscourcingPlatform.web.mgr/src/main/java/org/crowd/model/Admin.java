package org.crowd.model;

public class Admin {
	
	private Integer id;
	private String acc;
	private String pwd;
	private String name;
	private String memo;
	private String createTime;
	
	public Admin() {
		super();
	}

	public Admin(Integer id, String acc, String pwd, String name, String memo, String createTime) {
		super();
		this.id = id;
		this.acc = acc;
		this.pwd = pwd;
		this.name = name;
		this.memo = memo;
		this.createTime = createTime;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getAcc() {
		return acc;
	}

	public void setAcc(String acc) {
		this.acc = acc;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

}
