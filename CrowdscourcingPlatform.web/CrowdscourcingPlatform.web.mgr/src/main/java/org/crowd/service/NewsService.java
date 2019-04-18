package org.crowd.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.crowd.model.News;

public interface NewsService {
	
	//分页查询行业资讯的信息
	List<News> searchNewsInfo(String name,Integer state,String startTime,String endTime,RowBounds rb);
	
	//查询行业资讯的总数
	Integer searchNewsCount(String name,Integer state,String startTime,String endTime);
	
	//新增一条行业资讯
	void createNews(String name,String link,String admName) throws Exception;
	
	//删除一条行业资讯
	void deleteNews(Integer id,String name,String admName) throws Exception;
	
	//修改一条行业资讯
	void modifyNews(Integer id,String name,String link,String admName) throws Exception;
	
	//上线一条行业资讯
	void onlineNews(Integer id,String name,String admName) throws Exception;
	
	//下线一条行业资讯
	void offlineNews(Integer id,String name,String admName) throws Exception;
	
}