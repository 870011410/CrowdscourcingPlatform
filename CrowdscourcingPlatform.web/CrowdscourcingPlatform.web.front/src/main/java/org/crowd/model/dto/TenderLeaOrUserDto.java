package org.crowd.model.dto;
/**
 * 
     * <p>Title : TenderLeaOrUserDto</p>
     * <p>Description : </p>
     * <p>DevelopTools : Eclipse_x64_v4.9.0</p>
     * <p>DevelopSystem : macOS Sierra 10.12.1</p>
     * <p>Company : org.crowds</p>
     * @author : zhengjiawei
     * @date : 2018年12月14日 上午10:27:48
     * @version : 12.0.0
 */
//显示一个需求的投标人信息dto
public class TenderLeaOrUserDto {

	//需求id
	private Integer needId;
	//投标人id
	private Integer userId;
	//投标人名字
	private String userName;
	//投标人头像
	private String userImg;
	//投标联盟id
	private Integer leaId;
	//投标联盟图标
	private String leaUrl;
	//投标联盟名字
	private String leaName;
	//投标表id
	private Integer bidId;
	
	public TenderLeaOrUserDto() {
		// TODO Auto-generated constructor stub
	}

	

	



	public TenderLeaOrUserDto(Integer needId, Integer userId, String userName, String userImg, Integer leaId,
			String leaUrl, String leaName, Integer bidId) {
		super();
		this.needId = needId;
		this.userId = userId;
		this.userName = userName;
		this.userImg = userImg;
		this.leaId = leaId;
		this.leaUrl = leaUrl;
		this.leaName = leaName;
		this.bidId = bidId;
	}







	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserImg() {
		return userImg;
	}

	public void setUserImg(String userImg) {
		this.userImg = userImg;
	}

	public Integer getLeaId() {
		return leaId;
	}

	public void setLeaId(Integer leaId) {
		this.leaId = leaId;
	}

	public String getLeaUrl() {
		return leaUrl;
	}

	public void setLeaUrl(String leaUrl) {
		this.leaUrl = leaUrl;
	}

	public String getLeaName() {
		return leaName;
	}

	public void setLeaName(String leaName) {
		this.leaName = leaName;
	}



	public Integer getNeedId() {
		return needId;
	}



	public void setNeedId(Integer needId) {
		this.needId = needId;
	}







	public Integer getBidId() {
		return bidId;
	}







	public void setBidId(Integer bidId) {
		this.bidId = bidId;
	}
	
}
