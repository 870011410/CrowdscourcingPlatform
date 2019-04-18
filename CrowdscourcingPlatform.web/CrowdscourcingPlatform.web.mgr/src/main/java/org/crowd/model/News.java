package org.crowd.model;
/**
 * <p>Title : News</p>
 * <p>Description : </p>
 * <p>DevelopTools : Eclipse_x64_v4.9.0</p>
 * <p>DevelopSystem : Win10 x64 </p>
 * <p>Company : org.Lw</p>
 * @author : Lw
 * @date : 2018年12月17日 上午9:12:15
 * @version : 12.0.0
 */
public class News {
	private Integer id;// 资讯ID
	private String name;// 资讯标题
	private String link;// 资讯链接
	private Integer state;// 资讯状态，上线→1，下线→0
	private String createTime;// 新建时间

	public News() {
		super();
	}

	public News(Integer id, String name, String link, Integer state, String createTime) {
		super();
		this.id = id;
		this.name = name;
		this.link = link;
		this.state = state;
		this.createTime = createTime;
	}

//------------------------get&set-----------------------------
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