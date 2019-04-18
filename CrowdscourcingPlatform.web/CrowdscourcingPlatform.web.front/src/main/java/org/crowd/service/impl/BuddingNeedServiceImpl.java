package org.crowd.service.impl;

import org.crowd.dao.BuddingNeedMapper;
import org.crowd.dao.LeagueMapper;
import org.crowd.dao.LogMapper;
import org.crowd.dao.UserMapper;
import org.crowd.model.LeaModel;
import org.crowd.model.dto.LeaMange;
import org.crowd.service.BuddingNeedService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
/**
 * 
     * <p>Title : BuddingNeedServiceImpl</p>
     * <p>Description : </p>
     * <p>DevelopTools : Eclipse_x64_v4.9.0</p>
     * <p>DevelopSystem : macOS Sierra 10.12.1</p>
     * <p>Company : org.crowds</p>
     * @author : zhengjiawei
     * @date : 2018年12月12日 下午2:32:05
     * @version : 12.0.0
 */
@Service
public class BuddingNeedServiceImpl implements BuddingNeedService {

	
	@Autowired
	private UserMapper userMapper;
	@Autowired
	private BuddingNeedMapper buddingNeedMapper;
	//日志的
	@Autowired
	private LogMapper logMapper;
	//日志的
	@Autowired
	private LeagueMapper leagueMapper;
	//判断用户是否是盟主
	
	@Transactional(rollbackFor = Exception.class)
	public LeaMange checkUserIsLeaMan(Integer userId) {
		// TODO Auto-generated method stub
		LeaMange lea = leagueMapper.checkUserIsLeaMaster(userId);
		return lea;
	}

	//服务商个人投标
	@Transactional(rollbackFor = Exception.class)
	public Integer buddingTenderSingle(Integer needId, Integer ispId, String content,String userName) throws Exception {
		// TODO Auto-generated method stub
		Integer index = buddingNeedMapper.buddingTenderSingle(needId, ispId, content);
		Integer index1 = logMapper.createLog(userName, "以个人的名义对需求ID为"+needId+"的需求进行了竞标");
		if(index>0&&index1>0) {
			return 1;
		}else {
			throw new Exception();
		}
		
		
	}

	//判断服务商是否投过这个标了
	@Transactional(rollbackFor = Exception.class)
	public Integer checkIsBuddingSingle(Integer userId, Integer needId) {
		// TODO Auto-generated method stub
		Integer index = buddingNeedMapper.checkIsBuddingSingle(userId, needId);
		return index;
	}

	//判断是否是自己的需求
	@Transactional(rollbackFor = Exception.class)
	public Integer checkIsMyselfNeed(Integer userId, Integer needId) {
		// TODO Auto-generated method stub
		Integer index = buddingNeedMapper.checkIsMyselfNeed(userId, needId);
		return index;
	}

	//判断联盟是否投过标了
	@Transactional(rollbackFor = Exception.class)
	public Integer checkLeagueBudding(Integer needId, Integer leaId) {
		// TODO Auto-generated method stub
		Integer index = buddingNeedMapper.checkLeagueBudding(needId, leaId);
		return index;
	}

	//联盟投标
	@Transactional(rollbackFor = Exception.class)
	public Integer buddingTenderLeague(Integer needId, String content, Integer leaId, String userName) throws Exception {
		// TODO Auto-generated method stub
		//投标
		Integer index = buddingNeedMapper.buddingTenderLeague(needId, content, leaId);
		//记录日志
		Integer index1 = logMapper.createLog(userName, "代表联盟投了需求id为"+needId+"的标");
		if(index>0&&index1>0) {
			return 1;
		}else {
			throw new Exception();
		}
	}

}
