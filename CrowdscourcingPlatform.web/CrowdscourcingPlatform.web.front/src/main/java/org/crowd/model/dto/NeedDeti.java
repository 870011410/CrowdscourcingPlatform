package org.crowd.model.dto;

import org.crowd.model.NeedModel;
/**
 * 
     * <p>Title : NeedDeti</p>
     * <p>Description : </p>
     * <p>DevelopTools : Eclipse_x64_v4.9.0</p>
     * <p>DevelopSystem : window 7</p>
     * <p>Company : org.crowd</p>
     * @author : zhengjiawei
     * @date : 2018年12月7日 下午2:02:38
     * @version : 12.0.0
 */
//需求管理的dto
public class NeedDeti extends NeedModel {

	//发布需求人名字
	private String userName;
	//需求类型名称
	private String nteName;
	//中标人id
	private Integer bidUserId;
	//中标人名
	private String bidUserName;
	//投标id
	private Integer bidId;
	//中标联盟id
	private Integer leaId;
	//中标联盟名
	private String leaName;
	//雇主联系电话
	private String userPhone;
	
	
	
	public NeedDeti(String userName, String nteName, Integer bidUserId, String bidUserName, Integer bidId,
			Integer leaId, String leaName, String userPhone) {
		super();
		this.userName = userName;
		this.nteName = nteName;
		this.bidUserId = bidUserId;
		this.bidUserName = bidUserName;
		this.bidId = bidId;
		this.leaId = leaId;
		this.leaName = leaName;
		this.userPhone = userPhone;
	}
	public NeedDeti() {
		// TODO Auto-generated constructor stub
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getNteName() {
		return nteName;
	}
	public void setNteName(String nteName) {
		this.nteName = nteName;
	}
	public Integer getBidUserId() {
		return bidUserId;
	}
	public void setBidUserId(Integer bidUserId) {
		this.bidUserId = bidUserId;
	}
	public String getBidUserName() {
		return bidUserName;
	}
	public void setBidUserName(String bidUserName) {
		this.bidUserName = bidUserName;
	}
	public Integer getBidId() {
		return bidId;
	}
	public void setBidId(Integer bidId) {
		this.bidId = bidId;
	}
	public Integer getLeaId() {
		return leaId;
	}
	public void setLeaId(Integer leaId) {
		this.leaId = leaId;
	}
	public String getLeaName() {
		return leaName;
	}
	public void setLeaName(String leaName) {
		this.leaName = leaName;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	
	
	
}
