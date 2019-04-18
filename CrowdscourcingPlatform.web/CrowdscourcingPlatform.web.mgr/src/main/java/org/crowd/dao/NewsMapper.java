package org.crowd.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.crowd.model.News;

public interface NewsMapper {
	//分页查询行业资讯的信息
	List<News> searchNewsInfo(@Param("name")String name,@Param("state")Integer state,@Param("startTime")String startTime,
			@Param("endTime")String endTime,RowBounds rb);
	//查询行业资讯的总数
	Integer searchNewsCount(@Param("name")String name,@Param("state")Integer state,@Param("startTime")String startTime,
			@Param("endTime")String endTime);
	//新增一条行业资讯
	Integer createNews(@Param("name")String name,@Param("link")String link);
	//删除一条行业资讯
	Integer deleteNews(@Param("id")Integer id);
	//修改一条行业资讯
	Integer modifyNews(@Param("id")Integer id,@Param("name")String name,@Param("link")String link);
	//上线一条行业资讯
	Integer onlineNews(@Param("id")Integer id);
	//下线一条行业资讯
	Integer offlineNews(@Param("id")Integer id);
}