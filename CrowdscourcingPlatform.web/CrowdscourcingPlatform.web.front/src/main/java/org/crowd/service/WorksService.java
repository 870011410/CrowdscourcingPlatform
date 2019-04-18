package org.crowd.service;

public interface WorksService {
	
	//作品发布
	Integer upWorks(String title, String content,String img,
			double money,Integer neeId,Integer useId,
					String Logcontent,String userName)throws Exception;

}
