package org.crowd.model;
/**
 * 
 * <p>
 * Title : Story
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
 * @date : 2018年12月7日 下午2:13:33
 * 
 * @version : 12.0.0
 */
public class Story {

	// 故事ID、标题、内容、雇主名字、状态、排序、发布时间
	private Integer id;
	private String title;
	private String content;
	private String useName;
	private Integer state;
	private Integer rank;
	private String createTime;

	public Story() {
		super();
	}

	public Story(Integer id, String title, String content, String useName, Integer state, Integer rank,
			String createTime) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.useName = useName;
		this.state = state;
		this.rank = rank;
		this.createTime = createTime;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getUseName() {
		return useName;
	}

	public void setUseName(String useName) {
		this.useName = useName;
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

	public Integer getRank() {
		return rank;
	}

	public void setRank(Integer rank) {
		this.rank = rank;
	}

}
