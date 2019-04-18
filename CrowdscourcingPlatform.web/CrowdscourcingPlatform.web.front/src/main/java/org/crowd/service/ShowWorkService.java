package org.crowd.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.crowd.model.NeedTypeModel;
import org.crowd.model.dto.NeedDeti;
import org.crowd.model.dto.WorkDto;

import com.alibaba.fastjson.JSONObject;

public interface ShowWorkService {
	
    //显示作品(显示分页)
    JSONObject selectWorkMeg(Integer servId,Integer start,Integer limit,String title,Integer typeId);
   
    //查看某个作品的数据
    WorkDto selectWorkMegWithWorkId(Integer workId);
    
    //购买作品
    Integer buyWork(Integer workId,Integer buyerId,String userName,String workTitle,Double workMoney,String LogUserName)throws Exception;
}
