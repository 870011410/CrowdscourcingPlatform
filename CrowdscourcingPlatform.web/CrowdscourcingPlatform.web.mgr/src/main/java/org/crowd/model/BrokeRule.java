package org.crowd.model;

public class BrokeRule {
	private Integer id;			//违规记录ID
	private Integer userId;		//用户ID
	private Integer ruleId;		//规则ID
	private Integer state;		//状态
	private Integer rank;		//排序号
	private	String createTime;	//发布时间
	
	public BrokeRule() {
		// TODO Auto-generated constructor stub
	}

	public BrokeRule(Integer id, Integer userId, Integer ruleId, Integer state, Integer rank, String createTime) {
		super();
		this.id = id;
		this.userId = userId;
		this.ruleId = ruleId;
		this.state = state;
		this.rank = rank;
		this.createTime = createTime;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getRuleId() {
		return ruleId;
	}

	public void setRuleId(Integer ruleId) {
		this.ruleId = ruleId;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public Integer getRank() {
		return rank;
	}

	public void setRank(Integer rank) {
		this.rank = rank;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("BrokeRule [id=");
		builder.append(id);
		builder.append(", userId=");
		builder.append(userId);
		builder.append(", ruleId=");
		builder.append(ruleId);
		builder.append(", state=");
		builder.append(state);
		builder.append(", rank=");
		builder.append(rank);
		builder.append(", createTime=");
		builder.append(createTime);
		builder.append("]");
		return builder.toString();
	}
	
	

}
