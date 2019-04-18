package org.crowd.model.dto;

import org.crowd.model.ServerTypeModel;

public class ServerType_picture extends ServerTypeModel {
	
	private Integer picId;		//图片的ID
	private String  picUrl;		//图片的路径
	private String  picName;	//图片的名称
	
	public ServerType_picture() {
		// TODO Auto-generated constructor stub
	}

	public ServerType_picture(Integer picId, String picUrl, String picName) {
		super();
		this.picId = picId;
		this.picUrl = picUrl;
		this.picName = picName;
	}

	public Integer getPicId() {
		return picId;
	}

	public void setPicId(Integer picId) {
		this.picId = picId;
	}

	public String getPicUrl() {
		return picUrl;
	}

	public void setPicUrl(String picUrl) {
		this.picUrl = picUrl;
	}

	public String getPicName() {
		return picName;
	}

	public void setPicName(String picName) {
		this.picName = picName;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("ServerType_picture [picId=");
		builder.append(picId);
		builder.append(", picUrl=");
		builder.append(picUrl);
		builder.append(", picName=");
		builder.append(picName);
		builder.append("]");
		return builder.toString();
	}
	
	


	
	
	
}
