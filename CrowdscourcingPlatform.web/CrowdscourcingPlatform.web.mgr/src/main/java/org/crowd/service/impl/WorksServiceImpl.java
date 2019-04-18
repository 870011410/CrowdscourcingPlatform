package org.crowd.service.impl;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.crowd.dao.UserMapper;
import org.crowd.dao.WorkMapper;
import org.crowd.model.dto.WorkDto;
import org.crowd.service.WorksService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
@Service
public class WorksServiceImpl implements WorksService {

	@Autowired
	UserMapper userMapper;
	@Autowired
	WorkMapper workMapper;
	
	//作品管理数据初始化
	@Override
	public List<WorkDto> initWork(String begin, String end, String name, Integer state, RowBounds rb) {
		List<WorkDto> workDtos = workMapper.initWork(begin, end, name, state, rb);
		return workDtos;
	}
	@Override
	public Integer initWorkCount(String begin, String end, String name, Integer state) {
		Integer count = workMapper.initWorkCount(begin, end, name, state);
		return count;
	}
	//作品的上架与下架
	@Transactional(rollbackFor = Exception.class)
	public Integer motifyWorkState(Integer workId, Integer state, String content, String adminName) throws Exception {

		int index1=workMapper.motifyWorkState(workId, state);
		int index2=userMapper.addLog(content, adminName);
		if(index1>0&&index2>0) {
			
			return 1;
		}else {
			
			throw new Exception("ERR");
		}
	}
}
