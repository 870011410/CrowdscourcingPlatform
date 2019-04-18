package org.crowd.model.dto;

import org.crowd.model.TenderModel;
/**
 * 
     * <p>Title : TenderMegTableDto</p>
     * <p>Description : </p>
     * <p>DevelopTools : Eclipse_x64_v4.9.0</p>
     * <p>DevelopSystem : macOS Sierra 10.12.1</p>
     * <p>Company : org.crowds</p>
     * @author : zhengjiawei
     * @date : 2018年12月14日 下午1:34:20
     * @version : 12.0.0
 */
//查看投标信息的dto(服务商)
public class TenderMegTableDto extends TenderModel {

	//投标人姓名
	private String userName;
	//投标服务商类型名
	private String typeName;
	//投标人自我介绍
	private String memo;
	//投标人电话
	private String phone;
	
	//投标联盟名
	private String leaName;
	//联盟自我介绍
	private String leaMemo;
	
	public TenderMegTableDto() {
		// TODO Auto-generated constructor stub
	}

	
	


	





	public TenderMegTableDto(String userName, String typeName, String memo, String phone, String leaName,
			String leaMemo) {
		super();
		this.userName = userName;
		this.typeName = typeName;
		this.memo = memo;
		this.phone = phone;
		this.leaName = leaName;
		this.leaMemo = leaMemo;
	}











	public String getLeaName() {
		return leaName;
	}











	public void setLeaName(String leaName) {
		this.leaName = leaName;
	}











	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}





	public String getLeaMemo() {
		return leaMemo;
	}





	public void setLeaMemo(String leaMemo) {
		this.leaMemo = leaMemo;
	}
	
	
}
