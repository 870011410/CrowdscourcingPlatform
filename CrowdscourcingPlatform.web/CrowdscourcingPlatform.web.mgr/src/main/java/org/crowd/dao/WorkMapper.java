package org.crowd.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.crowd.model.dto.WorkDto;

public interface WorkMapper {
	
	//作品管理数据初始化
		List<WorkDto> initWork
		(@Param("begin")String begin, @Param("end")String end, 
				@Param("name")String name,@Param("state")Integer state,RowBounds rb);
		Integer initWorkCount (@Param("begin")String begin, @Param("end")String end, 
				@Param("name")String name,@Param("state")Integer state);
	//作品的上架与下架	
		Integer motifyWorkState(@Param("workId")Integer workId, @Param("state")Integer state);

}
