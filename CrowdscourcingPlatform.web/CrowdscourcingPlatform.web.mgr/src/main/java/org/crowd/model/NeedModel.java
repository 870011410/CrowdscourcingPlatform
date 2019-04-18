package org.crowd.model;

/**
 * 
 * <p>
 * Title : NeedModel
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
 * @date : 2018年12月7日 下午1:39:14
 * @version : 12.0.0
 */
//需求表对象
public class NeedModel {

	// 需求id
	private Integer id;
	// 标题
	private String title;
	// 主题内容
	private String content;
	// 要求
	private String demand;
	// 金额
	private Double money;
	// 发布用户id
	private Integer userId;
	// 需求类型id
	private Integer type;
	// 状态 (0 正常显示 1 禁止显示 2 不用)
	private Integer state;
	// 截止时间
	private String endTime;
	// 备注
	private String memo;
	// 创建时间
	private String createTime;
	// 修改时间
	private String updateTime;

	public NeedModel() {
		// TODO Auto-generated constructor stub
	}

	public NeedModel(Integer id, String title, String content, String demand, Double money, Integer userId,
			Integer type, Integer state, String endTime, String memo, String createTime, String updateTime) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.demand = demand;
		this.money = money;
		this.userId = userId;
		this.type = type;
		this.state = state;
		this.endTime = endTime;
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

	public String getDemand() {
		return demand;
	}

	public void setDemand(String demand) {
		this.demand = demand;
	}

	public Double getMoney() {
		return money;
	}

	public void setMoney(Double money) {
		this.money = money;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
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
