package org.crowd.model;

/**
 * 
 * <p>
 * Title : NeedTypeModel
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
 * @date : 2018年12月6日 下午3:18:51
 * @version : 12.0.0
 */
//需求（作品）类型表的对象
public class NeedTypeModel {

	// 需求类型id
	private Integer id;
	// 需求类型名
	private String name;
	// 服务类型id
	private Integer steId;

	public NeedTypeModel() {
		// TODO Auto-generated constructor stub
	}

	public NeedTypeModel(Integer id, String name, Integer steId) {
		super();
		this.id = id;
		this.name = name;
		this.steId = steId;
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

	public Integer getSteId() {
		return steId;
	}

	public void setSteId(Integer steId) {
		this.steId = steId;
	}

}
