package org.crowd.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.crowd.model.News;

public interface NewsService {
	
	//分页查询行业资讯的信息
	List<News> searchNewsInfo(RowBounds rb);
	
	//查询行业资讯的总数
	Integer searchNewsCount();
	
}