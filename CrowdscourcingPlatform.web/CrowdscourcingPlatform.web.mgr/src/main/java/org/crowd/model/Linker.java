package org.crowd.model;

/**
 * 
 * <p>
 * Title : Linker
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
 * @date : 2018年12月8日 下午2:19:05
 * 
 * @version : 12.0.0
 */
public class Linker {
	private Integer id;
	private String name;
	private String link;
	private Integer state;
	private String createTime;

	public Linker() {
		super();
	}

	public Linker(Integer id, String name, String link, Integer state, String createTime) {
		super();
		this.id = id;
		this.name = name;
		this.link = link;
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
