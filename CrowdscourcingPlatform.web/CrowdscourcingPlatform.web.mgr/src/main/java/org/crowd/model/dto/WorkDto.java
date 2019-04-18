package org.crowd.model.dto;

import org.crowd.model.Work;

public class WorkDto extends Work {
	private String useName;	//	服务商名称
	private	String neeName;//	作品类型名称
	
	public WorkDto() {
		// TODO Auto-generated constructor stub
	}

	public WorkDto(String useName, String neeName) {
		super();
		this.useName = useName;
		this.neeName = neeName;
	}

	public String getUseName() {
		return useName;
	}

	public void setUseName(String useName) {
		this.useName = useName;
	}

	public String getNeeName() {
		return neeName;
	}

	public void setNeeName(String neeName) {
		this.neeName = neeName;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("WorkDto [useName=");
		builder.append(useName);
		builder.append(", neeName=");
		builder.append(neeName);
		builder.append("]");
		return builder.toString();
	}

	
	
	

}
