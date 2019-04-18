package org.crowd.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.crowd.model.NeedTypeModel;
import org.crowd.model.dto.NeedDeti;
import org.crowd.model.dto.TenderLeaOrUserDto;
import org.crowd.model.dto.TenderMegTableDto;

import com.alibaba.fastjson.JSONObject;

/**
 * 
     * <p>Title : ShowNeedService</p>
     * <p>Description : </p>
     * <p>DevelopTools : Eclipse_x64_v4.9.0</p>
     * <p>DevelopSystem : macOS Sierra 10.12.1</p>
     * <p>Company : org.crowds</p>
     * @author : zhengjiawei
     * @date : 2018年12月11日 上午11:38:58
     * @version : 12.0.0
 */
//显示需求的service

public interface ShowNeedService {

	//查询所有配置过的需求配置类型(某个服务类型下的)
    List<NeedTypeModel> selectNeedTypeWithServ(Integer serverTypeId);
    //显示需求(显示分页)
    JSONObject selectNeedMeg(Integer servId,Integer start,Integer limit,String title,Integer typeId);
  //查看某个需求的数据
  	NeedDeti selectNeedMegWithNeedId(Integer needId);
  //显示投标的服务商（联盟）
  	List<TenderLeaOrUserDto> showTenderPeopleWithNeedId(Integer needId);
  //显示投标标信息（服务商）
  	TenderMegTableDto showThisBidderMeg(Integer bidId);
  	//与某个服务商合作
  	Integer joinWorkWithServer(Integer bidId,String bidUser,String userName,Integer needId) throws Exception;
  //显示投标标信息（联盟）
  	TenderMegTableDto showThisBidderLeague(@Param("bidId") Integer bidId);
  //显示众包平台的数据 (雇主 服务商 作品交易 需求完成)
  	JSONObject showCrowdData();
}
