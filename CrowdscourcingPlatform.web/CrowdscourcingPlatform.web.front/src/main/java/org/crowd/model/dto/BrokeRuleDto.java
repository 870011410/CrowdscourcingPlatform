package org.crowd.model.dto;

import org.crowd.model.BrokeRule;

public class BrokeRuleDto extends BrokeRule {
	private Integer ruleTypeId; // 规则类型ID
	private String ruleTypeName; // 规则类型名字
	private Integer ruleId; // 规则ID
	private String ruleContent; // 规则内容
	private String useName; // 用户名

	public BrokeRuleDto() {
		// TODO Auto-generated constructor stub
	}

	public BrokeRuleDto(Integer ruleTypeId, String ruleTypeName, Integer ruleId, String ruleContent, String useName) {
		super();
		this.ruleTypeId = ruleTypeId;
		this.ruleTypeName = ruleTypeName;
		this.ruleId = ruleId;
		this.ruleContent = ruleContent;
		this.useName = useName;
	}

	public Integer getRuleTypeId() {
		return ruleTypeId;
	}

	public void setRuleTypeId(Integer ruleTypeId) {
		this.ruleTypeId = ruleTypeId;
	}

	public String getRuleTypeName() {
		return ruleTypeName;
	}

	public void setRuleTypeName(String ruleTypeName) {
		this.ruleTypeName = ruleTypeName;
	}

	public Integer getRuleId() {
		return ruleId;
	}

	public void setRuleId(Integer ruleId) {
		this.ruleId = ruleId;
	}

	public String getRuleContent() {
		return ruleContent;
	}

	public void setRuleContent(String ruleContent) {
		this.ruleContent = ruleContent;
	}

	public String getUseName() {
		return useName;
	}

	public void setUseName(String useName) {
		this.useName = useName;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("BrokeRuleDto [ruleTypeId=");
		builder.append(ruleTypeId);
		builder.append(", ruleTypeName=");
		builder.append(ruleTypeName);
		builder.append(", ruleId=");
		builder.append(ruleId);
		builder.append(", ruleContent=");
		builder.append(ruleContent);
		builder.append(", useName=");
		builder.append(useName);
		builder.append("]");
		return builder.toString();
	}

}
