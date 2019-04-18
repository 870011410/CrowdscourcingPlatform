package org.crowd.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.crowd.dao.LogMapper;
import org.crowd.dao.ShowNeedMapper;
import org.crowd.model.NeedTypeModel;
import org.crowd.model.dto.NeedDeti;
import org.crowd.model.dto.TenderLeaOrUserDto;
import org.crowd.model.dto.TenderMegTableDto;
import org.crowd.service.ShowNeedService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSONObject;
/**
 * 
     * <p>Title : ShowNeedServiceImpl</p>
     * <p>Description : </p>
     * <p>DevelopTools : Eclipse_x64_v4.9.0</p>
     * <p>DevelopSystem : macOS Sierra 10.12.1</p>
     * <p>Company : org.crowds</p>
     * @author : zhengjiawei
     * @date : 2018年12月11日 上午11:40:08
     * @version : 12.0.0
 */
//显示去求的实现类
@Service
public class ShowNeedServiceImpl implements ShowNeedService {

	@Autowired
	private ShowNeedMapper showNeedMapper;
	//日志的
	@Autowired
	private LogMapper logMapper;
	
	//获取某个服务下的需求类型
	@Transactional(rollbackFor = Exception.class)
	public List<NeedTypeModel> selectNeedTypeWithServ(Integer serverTypeId) {
		// TODO Auto-generated method stub
		List<NeedTypeModel> needTypes = showNeedMapper.selectNeedTypeWithServ(serverTypeId);
	    return needTypes;
	}

	//显示需求（分页显示）
	@Transactional(rollbackFor = Exception.class)
	public JSONObject selectNeedMeg(Integer servId,Integer start, Integer limit, String title, Integer typeId) {
		// TODO Auto-generated method stub
		JSONObject data = new JSONObject();
		// 分页
	    RowBounds rb = new RowBounds(start, limit);
	    //数量
	    Integer count = showNeedMapper.selectNeedCount(title, servId, typeId);
	    //信息 
	    List<NeedDeti> needs = showNeedMapper.selectNeedMeg(title, typeId, servId, rb);
	    
	    data.put("count", count);
	    data.put("needs", needs);
	    return data;
	}
  
	//查看某个需求id的需求详情
	@Transactional(rollbackFor = Exception.class)
	public NeedDeti selectNeedMegWithNeedId(Integer needId) {
		// TODO Auto-generated method stub
		NeedDeti needDeti = showNeedMapper.selectNeedMegWithNeedId(needId);
		return needDeti;
	}
	//显示投标的服务商（联盟）
	@Transactional(rollbackFor = Exception.class)
	public List<TenderLeaOrUserDto> showTenderPeopleWithNeedId(Integer needId) {
		// TODO Auto-generated method stub
		List<TenderLeaOrUserDto> tenders =showNeedMapper.showTenderPeopleWithNeedId(needId);
		System.err.println("laize");
		return tenders;
	}

	//显示投标标信息（服务商）
	@Transactional(rollbackFor = Exception.class)
	public TenderMegTableDto showThisBidderMeg(Integer bidId) {
		// TODO Auto-generated method stub
		TenderMegTableDto tender = showNeedMapper.showThisBidderMeg(bidId);
		return tender;
	}

	//与某个服务商合作
	@Transactional(rollbackFor = Exception.class)
	public Integer joinWorkWithServer(Integer bidId, String bidUser, String userName, Integer needId) throws Exception {
		// TODO Auto-generated method stub
		//修改投标标的状态
		Integer index1 = showNeedMapper.updateBidType(bidId,1);
		//修改需求表的状态
		Integer index2 = showNeedMapper.updateNeedState(needId, 3);
		//记录日志
		Integer index3 = logMapper.createLog(userName, "将需求交与"+bidUser+"处理");
		if(index1>0&&index2>0&&index3>0) {
			return 1;
		}else {
			throw new Exception();
		}
	}

	//显示联盟的投标信息
	@Transactional(rollbackFor = Exception.class)
	public TenderMegTableDto showThisBidderLeague(Integer bidId) {
		// TODO Auto-generated method stub
		TenderMegTableDto tender =  showNeedMapper.showThisBidderLeague(bidId);
		return tender;
	}
	//显示众包平台的数据 (雇主 服务商 作品交易 需求完成)
	@Transactional(rollbackFor = Exception.class)
  	public JSONObject showCrowdData() {
		JSONObject data = new JSONObject();
		//雇主数量
		Integer emptyerCount = showNeedMapper.crowdEmployerCount();
		Integer servierPeopleCount =showNeedMapper.crowdServerPeopleCount();
		Integer workCount = showNeedMapper.crowdWorkCount();
		Integer needCount = showNeedMapper.crowdNeedCount();
		
		data.put("emptyerCount", emptyerCount);
		data.put("servierPeopleCount", servierPeopleCount);
		data.put("workCount", workCount);
		data.put("needCount", needCount);
		return data;
  	}

}
