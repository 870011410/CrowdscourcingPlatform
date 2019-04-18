package org.crowd.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.crowd.model.dto.NeedDeti;
import org.crowd.model.dto.WorkDto;

public interface ShowWorkMapper {

	// 查询作品的总条数
	Integer selectWorkCount(@Param("title") String title,
			@Param("servId") Integer servId,@Param("typeId") Integer typeId);

	//查询上架中的作品
	List<WorkDto> selectWorkMeg(@Param("title") String title,
			@Param("servId") Integer servId,@Param("typeId") Integer typeId, RowBounds rb);
	
	//查看某个作品的数据
	WorkDto selectWorkMegWithWorkId(@Param("workId") Integer workId);
	
	//购买作品
	Integer buyWork(@Param("workId")Integer workId,@Param("buyerId")Integer buyerId);
	//购买作品消费金钱
	Integer motifyBuyerMoney(@Param("userName")String userName,@Param("workMoney")Double workMoney);
	
	//购买作品卖家收款
	Integer motifySellerMoney(@Param("userName")String userName,@Param("workMoney")Double workMoney);

}
