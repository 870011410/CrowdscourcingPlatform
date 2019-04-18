package org.crowd.model;

public class User {
	private Integer id;			//用户ID
	private String acc;			//用户账号
	private String pwd;			//用户密码
	private String name; 		//昵称	
	private String phone;		//手机
	private String email;		//邮箱
	private double money;		//余额
	private Integer score;		//信用分
	private Integer type;		//用户类型
	private Integer state;		//用户状态
	private String createTime;	//创建时间（注册时间）
	
	public User() {
		// TODO Auto-generated constructor stub
	}
	
	
	public User(Integer id, String acc, String pwd, String name, String phone, String email, double money,
			Integer score, Integer type, Integer state, String createTime) {
		super();
		this.id = id;
		this.acc = acc;
		this.pwd = pwd;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.money = money;
		this.score = score;
		this.type = type;
		this.state = state;
		this.createTime = createTime;
	}


	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getAcc() {
		return acc;
	}

	public void setAcc(String acc) {
		this.acc = acc;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public double getMoney() {
		return money;
	}

	public void setMoney(double money) {
		this.money = money;
	}

	public Integer getScore() {
		return score;
	}

	public void setScore(Integer score) {
		this.score = score;
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

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}


	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("User [id=");
		builder.append(id);
		builder.append(", acc=");
		builder.append(acc);
		builder.append(", pwd=");
		builder.append(pwd);
		builder.append(", name=");
		builder.append(name);
		builder.append(", phone=");
		builder.append(phone);
		builder.append(", email=");
		builder.append(email);
		builder.append(", money=");
		builder.append(money);
		builder.append(", score=");
		builder.append(score);
		builder.append(", type=");
		builder.append(type);
		builder.append(", state=");
		builder.append(state);
		builder.append(", createTime=");
		builder.append(createTime);
		builder.append("]");
		return builder.toString();
	}
	
	

}
