package org.crowd.model;

public class Work {
	private Integer id; 	//作品ID
	private String title;	//作品标题
	private String content;	//作品内容
	private String src;		//作品图片
	private double money;	//金额
	private Integer state;	//上架/下架状态
	private Integer type;	//作品类型
	private Integer useId;	//服务商ID
	private String  updateTime;	//上架时间
	
	public Work() {
		// TODO Auto-generated constructor stub
	}


	
	public Work(Integer id, String title, String content, String src, double money, Integer state, Integer type,
			Integer useId, String updateTime) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.src = src;
		this.money = money;
		this.state = state;
		this.type = type;
		this.useId = useId;
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

	public String getSrc() {
		return src;
	}

	public void setSrc(String src) {
		this.src = src;
	}

	public double getMoney() {
		return money;
	}

	public void setMoney(double money) {
		this.money = money;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public Integer getUseId() {
		return useId;
	}

	public void setUseId(Integer useId) {
		this.useId = useId;
	}



	public String getUpdateTime() {
		return updateTime;
	}



	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}



	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Work [id=");
		builder.append(id);
		builder.append(", title=");
		builder.append(title);
		builder.append(", content=");
		builder.append(content);
		builder.append(", src=");
		builder.append(src);
		builder.append(", money=");
		builder.append(money);
		builder.append(", state=");
		builder.append(state);
		builder.append(", type=");
		builder.append(type);
		builder.append(", useId=");
		builder.append(useId);
		builder.append(", updateTime=");
		builder.append(updateTime);
		builder.append("]");
		return builder.toString();
	}

	
	
	

}
