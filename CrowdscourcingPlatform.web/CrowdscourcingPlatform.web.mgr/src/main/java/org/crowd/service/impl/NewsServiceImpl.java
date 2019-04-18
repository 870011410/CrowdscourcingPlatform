package org.crowd.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.crowd.dao.LogMapper;
import org.crowd.dao.NewsMapper;
import org.crowd.model.News;
import org.crowd.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class NewsServiceImpl implements NewsService {
	@Autowired
	private NewsMapper newsMapper;
	@Autowired
	private LogMapper lm;
	
	//分页查询行业资讯的信息
	@Override
	public List<News> searchNewsInfo(String name, Integer state, String startTime, String endTime, RowBounds rb) {
		List<News> newsList=newsMapper.searchNewsInfo(name, state, startTime, endTime, rb);
		return newsList;
	}
	
	//查询行业资讯的总数
	@Override
	public Integer searchNewsCount(String name, Integer state, String startTime, String endTime) {
		Integer count=newsMapper.searchNewsCount(name, state, startTime, endTime);
		return count;
	}

	//新增一条行业资讯
	@Override
	@Transactional(rollbackFor = Exception.class)
	public void createNews(String name, String link, String admName) throws Exception {
		Integer a=newsMapper.createNews(name, link);

		Integer b = lm.createLog(admName, "新增一条行业资讯：" + name);

		if (a > 0 && b > 0) {

		} else {
			throw new Exception("新增失败");
		}
	}

	//删除一条行业资讯
	@Override
	@Transactional(rollbackFor = Exception.class)
	public void deleteNews(Integer id, String name,String admName) throws Exception {
		Integer a=newsMapper.deleteNews(id);

		Integer b = lm.createLog(admName, "删除一条行业资讯：" + name);

		if (a > 0 && b > 0) {

		} else {
			throw new Exception("删除失败");
		}
		
	}

	//修改一条行业资讯
	@Override
	@Transactional(rollbackFor = Exception.class)
	public void modifyNews(Integer id, String name, String link, String admName) throws Exception {
		Integer a=newsMapper.modifyNews(id, name, link);

		Integer b = lm.createLog(admName, "修改一条行业资讯：" + name);

		if (a > 0 && b > 0) {

		} else {
			throw new Exception("修改失败");
		}
		
	}

	//上线一条行业资讯
	@Override
	@Transactional(rollbackFor = Exception.class)
	public void onlineNews(Integer id, String name,String admName) throws Exception {
		Integer a=newsMapper.onlineNews(id);

		Integer b = lm.createLog(admName, "上线一条行业资讯：" + name);

		if (a > 0 && b > 0) {

		} else {
			throw new Exception("上线失败");
		}
		
	}

	//下线一条行业资讯
	@Override
	@Transactional(rollbackFor = Exception.class)
	public void offlineNews(Integer id, String name,String admName) throws Exception {
		Integer a=newsMapper.offlineNews(id);

		Integer b = lm.createLog(admName, "下线一条行业资讯：" + name);

		if (a > 0 && b > 0) {
			System.err.println("a:"+a);
		} else {
			System.err.println("a:"+a);
			throw new Exception("下线失败");
		}
		
	}
	
}
