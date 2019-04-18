package org.crowd.model;

/**
 * 
 * <p>
 * Title : LeaModel
 * </p>
 * <p>
 * Description :
 * </p>
 * <p>
 * DevelopTools : Eclipse_x64_v4.9.0
 * </p>
 * <p>
 * DevelopSystem : window 7
 * </p>
 * <p>
 * Company : org.crowd
 * </p>
 * 
 * @author : zhengjiawei
 * @date : 2018年12月8日 上午10:17:10
 * @version : 12.0.0
 */
//联盟表的对象
public class LeaModel {

	// id
	private Integer id;
	// 联盟名字
   private String name;
   //盟主id
   private Integer userId;
   //审核时间
   private String auditTime;
   //审核状态 0 待审核 1 审核通过 2 审核不通过 3 违规封杀
   private Integer state;
   //备注
   private String memo;
   //创建时间
   private String createTime;
   //修改时间
   private String updateTime;
   
   public LeaModel() {
	// TODO Auto-generated constructor stub
}

public LeaModel(Integer id, String name, Integer userId, String auditTime, Integer state, String memo,
		String createTime, String updateTime) {
	super();
	this.id = id;
	this.name = name;
	this.userId = userId;
	this.auditTime = auditTime;
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

public String getName() {
	return name;
}

public void setName(String name) {
	this.name = name;
}

public Integer getUserId() {
	return userId;
}

public void setUserId(Integer userId) {
	this.userId = userId;
}

public String getAuditTime() {
	return auditTime;
}

public void setAuditTime(String auditTime) {
	this.auditTime = auditTime;
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
