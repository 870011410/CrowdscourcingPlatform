package org.crowd.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.crowd.model.NeedTypeModel;
import org.crowd.model.dto.NeedDeti;
import org.crowd.model.dto.TenderLeaOrUserDto;
import org.crowd.model.dto.TenderMegTableDto;

/**
 * 
     * <p>Title : ShowNeedMapper</p>
     * <p>Description : </p>
     * <p>DevelopTools : Eclipse_x64_v4.9.0</p>
     * <p>DevelopSystem : macOS Sierra 10.12.1</p>
     * <p>Company : org.crowds</p>
     * @author : zhengjiawei
     * @date : 2018年12月11日 上午11:37:12
     * @version : 12.0.0
 */
//需求显示的dao
public interface ShowNeedMapper {

	//查询所有配置过的需求配置类型(某个服务类型下的)
		List<NeedTypeModel> selectNeedTypeWithServ(@Param("serverTypeId") Integer serverTypeId);
		//查询需求的总条数
		Integer selectNeedCount(@Param("title") String title,
				@Param("servId") Integer servId,@Param("typeId") Integer typeId);

	    //查询需求的数据
	List<NeedDeti> selectNeedMeg(@Param("title") String title,@Param("typeId") Integer typeId,@Param("servId") Integer servId,RowBounds rb);
      //查看某个需求的数据
	NeedDeti selectNeedMegWithNeedId(@Param("needId") Integer needId);
	//显示投标的服务商（联盟）
	List<TenderLeaOrUserDto> showTenderPeopleWithNeedId(@Param("needId") Integer needId);
	//显示投标标信息（服务商）
	TenderMegTableDto showThisBidderMeg(@Param("bidId") Integer bidId);
	//修改投标表的状态
	Integer updateBidType(@Param("bidId") Integer bidId,@Param("type") Integer type);
	//修改需求的状态
    Integer updateNeedState(@Param("needId") Integer needId,@Param("state") Integer state);

  //显示投标标信息（联盟）
  	TenderMegTableDto showThisBidderLeague(@Param("bidId") Integer bidId);
  	//平台的雇主数量
  	Integer crowdEmployerCount();
  	//平台的服务商数量
  	Integer crowdServerPeopleCount();
  	//交易的作品数量
  	Integer crowdWorkCount();
  	//完成的需求数量
  	Integer crowdNeedCount();
  	
}
