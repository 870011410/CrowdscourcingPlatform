package org.crowd.model;

public class Log {

	private Integer id;
	private String content;
	private String name;
	private String createTime;

	public Log() {
		super();
	}

	public Log(Integer id, String content, String name, String createTime) {
		super();
		this.id = id;
		this.content = content;
		this.name = name;
		this.createTime = createTime;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

}
