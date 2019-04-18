package org.crowd.model.dto;

import org.crowd.model.LeaUserLinkModel;
/**
 * 
     * <p>Title : LeaUserLinkDto</p>
     * <p>Description : </p>
     * <p>DevelopTools : Eclipse_x64_v4.9.0</p>
     * <p>DevelopSystem : macOS Sierra 10.12.1</p>
     * <p>Company : org.crowds</p>
     * @author : zhengjiawei
     * @date : 2018年12月19日 上午8:44:56
     * @version : 12.0.0
 */
//联盟成员关系表
public class LeaUserLinkDto extends LeaUserLinkModel {
    
	//成员名字
	private String leaUserName;
	public LeaUserLinkDto() {
		// TODO Auto-generated constructor stub
	}
	public LeaUserLinkDto(String leaUserName) {
		super();
		this.leaUserName = leaUserName;
	}
	public String getLeaUserName() {
		return leaUserName;
	}
	public void setLeaUserName(String leaUserName) {
		this.leaUserName = leaUserName;
	}
	
	
}
