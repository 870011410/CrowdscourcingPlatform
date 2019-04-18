package org.crowd.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.crowd.model.dto.SucCase;

public interface SucCaseMapper {
	//成功案例的总条数
	Integer searchSucCaseCount(@Param("title") String title,@Param("content") String content,@Param("state") Integer state);

    //成功案例的数据
	List<SucCase> searchSucCaseInfo(RowBounds rb,@Param("title") String title,@Param("content") String content,@Param("state") Integer state);
	//查询账务表的ID（还未绑定成功案例）
	List<Integer> searchAccId();
	//新增一条成功案例
	Integer createSucCase(@Param("title")String title,@Param("content")String content,@Param("sucAccId")Integer sucAccId);
	//删除一条成功案例
	Integer deleteSucCase(@Param("id")Integer id);
	//修改一条成功案例
	Integer modifySucCase(@Param("id")Integer id,@Param("title")String title,@Param("content")String content);
	//上线一条成功案例
	Integer onlineSucCase(@Param("id")Integer id);
	//下线一条成功案例
	Integer offlineSucCase(@Param("id")Integer id);
	// 置顶成功案例前先后移之前的成功案例
	int beforeStick(@Param("rank") Integer rank);
	// 置顶成功案例
	int stickSucCase(@Param("id") Integer id);
}
