package org.crowd.service.impl;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.crowd.dao.AccountMapper;
import org.crowd.dao.LogMapper;
import org.crowd.dao.ShowNeedMapper;
import org.crowd.dao.ShowWorkMapper;
import org.crowd.dao.UserMapper;
import org.crowd.dao.WorksMapper;
import org.crowd.model.dto.NeedDeti;
import org.crowd.model.dto.WorkDto;
import org.crowd.service.ShowWorkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSONObject;

@Service
public class ShowWorkServiceImpl implements ShowWorkService {
	@Autowired
	private ShowWorkMapper showWorkMapper;
	@Autowired
	LogMapper logMapper;
	@Autowired
	UserMapper userMapper;
	@Autowired
	private AccountMapper accountMapper;

	@Override
	public JSONObject selectWorkMeg(Integer servId,Integer start, Integer limit, String title, Integer typeId) {
		// TODO Auto-generated method stub
		JSONObject data = new JSONObject();
		// 分页
		RowBounds rb = new RowBounds(start, limit);
		
		 //数量
	    Integer count = showWorkMapper.selectWorkCount(title, servId, typeId);
	    //信息 
	    List<WorkDto> works = showWorkMapper.selectWorkMeg(title, servId, typeId, rb);
	    
		data.put("count", count);
		data.put("works", works);
		return data;
	}

	@Override
	public WorkDto selectWorkMegWithWorkId(Integer workId) {
		// TODO Auto-generated method stub
		WorkDto workDto = showWorkMapper.selectWorkMegWithWorkId(workId);
		return workDto;
	}
	//购买作品
	@Transactional(rollbackFor = Exception.class)
	public Integer buyWork(Integer workId,Integer buyerId, String userName, 
			String workTitle, Double workMoney,String LogUserName) throws Exception {
		
		int index1 = showWorkMapper.buyWork(workId,buyerId);
		
		int index2 = showWorkMapper.motifyBuyerMoney(LogUserName,workMoney);
		
		int index3 = showWorkMapper.motifySellerMoney(userName,workMoney);
		

		int index4 = logMapper.createLog(LogUserName, "购买了标题为："+workTitle+"的作品");
		
		Integer userId = userMapper.selectUserId(userName);
	
		int index5 =  accountMapper.addAccount(buyerId, userId, -1, -1, workId, -workMoney, 2, "");
	
		if (index1 > 0 && index2 > 0 && index3 > 0&& index4 > 0 && index5>0) {

			return 1;
		} else {

			throw new Exception("ERR！");
		}
		
	}

}
