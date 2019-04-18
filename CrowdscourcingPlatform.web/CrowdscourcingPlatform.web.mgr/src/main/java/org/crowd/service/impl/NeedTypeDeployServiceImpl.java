package org.crowd.service.impl;

import java.util.List;

import org.crowd.dao.LogMapper;
import org.crowd.dao.NeedTypeDeployMapper;
import org.crowd.model.NeedTypeModel;
import org.crowd.service.NeedTypeDeployService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
@Service
public class NeedTypeDeployServiceImpl implements NeedTypeDeployService {

	@Autowired
	private NeedTypeDeployMapper needMapper;
	@Autowired
	private LogMapper lm;
	
	//查找所有配置的需求类型
	
	@Transactional(rollbackFor = Exception.class)
	public List<NeedTypeModel> selectNeedType() {
		// TODO Auto-generated method stub
		
		//查找所有配置的需求类型
		List<NeedTypeModel> needTypes = needMapper.selectNeedType();
		
		return needTypes;
		
	}

//添加一个新的需求类型
	@Transactional(rollbackFor = Exception.class)
	public Integer addNewNeedType(String needTypeName, Integer serverId,String admName) throws Exception {
		// TODO Auto-generated method stub
		Integer res=0;
		int b=0;
		String checkName= needMapper.checkNeedName(needTypeName);
		if(checkName==null) {
			
			res = needMapper.addNewNeedType(needTypeName, serverId);
			b = lm.createLog(admName, "新增需求类型：" + needTypeName);
		}
		if(res>0 && b>0) {
			return res;
		}else {
			throw new Exception();
		}
	}

}
