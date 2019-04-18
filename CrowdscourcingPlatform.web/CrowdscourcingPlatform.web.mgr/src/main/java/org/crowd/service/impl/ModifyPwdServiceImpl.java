package org.crowd.service.impl;

import org.crowd.dao.ModifyPwdMapper;
import org.crowd.service.ModifyPwdService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
@Service
public class ModifyPwdServiceImpl implements ModifyPwdService {
	
	
	@Autowired
	private ModifyPwdMapper modifyPwdmapper;
	
	

	@Transactional(rollbackFor = Exception.class)
	public Integer modifyPwd(String id, String pwd) throws Exception {
		System.out.println("serviceImpl进来");
		int index = modifyPwdmapper.modifyPwd(id, pwd);
		System.out.println("index"+index);
		if (index > 0) {
			return index ;
		}
		return index;
	}
	
	
	
	

}
