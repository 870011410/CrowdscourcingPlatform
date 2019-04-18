package org.crowd.model.dto;

import org.crowd.model.User;

public class UserDto extends User {

	// 服务商类型名称
	private String pteName;

	public UserDto() {
		super();
	}

	public UserDto(String pteName) {
		super();
		this.pteName = pteName;
	}

	public String getPteName() {
		return pteName;
	}

	public void setPteName(String pteName) {
		this.pteName = pteName;
	}

}
