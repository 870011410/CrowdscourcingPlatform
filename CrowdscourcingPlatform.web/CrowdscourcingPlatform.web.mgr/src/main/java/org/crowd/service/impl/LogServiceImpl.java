package org.crowd.service.impl;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.crowd.dao.LogMapper;
import org.crowd.dao.TrendsMapper;
import org.crowd.model.Log;
import org.crowd.service.LogSerivce;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 
 * <p>
 * Title : LogServiceImpl
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
 * @date : 2018年12月8日 上午11:43:52
 * 
 * @version : 12.0.0
 */
@Service
public class LogServiceImpl implements LogSerivce {

	@Autowired
	private LogMapper lm;
	
	// 查看日志总数
	@Override
	public int countLog(String time_from, String time_to, String name) {
		int i = lm.countLog(time_from, time_to, name);
		return i;
	}
	
	// 分页查看日志
	@Override
	public List<Log> showLogs(RowBounds rb, String time_from, String time_to, String name) {
		List<Log> list = lm.showLogs(rb, time_from, time_to, name);
		return list;
	}

}
