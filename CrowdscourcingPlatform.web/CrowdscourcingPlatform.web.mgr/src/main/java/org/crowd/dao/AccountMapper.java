package org.crowd.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.crowd.model.dto.AccountDetaDto;

/**
 * 
     * <p>Title : AccountMapper</p>
     * <p>Description : </p>
     * <p>DevelopTools : Eclipse_x64_v4.9.0</p>
     * <p>DevelopSystem : window 7</p>
     * <p>Company : org.crowd</p>
     * @author : zhengjiawei
     * @date : 2018年12月9日 上午9:40:54
     * @version : 12.0.0
 */
//账务对账的dao
public interface AccountMapper {

	
	//账务对账的页码
	Integer accountCount(@Param("name") String name,@Param("sTime") String sTime,@Param("eTime") String eTime);

    //账务对账的页码
	List<AccountDetaDto> accountMeg(RowBounds rb, @Param("name") String name,@Param("sTime") String sTime,
			@Param("eTime") String eTime);



}
