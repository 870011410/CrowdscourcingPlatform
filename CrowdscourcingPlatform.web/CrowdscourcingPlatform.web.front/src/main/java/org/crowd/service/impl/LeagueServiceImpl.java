package org.crowd.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.crowd.dao.LeagueMapper;
import org.crowd.dao.LogMapper;
import org.crowd.dao.UserMapper;
import org.crowd.model.LeaModel;
import org.crowd.model.dto.LeaMange;
import org.crowd.model.dto.LeaUserLinkDto;
import org.crowd.service.LeagueService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSONObject;
/**
 * 
     * <p>Title : LeagueServiceImpl</p>
     * <p>Description : </p>
     * <p>DevelopTools : Eclipse_x64_v4.9.0</p>
     * <p>DevelopSystem : macOS Sierra 10.12.1</p>
     * <p>Company : org.crowds</p>
     * @author : zhengjiawei
     * @date : 2018年12月17日 上午11:06:23
     * @version : 12.0.0
 */
//联盟中心的事务
@Service
public class LeagueServiceImpl implements LeagueService {

	@Autowired
	private UserMapper userMapper;
	
	@Autowired
	private LeagueMapper leagueMapper;
	
	@Autowired
	private LogMapper logMapper;
	
	//判断用户是否已经联盟过了
	@Transactional(rollbackFor = Exception.class)
	public Boolean checkUserLeague(Integer userId) {
		// TODO Auto-generated method stub
		//判断是否是盟主(不管联盟是否通过)
		LeaModel index = userMapper.checkUserIsLeaMan(userId);
		//判断这人是否加入了联盟
		LeaMange leamange = leagueMapper.checkUserAddLea(userId);
		
		if(index!=null||leamange!=null) {
			return true;
		}else {
			return false;
		}
	}
   //新增一个联盟
	@Transactional(rollbackFor = Exception.class)
	public Integer createNewLeague(String leaName, Integer userId, String content, String src, String userName) throws Exception {
		// TODO Auto-generated method stub
		//创建联盟
		Integer index = leagueMapper.createNewLeague(leaName, userId, content, src);
		//记录日志
		Integer index1 = logMapper.createLog(userName, "申请成立联盟:"+leaName);
		
		if(index>0&&index1>0) {
			return 1;
		}else {
			throw new Exception();
		}
	}
	//检查联盟名是否重复
	@Transactional(rollbackFor = Exception.class)
	public Integer checkLeaNameIsReapet(String leaName) {
		// TODO Auto-generated method stub
		Integer index = leagueMapper.checkLeaNameIsReapet(leaName);
		return index;
	}
	
	//判断是否是盟主
	@Transactional(rollbackFor = Exception.class)
	public LeaMange checkUserIsMaster(Integer userId) {
		// TODO Auto-generated method stub
		LeaMange leaMange =leagueMapper.checkUserIsLeaMaster(userId);
		return leaMange;
	}
	//判断是否加入了联盟（非盟主）
	@Transactional(rollbackFor = Exception.class)
	public LeaMange checkUserAddLea(Integer userId) {
		// TODO Auto-generated method stub
		LeaMange leaMange = leagueMapper.checkUserAddLea(userId);
		return leaMange;
	}
	//联盟的人数
	@Transactional(rollbackFor = Exception.class)
	public Integer selectLeaCountWithLeaId(Integer leaId) {
		// TODO Auto-generated method stub
		Integer count = leagueMapper.selectLeaCountWithLeaId(leaId);
		return count;
	}
	//浏览联盟
    @Transactional(rollbackFor = Exception.class)
	public JSONObject selectLeaMeg(Integer start, Integer limit) {
		// TODO Auto-generated method stub
    	JSONObject data = new JSONObject();
		// 分页
		RowBounds rb = new RowBounds(start, limit);
		//联盟数据集合
		List<LeaMange> leas = leagueMapper.selectLeaMeg(rb);
		//页码
		Integer count = leagueMapper.selectLeaCount();
		//统计每个联盟的人数
		List<Integer> counts = new ArrayList<Integer>();
		for (int i = 0; i < leas.size(); i++) {
			Integer people = leagueMapper.selectLeaCountWithLeaId(leas.get(i).getId());
			counts.add(people);
		}
		
		
		data.put("count", count);
		data.put("leas", leas);
		data.put("counts", counts);
		return data;
	}
    
    //判断是否是盟主（无论状态）
    @Transactional(rollbackFor = Exception.class)
	public LeaMange checkUserIsMasterAll(Integer userId) {
		// TODO Auto-generated method stub
		LeaMange leaMange =userMapper.checkUserIsLeaMan(userId);
		return leaMange;
	}
  //申请加入联盟
    @Transactional(rollbackFor = Exception.class)
	public Integer applyJoinLeague(Integer leaId, Integer userId, String userName) throws Exception {
		// TODO Auto-generated method stub
    	//申请
    	Integer index=leagueMapper.applyJoinLeague(leaId, userId);
    	//记录日志
    	Integer index1=logMapper.createLog(userName, "申请加入联盟");
    	if(index>0&&index1>0) {
    		return 1;
    	}else {
    		throw new Exception();
    	}
    	
	}
    //检查服务商是否申请过了
    @Transactional(rollbackFor = Exception.class)
	public Integer checkUserIsApplyThisLea(Integer leaId, Integer userId) {
		// TODO Auto-generated method stub
    	Integer index = leagueMapper.checkUserIsApplyThisLea(leaId, userId);
    	return index;
	}
    //联盟申请成员
    @Transactional(rollbackFor = Exception.class)
	public List<LeaUserLinkDto> selectPeopleWithLeague(RowBounds rb, Integer leaId, String check_name, Integer check_state,
			String check_time_from, String check_time_to) {
		// TODO Auto-generated method stub
    	List<LeaUserLinkDto> leaUserLinks = leagueMapper.selectPeopleWithLeague(rb, leaId, check_name, check_state, check_time_from, check_time_to);
    	return leaUserLinks;
	}
  //联盟申请成员数量
    @Transactional(rollbackFor = Exception.class)
	public Integer selectPeopleWithLeagueCount(Integer leaId, String check_name, Integer check_state,
			String check_time_from, String check_time_to) {
		// TODO Auto-generated method stub
		Integer count = leagueMapper.selectPeopleWithLeagueCount(leaId, check_name, check_state, check_time_from, check_time_to);
	return count;
    }
	//修改联盟成员的状态
    @Transactional(rollbackFor = Exception.class)
	public Integer updateLeagueUserState(Integer audiId, Integer state, String leaMaster, String meg) throws Exception {
		// TODO Auto-generated method stub
    	//修改
		Integer index = leagueMapper.updateLeagueUserState(audiId, state);
		//记录日志
		Integer index1 = logMapper.createLog(leaMaster, meg);
		if(index>0&&index1>0) {
			return 1;
		}else {
			throw new Exception();
		}
	}
	//剔除某个联盟成员
    @Transactional(rollbackFor = Exception.class)
	public Integer deleteLeagueUser(Integer audiId, String leaMaster, String meg) throws Exception {
		// TODO Auto-generated method stub
    	//剔除
    	Integer index = leagueMapper.deleteLeagueUser(audiId);
		//记录日志
		Integer index1 = logMapper.createLog(leaMaster, meg);
		if(index>0&&index1>0) {
			return 1;
		}else {
			throw new Exception();
		}
	}
}
