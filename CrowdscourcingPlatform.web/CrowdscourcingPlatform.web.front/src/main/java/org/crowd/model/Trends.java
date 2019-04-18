package org.crowd.model;

/**
 * 
 * <p>
 * Title : Trends
 * </p>
 * 
 * <p>
 * Description :
 * </p>
 * 
 * <p>
 * DevelopTools : Eclipse_x64_v4.9.0
 * </p>
 * 
 * <p>
 * DevelopSystem : Windows10
 * </p>
 * 
 * <p>
 * Company : org.wf
 * </p>
 * 
 * @author : WuFan
 * 
 * @date : 2018年12月7日 下午2:13:16
 * 
 * @version : 12.0.0
 */
public class Trends {

	/*
	 * TRE_ID , TRE_NAME , TRE_LINK , TRE_STE_ID NUMBER(10), TRE_STATE NUMBER(2),
	 * TRE_MEMO , TRE_CREATE_TIME , TRE_UPDATE_TIME ,
	 */

	private Integer id;
	private String name;
	private String link;
	private Integer steId;
	private String steName;
	private Integer state;
	private String createTime;

	public Trends() {
		super();
	}

	public Trends(Integer id, String name, String link, Integer steId, String steName, Integer state,
			String createTime) {
		super();
		this.id = id;
		this.name = name;
		this.link = link;
		this.steId = steId;
		this.steName = steName;
		this.state = state;
		this.createTime = createTime;
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

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public Integer getSteId() {
		return steId;
	}

	public void setSteId(Integer steId) {
		this.steId = steId;
	}

	public String getSteName() {
		return steName;
	}

	public void setSteName(String steName) {
		this.steName = steName;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

}
