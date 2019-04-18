package org.crowd.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.crowd.model.Linker;
import org.crowd.model.Story;
import org.crowd.model.Trends;


public interface LinkerService {
	
	//查询友情链接
	List<Linker> initLinker();
	
}
