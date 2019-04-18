package org.crowd.service.impl;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.crowd.dao.LogMapper;
import org.crowd.dao.NeedManageMapper;
import org.crowd.model.dto.NeedDeti;
import org.crowd.service.NeedManageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSONObject;
/**
 * 
     * <p>Title : NeedManageServiceImpl</p>
     * <p>Description : </p>
     * <p>DevelopTools : Eclipse_x64_v4.9.0</p>
     * <p>DevelopSystem : window 7</p>
     * <p>Company : org.crowd</p>
     * @author : zhengjiawei
     * @date : 2018年12月7日 下午2:20:02
     * @version : 12.0.0
 */
//需求管理的事务实现类
@Service
public class NeedManageServiceImpl implements NeedManageService {

	//需求管理dao
	@Autowired
	private NeedManageMapper needMapper;
	
	//日志的dao
	@Autowired
	private LogMapper logMapper;
	//查看需求的信息（分页显示）
	@Transactional(rollbackFor = Exception.class)
	public JSONObject selctNeedMeg(String title, String name, Integer needId, String sTime, String eTime,
			RowBounds rb) {
		// TODO Auto-generated method stub
		JSONObject data = new JSONObject();
		
		//数据条数
		Integer count = needMapper.selectNeedCount(title, name, needId, sTime, eTime);
		
		//数据内容
		List<NeedDeti> needs = needMapper.selectNeedMeg(title, name, needId, sTime, eTime, rb);
	    
		data.put("count", count);
		data.put("needs", needs);
		
		return data;
	
	}
	//修改需求的状态并记录日志
	@Transactional(rollbackFor = Exception.class)
	public Integer updateNeedState(Integer needId, Integer state, String ctrlName, String adminName) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("needId"+needId+"state"+state);
		//修改状态
		Integer a=needMapper.updateNeedState(needId, state);
		System.out.println(a);
		//添加日志
		Integer b=logMapper.createLog(adminName, ctrlName);
		
		if(a>0&&b>0) {
			return 1;
		}else {
			throw new Exception();
		}
		
	}

}
