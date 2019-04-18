package org.crowd.model.dto;

import org.crowd.model.Work;

public class WorkDto extends Work {
	private String useName; // 服务商名称
	private String neeName;// 作品类型名称
	private Integer buyerId;// 顾客名称
	private String phone;// 卖家电话

	public WorkDto() {
		// TODO Auto-generated constructor stub
	}

	public WorkDto(String useName, String neeName, Integer buyerId, String phone) {
		super();
		this.useName = useName;
		this.neeName = neeName;
		this.buyerId = buyerId;
		this.phone = phone;
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

	public Integer getBuyerId() {
		return buyerId;
	}

	public void setBuyerId(Integer buyerId) {
		this.buyerId = buyerId;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("WorkDto [useName=");
		builder.append(useName);
		builder.append(", neeName=");
		builder.append(neeName);
		builder.append(", buyerId=");
		builder.append(buyerId);
		builder.append(", phone=");
		builder.append(phone);
		builder.append("]");
		return builder.toString();
	}

}
