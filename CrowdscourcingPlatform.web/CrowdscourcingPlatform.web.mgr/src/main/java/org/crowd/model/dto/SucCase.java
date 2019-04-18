package org.crowd.model.dto;

/**
 * <p>Title : SucCase</p>
 * <p>Description : </p>
 * <p>DevelopTools : Eclipse_x64_v4.9.0</p>
 * <p>DevelopSystem : Win10 x64 </p>
 * <p>Company : org.Lw</p>
 * @author : Lw
 * @date : 2018年12月17日 上午9:12:51
 * @version : 12.0.0
 */
public class SucCase extends AccountDetaDto {
	// 案例ID
	private Integer sucId;
	// 案例标题
	private String sucTitle;
	// 案例内容
	private String sucContent;
	// 账务表ID
	private Integer sucAccId;
	// 案例状态
	private Integer sucState;
	private Integer sucRank;

	public SucCase() {
		super();
	}

	public SucCase(Integer sucId, String sucTitle, String sucContent, Integer sucAccId, Integer sucState,
			Integer sucRank) {
		super();
		this.sucId = sucId;
		this.sucTitle = sucTitle;
		this.sucContent = sucContent;
		this.sucAccId = sucAccId;
		this.sucState = sucState;
		this.sucRank = sucRank;
	}

	public Integer getSucId() {
		return sucId;
	}

	public void setSucId(Integer sucId) {
		this.sucId = sucId;
	}

	public String getSucTitle() {
		return sucTitle;
	}

	public void setSucTitle(String sucTitle) {
		this.sucTitle = sucTitle;
	}

	public String getSucContent() {
		return sucContent;
	}

	public void setSucContent(String sucContent) {
		this.sucContent = sucContent;
	}

	public Integer getSucAccId() {
		return sucAccId;
	}

	public void setSucAccId(Integer sucAccId) {
		this.sucAccId = sucAccId;
	}

	public Integer getSucState() {
		return sucState;
	}

	public void setSucState(Integer sucState) {
		this.sucState = sucState;
	}

	public Integer getSucRank() {
		return sucRank;
	}

	public void setSucRank(Integer sucRank) {
		this.sucRank = sucRank;
	}

}
