package org.crowd.model;
/**
 * 
     * <p>Title : TenderModel</p>
     * <p>Description : </p>
     * <p>DevelopTools : Eclipse_x64_v4.9.0</p>
     * <p>DevelopSystem : macOS Sierra 10.12.1</p>
     * <p>Company : org.crowds</p>
     * @author : zhengjiawei
     * @date : 2018年12月13日 上午10:41:48
     * @version : 12.0.0
 */
//投标表对象
public class TenderModel {

	//投标id
	private Integer id;
	//需求id
	private Integer neeId;
	//联盟id
	private Integer leaId;
	//服务商id
	private Integer useId;
	//金额
	private Double money;
	//状态 0 投标中 1 中标 2 已完成
	private Integer stste;
	//竞标方案
	private String project;
	//备注
	private String meeo;
	//创建时间（投标时间）
	private String createTime;
	//修改时间
	private String updateTime;
	public TenderModel() {
		// TODO Auto-generated constructor stub
	}
	public TenderModel(Integer id, Integer neeId, Integer leaId, Integer useId, Double money, Integer stste,
			String project, String meeo, String createTime, String updateTime) {
		super();
		this.id = id;
		this.neeId = neeId;
		this.leaId = leaId;
		this.useId = useId;
		this.money = money;
		this.stste = stste;
		this.project = project;
		this.meeo = meeo;
		this.createTime = createTime;
		this.updateTime = updateTime;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getNeeId() {
		return neeId;
	}
	public void setNeeId(Integer neeId) {
		this.neeId = neeId;
	}
	public Integer getLeaId() {
		return leaId;
	}
	public void setLeaId(Integer leaId) {
		this.leaId = leaId;
	}
	public Integer getUseId() {
		return useId;
	}
	public void setUseId(Integer useId) {
		this.useId = useId;
	}
	public Double getMoney() {
		return money;
	}
	public void setMoney(Double money) {
		this.money = money;
	}
	public Integer getStste() {
		return stste;
	}
	public void setStste(Integer stste) {
		this.stste = stste;
	}
	public String getProject() {
		return project;
	}
	public void setProject(String project) {
		this.project = project;
	}
	public String getMeeo() {
		return meeo;
	}
	public void setMeeo(String meeo) {
		this.meeo = meeo;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}
	
	
	
	
}
