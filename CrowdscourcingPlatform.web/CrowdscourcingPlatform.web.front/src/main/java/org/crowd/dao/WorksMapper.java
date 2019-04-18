package org.crowd.dao;

import org.apache.ibatis.annotations.Param;

public interface WorksMapper {
	
	// 作品发布
	Integer upWorks(@Param("title")String title, @Param("content")String content, 
					@Param("img")String img, @Param("money")double money, 
					@Param("neeId")Integer neeId, @Param("useId")Integer useId);

}
