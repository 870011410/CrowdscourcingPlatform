package org.crowd.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.crowd.model.dto.WorkDto;

public interface WorksService {
	
	//作品管理数据初始化
	List<WorkDto> initWork(String begin, String end, String name,Integer state,RowBounds rb);
	
	Integer initWorkCount (String begin, String end, String name,Integer state);
	
	//作品的上架与下架
	Integer motifyWorkState(Integer workId, Integer state,String content,String adminName)throws Exception;

}
