package org.crowd.service.impl;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.crowd.dao.NewsMapper;
import org.crowd.model.News;
import org.crowd.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NewsServiceImpl implements NewsService {
	@Autowired
	private NewsMapper newsMapper;

	// 分页查询行业资讯的信息
	@Override
	public List<News> searchNewsInfo(RowBounds rb) {
		List<News> newsList = newsMapper.searchNewsInfo(rb);
		return newsList;
	}

	// 查询行业资讯的总数
	@Override
	public Integer searchNewsCount() {
		Integer count = newsMapper.searchNewsCount();
		return count;
	}

}
