package org.crowd.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.crowd.dao.LeaManageMapper;
import org.crowd.dao.LogMapper;
import org.crowd.model.User;
import org.crowd.model.dto.LeaMange;
import org.crowd.service.LeaManageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSONObject;

/**
 * 
 * <p>
 * Title : LeaManageServiceImpl
 * </p>
 * <p>
 * Description :
 * </p>
 * <p>
 * DevelopTools : Eclipse_x64_v4.9.0
 * </p>
 * <p>
 * DevelopSystem : window 7
 * </p>
 * <p>
 * Company : org.crowd
 * </p>
 * 
 * @author : zhengjiawei
 * @date : 2018年12月8日 上午9:55:32
 * @version : 12.0.0
 */
//盟主管理事务的实现类
@Service
public class LeaManageServiceImpl implements LeaManageService {

	// 盟主管理的dao
	@Autowired
	private LeaManageMapper leaMapper;
	// 日志dao
		@Autowired
		private LogMapper logMapper;

	//查出所有的盟主
	@Transactional(rollbackFor = Exception.class)
	public List<User> selectLeaMaster() {
		// TODO Auto-generated method stub
		List<User> users = leaMapper.selectLeaMaster();
		return users;
	}

	//联盟管理的分页显示
	@Transactional(rollbackFor = Exception.class)
	public JSONObject selectLeaMeg(Integer start, Integer limit, String leaName, String sTime, String eTime,
			Integer leaMasterId) {
		// TODO Auto-generated method stub
		JSONObject data = new JSONObject();
		// 分页
		RowBounds rb = new RowBounds(start, limit);
		//联盟数据集合
		List<LeaMange> leas = leaMapper.selectLeaMeg(leaName, sTime, eTime, leaMasterId, rb);
		//页码
		Integer count = leaMapper.selectLeaCount(leaName, sTime, eTime, leaMasterId);
		//统计每个联盟的人数
		List<Integer> counts = new ArrayList<Integer>();
		for (int i = 0; i < leas.size(); i++) {
			Integer people = leaMapper.selectLeaCountWithLeaId(leas.get(i).getId());
			counts.add(people);
		}
		
		
		data.put("count", count);
		data.put("leas", leas);
		data.put("counts", counts);
		return data;
		
	}

	//修改联盟的状态(审核，封杀)
	@Transactional(rollbackFor = Exception.class)
	public Integer updateLeaState(Integer leaId, String ctrlMeg, Integer state, String adminName) throws Exception {
		// TODO Auto-generated method stub
		
		//修改
		Integer index1= leaMapper.updateLeaState(leaId, state);
		//添加日志
		Integer index2= logMapper.createLog(adminName, ctrlMeg);
		
		if(index1>0&&index2>0) {
			return 1;
		}else {
			throw new Exception();
		}
		
		
	}
//查找某个联盟的成员
	@Transactional(rollbackFor = Exception.class)
	public List<String> selectUserWithLea(Integer leaId) {
		// TODO Auto-generated method stub
		
		List<String> users = leaMapper.selectUserWithLea(leaId);
		
		return users;
		
	}

	
	
}
