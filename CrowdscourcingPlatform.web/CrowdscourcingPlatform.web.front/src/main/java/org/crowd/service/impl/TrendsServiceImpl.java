package org.crowd.service.impl;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.crowd.dao.TrendsMapper;
import org.crowd.model.Trends;
import org.crowd.service.TrendsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
 * @date : 2018年12月18日 下午4:31:42
 * 
 * @version : 12.0.0
 */
@Service
public class TrendsServiceImpl implements TrendsService {

	@Autowired
	private TrendsMapper tm;

	// 查看所有行业动态总数
	@Override
	public int countAllTrends() {
		int i = tm.countAllTrends();
		return i;
	}

	// 分页查看所有行业动态
	@Override
	public List<Trends> showAllTrends(RowBounds rb) {
		List<Trends> list = tm.showAllTrends(rb);
		return list;
	}

}
