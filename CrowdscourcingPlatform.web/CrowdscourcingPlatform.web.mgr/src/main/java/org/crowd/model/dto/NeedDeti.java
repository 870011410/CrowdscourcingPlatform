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
	public NeedDeti(String userName, String nteName) {
		super();
		this.userName = userName;
		this.nteName = nteName;
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
	
	
}
