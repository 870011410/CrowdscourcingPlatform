package org.crowd.model;
/**
 * 
     * <p>Title : ServerTypeModel</p>
     * <p>Description : </p>
     * <p>DevelopTools : Eclipse_x64_v4.9.0</p>
     * <p>DevelopSystem : window 7</p>
     * <p>Company : org.crowd</p>
     * @author : zhengjiawei
     * @date : 2018年12月6日 下午6:57:08
     * @version : 12.0.0
 */
//服务类型对象
public class ServerTypeModel {

	//服务类型id
	private Integer id;
	//服务类型名字
	private String name;
	 
	
	public ServerTypeModel() {
		// TODO Auto-generated constructor stub
	}

	public ServerTypeModel(Integer id, String name) {
		super();
		this.id = id;
		this.name = name;
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
	
	
}
