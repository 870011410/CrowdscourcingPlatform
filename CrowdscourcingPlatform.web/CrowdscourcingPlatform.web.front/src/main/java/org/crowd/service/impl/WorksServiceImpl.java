package org.crowd.service.impl;

import java.util.logging.LogManager;

import org.crowd.dao.LogMapper;
import org.crowd.dao.UserMapper;
import org.crowd.dao.WorksMapper;
import org.crowd.service.WorksService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class WorksServiceImpl implements WorksService {

	@Autowired
	private WorksMapper worksMapper;// 作品发布的界面的dao
	@Autowired
	LogMapper logMapper;
	
	
	// 作品发布
	@Transactional(rollbackFor = Exception.class)
	public Integer upWorks(String title, String content, String img, double money, Integer neeId, Integer useId,
			String Logcontent, String userName) throws Exception {
		int index1 = worksMapper.upWorks(title,content,img,money,neeId,useId);
		int index2 = logMapper.createLog(userName, Logcontent);
		if (index1 > 0 && index2 > 0) {

			return 1;
		} else {

			throw new Exception("作品发布失败！");
		}
	}

}
