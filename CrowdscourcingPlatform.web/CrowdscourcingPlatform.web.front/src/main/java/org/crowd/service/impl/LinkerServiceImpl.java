package org.crowd.service.impl;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.crowd.dao.LinkerMapper;
import org.crowd.dao.LogMapper;

import org.crowd.model.Linker;
import org.crowd.model.Trends;
import org.crowd.service.LinkerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class LinkerServiceImpl implements LinkerService {

	@Autowired
	private LinkerMapper lmr;

	@Override
	public List<Linker> initLinker() {
		List<Linker> linker = lmr.initLinker();
		return linker;
	}


	

}
