package org.crowd.service.impl;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.crowd.dao.LogMapper;
import org.crowd.dao.TrendsMapper;
import org.crowd.model.Trends;
import org.crowd.service.TrendsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 
 * <p>
 * Title : TrendsServiceImpl
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
 * @date : 2018年12月7日 下午4:39:22
 * 
 * @version : 12.0.0
 */

@Service
public class TrendsServiceImpl implements TrendsService {

	@Autowired
	private TrendsMapper tm;

	@Autowired
	private LogMapper lm;

	// 查看所有行业动态总数
	@Override
	public int countAllTrends(String name, String time_from, String time_to, Integer steId, Integer state) {
		int i = tm.countAllTrends(name, time_from, time_to, steId, state);
		return i;
	}

	// 分页查看所有行业动态
	@Override
	public List<Trends> showAllTrends(RowBounds rb, String name, String time_from, String time_to, Integer steId,
			Integer state) {
		List<Trends> list = tm.showAllTrends(rb, name, time_from, time_to, steId, state);
		return list;
	}

	// 查看动态名是否重复
	@Override
	public int checkTrendsName(String name) {
		int i = tm.checkTrendsName(name);
		return i;
	}

	// 发布行业动态
	@Transactional(rollbackFor = Exception.class)
	public void createTrends(String name, Integer steId, String link, String admName) throws Exception {
		int a = tm.createTrends(name, steId, link);

		int b = lm.createLog(admName, "发布了行业动态：" + name);

		if (a > 0 && b > 0) {

		} else {
			throw new Exception("发布失败");
		}
	}

	// 修改行业动态
	@Transactional(rollbackFor = Exception.class)
	public void updateTrends(Integer id, String name, String link, String admName, Integer steId) throws Exception {
		int a = tm.updateTrends(id, name, link, steId);
		int b = lm.createLog(admName, "修改了行业动态：" + name);

		if (a > 0 && b > 0) {

		} else {
			throw new Exception("修改失败");
		}
	}

	// 查看修改行业动态时动态名是否重复
	@Override
	public int checkUpdateName(Integer id, String name) {
		int i = tm.checkUpdateName(id, name);
		return i;
	}

	// 删除行业动态
	@Transactional(rollbackFor = Exception.class)
	public void delTrends(Integer id, String name, String admName) throws Exception {
		int a = tm.delTrends(id);
		int b = lm.createLog(admName, "删除了行业动态：" + name);

		if (a > 0 && b > 0) {

		} else {
			throw new Exception("删除失败");
		}
	}

	// 上线行业动态
	@Transactional(rollbackFor = Exception.class)
	public void uplineTrends(Integer id, String name, String admName) throws Exception {
		int a = tm.uplineTrends(id);
		int b = lm.createLog(admName, "上线了行业动态：" + name);

		if (a > 0 && b > 0) {

		} else {
			throw new Exception("上线失败");
		}
	}

	// 下线行业动态
	@Transactional(rollbackFor = Exception.class)
	public void downlineTrends(Integer id, String name, String admName) throws Exception {
		int a = tm.downlineTrends(id);
		int b = lm.createLog(admName, "下线了行业动态：" + name);

		if (a > 0 && b > 0) {

		} else {
			throw new Exception("下线失败");
		}
	}

}
