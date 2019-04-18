package org.crowd.model;
/**
 * 
     * <p>Title : AccountModel</p>
     * <p>Description : </p>
     * <p>DevelopTools : Eclipse_x64_v4.9.0</p>
     * <p>DevelopSystem : window 7</p>
     * <p>Company : org.crowd</p>
     * @author : zhengjiawei
     * @date : 2018年12月9日 上午9:57:50
     * @version : 12.0.0
 */
//对账表MODEL
public class AccountModel {

	//ID
	private Integer id;
	//雇主id
	private Integer useId;
	//服务商id
	private Integer proId;
	//联盟id
	private Integer leaId;
	//需求id
	private Integer neeId;
	//作品id
	 private Integer worId;
	//金额
	 private Double money;
	 //状态 0 待支付 1 支付成功
	 private Integer state;
	//排序
	 private Integer rank;
	 //备注
	 private String memo;
	 //创建时间
	 private String createTime;
	 //更新时间(完成交易时间)
	 private String updateTime;
	 
	 public AccountModel() {
		// TODO Auto-generated constructor stub
	}

	public AccountModel(Integer id, Integer useId, Integer proId, Integer leaId, Integer neeId, Integer worId,
			Double money, Integer state, Integer rank, String memo, String createTime, String updateTime) {
		super();
		this.id = id;
		this.useId = useId;
		this.proId = proId;
		this.leaId = leaId;
		this.neeId = neeId;
		this.worId = worId;
		this.money = money;
		this.state = state;
		this.rank = rank;
		this.memo = memo;
		this.createTime = createTime;
		this.updateTime = updateTime;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUseId() {
		return useId;
	}

	public void setUseId(Integer useId) {
		this.useId = useId;
	}

	public Integer getProId() {
		return proId;
	}

	public void setProId(Integer proId) {
		this.proId = proId;
	}

	public Integer getLeaId() {
		return leaId;
	}

	public void setLeaId(Integer leaId) {
		this.leaId = leaId;
	}

	public Integer getNeeId() {
		return neeId;
	}

	public void setNeeId(Integer neeId) {
		this.neeId = neeId;
	}

	public Integer getWorId() {
		return worId;
	}

	public void setWorId(Integer worId) {
		this.worId = worId;
	}

	public Double getMoney() {
		return money;
	}

	public void setMoney(Double money) {
		this.money = money;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public Integer getRank() {
		return rank;
	}

	public void setRank(Integer rank) {
		this.rank = rank;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
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
