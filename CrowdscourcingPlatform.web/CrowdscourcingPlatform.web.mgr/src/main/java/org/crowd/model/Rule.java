package org.crowd.model;

/**
 * <p>Title : Rule</p>
 * <p>Description : </p>
 * <p>DevelopTools : Eclipse_x64_v4.9.0</p>
 * <p>DevelopSystem : Win10 x64 </p>
 * <p>Company : org.Lw</p>
 * @author : Lw
 * @date : 2018年12月17日 上午9:11:44
 * @version : 12.0.0
 */
public class Rule {

	private Integer id;// 规则编号
	private Integer rteId;// 规则类型编号
	private String content;// 规则内容
	private Integer score;// 扣分
	private Integer state;// 发布状态，0→未发布，1→已发布

	public Rule() {
		super();
	}

	public Rule(Integer id, Integer rteId, String content, Integer score, Integer state) {
		super();
		this.id = id;
		this.rteId = rteId;
		this.content = content;
		this.score = score;
		this.state = state;
	}

//----------------------get&set-------------------
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getRteId() {
		return rteId;
	}

	public void setRteId(Integer rteId) {
		this.rteId = rteId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Integer getScore() {
		return score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

}
