package org.crowd.service.impl;

import java.util.List;
import org.apache.ibatis.session.RowBounds;
import org.crowd.dao.LogMapper;
import org.crowd.dao.StoryMapper;
import org.crowd.model.Story;
import org.crowd.service.StoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 
 * 
 * <p>
 * Title : StoryServiceImpl
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
 * @date : 2018年12月20日 上午10:34:29
 * 
 * @version : 12.0.0
 */
@Service
public class StoryServiceImpl implements StoryService {

	@Autowired
	private StoryMapper sm;

	// 查看所有故事总数
	@Override
	public int countAllStorys() {
		int i = sm.countAllStorys();
		return i;
	}

	// 分页查看所有故事
	@Override
	public List<Story> showAllStorys(RowBounds rb) {
		List<Story> list = sm.showAllStorys(rb);
		return list;
	}

}
