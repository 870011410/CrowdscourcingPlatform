package org.crowd.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.crowd.model.User;
import org.crowd.model.dto.NeedDeti;

import com.alibaba.fastjson.JSONObject;

/**
 * 
     * <p>Title : WorkTableService</p>
     * <p>Description : </p>
     * <p>DevelopTools : Eclipse_x64_v4.9.0</p>
     * <p>DevelopSystem : macOS Sierra 10.12.1</p>
     * <p>Company : org.crowds</p>
     * @author : zhengjiawei
     * @date : 2018年12月13日 下午3:18:31
     * @version : 12.0.0
 */
//工作台的事务
public interface WorkTableService {

   //显示自己正在发布的需求
		List<NeedDeti> showMyselfNeeding(Integer userId,Integer start,Integer limit,Integer type);
		
		Integer showMyselfNeedingCount(Integer userId,Integer type);
		
  //雇主确定服务商完成项目(交项目付钱)
		String deliverSingle(Integer bidId,Integer bidUserId,Double money,User user,Integer needId) throws Exception;
		//判断某个需求是否有人投标
	    Integer checkNeedIsBid(Integer needId);
//删除需求（流标）
	    Integer deleteNeed(User user,Integer needId,Integer type,Integer score) throws Exception;
	  //显示自己的投标
	  	List<NeedDeti> showMyselfBiding(Integer userId,Integer type,RowBounds rb, Integer state,Integer nState);
	  //显示自己的投标
	  	Integer showMyselfBidingCount(Integer userId,Integer type,Integer state,Integer nState);
	  //取消投标（删除）
	    Integer deleteMyselfBid(Integer bidId,String userName) throws Exception; 
	  //显示工作台我的作品(显示分页)
	   JSONObject initMyWork(Integer start,Integer limit,Integer userId);  
	   
	   //上架下架 删除作品
	   Integer updateState(Integer workId, Integer state,String content,String userName) throws Exception;
	   
	   //修改我的作品
	   Integer motifyMyWork(Integer workId,String title,Double money,Integer typeId,
			   String workContent,String img,String content,String userName) throws Exception;
	 //退款 
	   Integer returnMoney( Integer workId, Integer buyerId, Double workMoney,String content,String userName)throws Exception;
	    
	 //显示工作台我购买的作品(显示分页)
	   JSONObject initBuyerWork(Integer start,Integer limit,Integer userId);   
	 //购买的商品确认收货 
	   Integer okBuy( Integer workId,String content,String userName)throws Exception;
	 //服务商发布作品文件needSrc
	   Integer updateNeedSrc(Integer needId,String src,String userName) throws Exception;
	 //显示自己联盟的投标
		List<NeedDeti> showLeagureBiding(Integer leaId,Integer type,Integer state,RowBounds rb,Integer nState);
     
		//显示自己联盟的投标数量
		Integer showLeagureBidingCount(Integer leaId,Integer type,Integer state,Integer nState);
		
      //付钱给联盟
	String deliverLeague(Integer bidId, Integer leaId, Double money, User user, Integer needId) throws Exception;
	

	 //卖家上传作品文件workSrc
	   Integer updateWorkSrc(Integer workId,String src,String userName) throws Exception;


}
