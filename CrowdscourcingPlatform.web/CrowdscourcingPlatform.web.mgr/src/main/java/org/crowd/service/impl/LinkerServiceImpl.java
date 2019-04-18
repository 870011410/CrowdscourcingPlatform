package org.crowd.service.impl;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.crowd.dao.LinkerMapper;
import org.crowd.dao.LogMapper;
import org.crowd.dao.TrendsMapper;
import org.crowd.model.Linker;
import org.crowd.model.Trends;
import org.crowd.service.LinkerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 
 * <p>
 * Title : LinkerServiceImpl
 * </p>
 * 
 * <p>
 * Description :
 * </p>
 * 
 * <p>
 * DevelopTools : Eclipse_x64_v4.9.0
 * </p>
 * 
 * <p>
 * DevelopSystem : Windows10
 * </p>
 * 
 * <p>
 * Company : org.wf
 * </p>
 * 
 * @author : WuFan
 * 
 * @date : 2018年12月8日 下午2:35:53
 * 
 * @version : 12.0.0
 */
@Service
public class LinkerServiceImpl implements LinkerService {

	@Autowired
	private LinkerMapper lmr;

	@Autowired
	private LogMapper lm;

	// 查看所有友情链接总数
	@Override
	public int countAllLinkers(String name, String time_from, String time_to, Integer state) {
		
		int i = lmr.countAllLinkers(name, time_from, time_to, state);
		return i;
	}

	// 分页查看所有友情链接
	@Override
	public List<Linker> showAllLinkers(RowBounds rb, String name, String time_from, String time_to, Integer state) {
		List<Linker> list = lmr.showAllLinkers(rb, name, time_from, time_to, state);
		return list;
	}

	// 查看链接名是否重复
	@Override
	public int checkLinkerName(String name) {
		int i = lmr.checkLinkerName(name);
		return i;
	}

	// 发布友情链接
	@Transactional(rollbackFor = Exception.class)
	public void createLinker(String name, String link, String admName) throws Exception {
		int a = lmr.createLinker(name, link);

		int b = lm.createLog(admName, "发布了友情链接：" + name);
		if (a > 0 && b > 0) {

		} else {
			throw new Exception("发布失败");
		}

	}

	// 修改友情链接
	@Transactional(rollbackFor = Exception.class)
	public void updateLinker(Integer id, String name, String link, String admName) throws Exception {
		int a = lmr.updateLinker(id, name, link);
		int b = lm.createLog(admName, "修改了友情链接：" + name);

		if (a > 0 && b > 0) {

		} else {
			throw new Exception("修改失败");
		}
	}

	// 查看修改友情链接时动态名是否重复
	@Override
	public int checkUpdateName(Integer id, String name) {
		int i = lmr.checkUpdateName(id, name);
		return i;
	}

	// 删除友情链接
	@Transactional(rollbackFor = Exception.class)
	public void delLinker(Integer id, String name, String admName) throws Exception {
		int a = lmr.delLinker(id);
		int b = lm.createLog(admName, "删除了友情链接：" + name);
		System.err.println("名字："+admName);
		if (a > 0 && b > 0) {

		} else {
			throw new Exception("删除失败");
		}
	}
	
	// 上线友情链接
	@Transactional(rollbackFor = Exception.class)
	public void uplineLinker(Integer id, String name, String admName) throws Exception {
		int a = lmr.uplineLinker(id);
		int b = lm.createLog(admName, "上线了友情链接：" + name);

		if (a > 0 && b > 0) {

		} else {
			throw new Exception("上线失败");
		}
	}

	// 下线友情链接
	@Transactional(rollbackFor = Exception.class)
	public void downlineLinker(Integer id, String name, String admName) throws Exception {
		int a = lmr.uplineLinker(id);
		int b = lm.createLog(admName, "下线了友情链接：" + name);

		if (a > 0 && b > 0) {

		} else {
			throw new Exception("下线失败");
		}
	}

}
