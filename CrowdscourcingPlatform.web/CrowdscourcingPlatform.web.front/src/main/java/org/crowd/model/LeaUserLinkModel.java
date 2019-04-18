package org.crowd.model;
/**
 * 
     * <p>Title : LeaUserLinkModel</p>
     * <p>Description : </p>
     * <p>DevelopTools : Eclipse_x64_v4.9.0</p>
     * <p>DevelopSystem : macOS Sierra 10.12.1</p>
     * <p>Company : org.crowds</p>
     * @author : zhengjiawei
     * @date : 2018年12月17日 上午11:10:21
     * @version : 12.0.0
 */
//服务商联盟关系表
public class LeaUserLinkModel {

	//关系表id
	private Integer id;
	//服务商id
	private Integer userId;
	//联盟id
	private Integer leaId;
	//审核状态(0 待审核 1 通过 2 不通过)
	private Integer state;
	
	//备注
	private String memo;
	//申请时间
	private String createTime;
	//修改时间
	private String updateTime;
	
	public LeaUserLinkModel() {
		// TODO Auto-generated constructor stub
	}

	public LeaUserLinkModel(Integer id, Integer userId, Integer leaId, Integer state, String memo, String createTime,
			String updateTime) {
		super();
		this.id = id;
		this.userId = userId;
		this.leaId = leaId;
		this.state = state;
		this.memo = memo;
		this.createTime = createTime;
		this.updateTime = updateTime;
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

	public Integer getLeaId() {
		return leaId;
	}

	public void setLeaId(Integer leaId) {
		this.leaId = leaId;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
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

	public String getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}
	
	
}
