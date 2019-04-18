package org.crowd.service.impl;

import java.util.List;

import org.crowd.dao.LogMapper;
import org.crowd.dao.PostNeedMapper;
import org.crowd.model.NeedTypeModel;
import org.crowd.service.PostNeedService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
/**
 * 
     * <p>Title : PostNeedServiceImpl</p>
     * <p>Description : </p>
     * <p>DevelopTools : Eclipse_x64_v4.9.0</p>
     * <p>DevelopSystem : macOS Sierra 10.12.1</p>
     * <p>Company : org.crowds</p>
     * @author : zhengjiawei
     * @date : 2018年12月10日 上午8:45:43
     * @version : 12.0.0
 */
@Service
public class PostNeedServiceImpl implements PostNeedService {

	//需求dao
	@Autowired
	private PostNeedMapper needMapper;
	//日志dao
	@Autowired
	private LogMapper logMapper;
	
	//查找所有配置的需求类型
	
	@Transactional(rollbackFor = Exception.class)
	public List<NeedTypeModel> selectNeedType() {
		// TODO Auto-generated method stub
		
		//查找所有配置的需求类型
		List<NeedTypeModel> needTypes = needMapper.selectNeedType();
		
		return needTypes;
		
	}

//添加（发布）一个新需求
	@Transactional(rollbackFor = Exception.class)
	public Integer addNewNeed(String userName, Integer userId, Integer needTypeId, String title, String content,
			String require, String weekDate, Double money, String endTime) throws Exception {
		// TODO Auto-generated method stub
		//添加一个需求
		Integer index1 = needMapper.addNewNedd(userId, needTypeId, title, content, require, weekDate, money, endTime);
	    //添加一条日志
		Integer index2 = logMapper.createLog(userName, "发布了一个新的需求："+title+"。");
		
		if(index1>0&&index2>0) {
			return 1;
		}else {
			throw new Exception();
		}
	
	}



}
