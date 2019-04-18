package org.crowd.model.dto;

import org.crowd.model.AccountModel;

/**
 * 
 * <p>
 * Title : AccountDetaDto
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
 * @date : 2018年12月9日 上午10:11:13
 * @version : 12.0.0
 */
//账务对账所用的dto
public class AccountDetaDto extends AccountModel {

	// 雇主名字
	private String useName;
	// 服务商名字
	private String serName;
	// 联盟名字
	private String leaName;
	// 作品标题
	private String worTitle;
	// 需求标题
	private String neeTitle;

	public AccountDetaDto() {
		// TODO Auto-generated constructor stub
	}

	public AccountDetaDto(String useName, String serName, String leaName, String worTitle, String neeTitle) {
		super();
		this.useName = useName;
		this.serName = serName;
		this.leaName = leaName;
		this.worTitle = worTitle;
		this.neeTitle = neeTitle;
	}

	public String getUseName() {
		return useName;
	}

	public void setUseName(String useName) {
		this.useName = useName;
	}

	public String getSerName() {
		return serName;
	}

	public void setSerName(String serName) {
		this.serName = serName;
	}

	public String getLeaName() {
		return leaName;
	}

	public void setLeaName(String leaName) {
		this.leaName = leaName;
	}

	public String getWorTitle() {
		return worTitle;
	}

	public void setWorTitle(String worTitle) {
		this.worTitle = worTitle;
	}

	public String getNeeTitle() {
		return neeTitle;
	}

	public void setNeeTitle(String neeTitle) {
		this.neeTitle = neeTitle;
	}

}
