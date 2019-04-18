package org.crowd.dao;
/**
 * 
     * <p>Title : WorkTableMapper</p>
     * <p>Description : </p>
     * <p>DevelopTools : Eclipse_x64_v4.9.0</p>
     * <p>DevelopSystem : macOS Sierra 10.12.1</p>
     * <p>Company : org.crowds</p>
     * @author : zhengjiawei
     * @date : 2018年12月13日 下午3:10:40
     * @version : 12.0.0
 */
//工作台的dao

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.crowd.model.dto.NeedDeti;
import org.crowd.model.dto.WorkDto;

public interface WorkTableMapper {

	//显示自己正在发布的需求
	List<NeedDeti> showMyselfNeeding(@Param("userId") Integer userId,@Param("type") Integer type,RowBounds rb);
	//显示自己正在发布的需求数量
    Integer showMyselfNeedingCount(@Param("userId") Integer userId,@Param("type") Integer type);
    //判断某个需求是否有人投标
    Integer checkNeedIsBid(@Param("needId") Integer needId);
    //修改用户信用分（score为差值）
    Integer updateUserScore(@Param("userId") Integer userId,@Param("score") Integer score);

  //显示自己的投标
  	List<NeedDeti> showMyselfBiding(@Param("userId") Integer userId,@Param("type") Integer type,@Param("state") Integer state,RowBounds rb,@Param("nState") Integer nState);
  //显示自己的投标
  	Integer showMyselfBidingCount(@Param("userId") Integer userId,@Param("type") Integer type,@Param("state") Integer state,@Param("nState") Integer nState);
  //取消投标（删除）
    Integer deleteMyselfBid(@Param("bidId") Integer bidId);
    
  //显示工作台我的作品(显示分页)
    List<WorkDto> initMyWork(@Param("userId")Integer userId,RowBounds rb);
    Integer initMyWorkCount(@Param("userId")Integer userId);
  ///上架下架 删除作品  
    Integer updateState(@Param("workId")Integer workId, @Param("state")Integer state);
    //修改我的作品 
    Integer motifyMyWork(@Param("workId")Integer workId, @Param("title")String title, 
    		@Param("money")Double money, @Param("typeId")Integer typeId,
    		@Param("workContent")String workContent,@Param("img")String img);
    
  //显示工作台我购买的作品(显示分页)
    List<WorkDto> initBuyerWork(@Param("userId")Integer userId,RowBounds rb);
    Integer initBuyerWorkCount(@Param("userId")Integer userId);
 // 购买的商品确认收货  
    Integer okBuy(Integer workId);
  //买家加钱 
    Integer motifySellerMoney(@Param("buyerId")Integer buyerId,@Param("workMoney")double workMoney);
  //作品购买人变成null
  Integer updateBuyerId(@Param("workId")Integer workId,@Param("buyerId")Integer buyerId);  
    
  //服务商发布作品文件该needSrc
  Integer updateNeedSrc(@Param("needId") Integer needId,@Param("src") String src);
  
//显示自己联盟的投标
	List<NeedDeti> showLeagureBiding(@Param("leaId") Integer leaId,@Param("type") Integer type,@Param("state") Integer state,RowBounds rb,@Param("nState") Integer nState);
//显示自己联盟的投标数量
	Integer showLeagureBidingCount(@Param("leaId") Integer leaId,@Param("type") Integer type,@Param("state") Integer state,@Param("nState") Integer nState);
//根据联盟id查盟主id
	Integer selectMasterIdWithLeaId(@Param("leaId") Integer leaId);
	
	//卖家上传作品文件workSrc
	 Integer updateWorkSrc(@Param("workId") Integer workId,@Param("src") String src);

}
