package org.crowd.model.dto;

import org.crowd.model.LeaModel;
/**
 * 
     * <p>Title : LeaMange</p>
     * <p>Description : </p>
     * <p>DevelopTools : Eclipse_x64_v4.9.0</p>
     * <p>DevelopSystem : window 7</p>
     * <p>Company : org.crowd</p>
     * @author : zhengjiawei
     * @date : 2018年12月8日 上午10:23:32
     * @version : 12.0.0
 */
//继承于联盟表model 用于联盟管理的表格显示
public class LeaMange extends LeaModel {

	//盟主名字
	private String userName;
	public LeaMange() {
		// TODO Auto-generated constructor stub
	}
	public LeaMange(String userName) {
		super();
		this.userName = userName;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	
	
	
}
