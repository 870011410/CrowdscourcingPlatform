package org.crowd.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.crowd.model.dto.SucCase;

public interface SucCaseService {
	//分页查询成功案例的总条数
	Integer searchSucCaseCount(String title,String content,Integer state);
	//分页查询成功案例的数据
	List<SucCase> searchSucCaseInfo(RowBounds rb,String title,String content,Integer state);
	//查询账务表的ID（还未绑定成功案例）
	List<Integer> searchAccId();
	//新增一条成功案例
	void createSucCase(String title, String content, Integer sucAccId,String admName) throws Exception;
	//删除一条成功案例
	void deleteSucCase(Integer id, String title,String admName) throws Exception;
	//修改一条成功案例
	void modifySucCase(Integer id, String title,String content,String admName) throws Exception;
	//上线一条成功案例
	void onlineSucCase(Integer id, String title,String admName) throws Exception;
	//下线一条成功案例
	void offlineSucCase(Integer id, String title,String admName) throws Exception;
	//置顶成功案例
	int stickSucCase(Integer id, String admName, String title, Integer rank) throws Exception;
	
		
}
