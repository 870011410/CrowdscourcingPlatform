package org.crowd.service.impl;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.crowd.dao.LogMapper;
import org.crowd.dao.SucCaseMapper;
import org.crowd.model.dto.SucCase;
import org.crowd.service.SucCaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class SucCaseServiceImpl implements SucCaseService {
	
	@Autowired
	private SucCaseMapper sucCaseMapper;
	@Autowired
	private LogMapper lm;
	
	//分页查询成功案例的总条数
	public Integer searchSucCaseCount(String title,String content,Integer state) {
		Integer	count=sucCaseMapper.searchSucCaseCount(title, content, state);
		return count;
		
	}
	//分页查询成功案例的数据
	public List<SucCase> searchSucCaseInfo(RowBounds rb,String title,String content,Integer state){
		List<SucCase> caseList=sucCaseMapper.searchSucCaseInfo(rb, title, content, state);
		return caseList;
	}
	
	//查询账务表的ID（还未绑定成功案例）
	public List<Integer> searchAccId(){
		List<Integer> list=sucCaseMapper.searchAccId();
		return list;
	}
	
	//新增一条成功案例
	@Override
	@Transactional(rollbackFor = Exception.class)
	public void createSucCase(String title, String content, Integer sucAccId,String admName) throws Exception {
		System.err.println("进入新增了嘛？");
		Integer a=sucCaseMapper.createSucCase(title, content, sucAccId);
		System.err.println("有执行新增的操作吗？");
		Integer b = lm.createLog(admName, "新增一条成功案例：" + title);

		if (a > 0 && b > 0) {

		} else {
			throw new Exception("新增失败");
		}
	}

	//删除一条成功案例
	@Override
	@Transactional(rollbackFor = Exception.class)
	public void deleteSucCase(Integer id, String title,String admName) throws Exception {
		Integer a=sucCaseMapper.deleteSucCase(id);

		Integer b = lm.createLog(admName, "删除一条成功案例：" + title);

		if (a > 0 && b > 0) {

		} else {
			throw new Exception("删除失败");
		}
		
	}
	
	//修改一条成功案例
	@Override
	@Transactional(rollbackFor = Exception.class)
	public void modifySucCase(Integer id, String title,String content,String admName) throws Exception {
		Integer a=sucCaseMapper.modifySucCase(id, title, content);

		Integer b = lm.createLog(admName, "修改一条成功案例：" + title);

		if (a > 0 && b > 0) {

		} else {
			throw new Exception("修改失败");
		}
		
	}
	
	//上线一条成功案例
	@Override
	@Transactional(rollbackFor = Exception.class)
	public void onlineSucCase(Integer id, String title,String admName) throws Exception {
		Integer a=sucCaseMapper.onlineSucCase(id);

		Integer b = lm.createLog(admName, "上线一条成功案例：" + title);

		if (a > 0 && b > 0) {

		} else {
			throw new Exception("上线失败");
		}
		
	}
	
	//下线一条成功案例
	@Override
	@Transactional(rollbackFor = Exception.class)
	public void offlineSucCase(Integer id, String title,String admName) throws Exception {
		Integer a=sucCaseMapper.offlineSucCase(id);

		Integer b = lm.createLog(admName, "下线一条成功案例：" + title);

		if (a > 0 && b > 0) {

		} else {
			throw new Exception("下线失败");
		}
		
	}
	
	// 置顶成功案例
	@Transactional(rollbackFor = Exception.class)
	public int stickSucCase(Integer id, String admName, String title, Integer rank) throws Exception {

		int c = sucCaseMapper.beforeStick(rank);
		int a = sucCaseMapper.stickSucCase(id);
		int b = lm.createLog(admName, "置顶了成功案例：" + title);
		if (c <= 0) {
			return -1;
		} else if (a > 0 && b > 0 && c > 0) {
			return 1;
		} else {
			throw new Exception("置顶失败");
		}

	}
}
