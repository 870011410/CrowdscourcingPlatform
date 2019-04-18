package org.crowd.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.crowd.dao.AccountMapper;
import org.crowd.dao.LogMapper;
import org.crowd.dao.ShowNeedMapper;
import org.crowd.dao.ShowWorkMapper;
import org.crowd.dao.UserMapper;
import org.crowd.dao.WorkTableMapper;
import org.crowd.model.User;
import org.crowd.model.dto.NeedDeti;
import org.crowd.model.dto.WorkDto;
import org.crowd.service.WorkTableService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSONObject;

/**
 * 
 * <p>
 * Title : WorkTableServiceImpl
 * </p>
 * <p>
 * Description :
 * </p>
 * <p>
 * DevelopTools : Eclipse_x64_v4.9.0
 * </p>
 * <p>
 * DevelopSystem : macOS Sierra 10.12.1
 * </p>
 * <p>
 * Company : org.crowds
 * </p>
 * 
 * @author : zhengjiawei
 * @date : 2018年12月13日 下午3:29:05
 * @version : 12.0.0
 */
//工作台的事务接口
@Service
public class WorkTableServiceImpl implements WorkTableService {

	@Autowired
	private WorkTableMapper workTableMapper;// 工作台事务dao
	@Autowired
	private ShowNeedMapper showNeedMapper;
	@Autowired
	private UserMapper userMapper;
	@Autowired
	private AccountMapper accountMapper;
	@Autowired
	private LogMapper logMapper;
	@Autowired
	private ShowWorkMapper showWorkMapper;

	// 显示自己需求情况
	@Transactional(rollbackFor = Exception.class)
	public List<NeedDeti> showMyselfNeeding(Integer userId, Integer start, Integer limit, Integer type) {
		// TODO Auto-generated method stub
		RowBounds rb = new RowBounds(start, limit);
		List<NeedDeti> needs = workTableMapper.showMyselfNeeding(userId, type, rb);

		return needs;
	}

	@Transactional(rollbackFor = Exception.class)
	public Integer showMyselfNeedingCount(Integer userId, Integer type) {
		// TODO Auto-generated method stub
		Integer count = workTableMapper.showMyselfNeedingCount(userId, type);
		return count;
	}

	// 雇主确定服务商完成项目(交项目付钱)
	@Transactional(rollbackFor = Exception.class)
	public String deliverSingle(Integer bidId, Integer bidUserId, Double money, User user, Integer needId)
			throws Exception {
		// TODO Auto-generated method stub
		// 判断用户的余额够不够
		if (user.getMoney() >= money) {
			// 余额够
			// 修改投标信息为已完成
			Integer index1 = showNeedMapper.updateBidType(bidId, 2);
			System.err.println("1");
			// 修改需求为已完成
			Integer index2 = showNeedMapper.updateNeedState(needId, 4);
			System.err.println("2");
			// 增加服务商余额
			Integer index3 = userMapper.recharge(bidUserId, money);
			System.err.println("3");
			// 减少雇主余额
			Integer index4 = userMapper.payAccount(user.getId(), money);
			System.err.println("4");
			// 添加账务信息
			Integer index5 = accountMapper.addAccount(user.getId(), bidUserId, -1, needId, -1, money, 1, "");
			System.err.println("5");
			// 记录日志
			Integer index6 = logMapper.createLog(user.getName(), "需求被完成");
			System.err.println("6");
			if (index1 > 0 && index2 > 0 && index3 > 0 && index4 > 0 && index5 > 0 && index6 > 0) {
				return "suc";
			} else {
				throw new Exception();
			}
		} else {
			return "noMoney";
		}

	}

	// 判断某个需求是否有人投标
	@Transactional(rollbackFor = Exception.class)
	public Integer checkNeedIsBid(Integer needId) {
		// TODO Auto-generated method stub
		Integer index = workTableMapper.checkNeedIsBid(needId);
		return index;
	}

	// 删除需求（流标）
	@Transactional(rollbackFor = Exception.class)
	public Integer deleteNeed(User user, Integer needId, Integer type, Integer score) throws Exception {
		// TODO Auto-generated method stub
		// 修改需求的状态
		Integer index1 = showNeedMapper.updateNeedState(needId, 5);
		Integer index2 = 1;
		if (type == 1) {
			// 扣除信用分
			index2 = workTableMapper.updateUserScore(user.getId(), -score);
		}
		// 添加日志
		Integer index3 = logMapper.createLog(user.getName(), "删除了需求");
		if (index1 > 0 && index2 > 0 && index3 > 0) {
			return 1;
		} else {
			throw new Exception();
		}

	}

	// 显示自己的投标
	@Transactional(rollbackFor = Exception.class)
	public List<NeedDeti> showMyselfBiding(Integer userId, Integer type, RowBounds rb, Integer state, Integer nState) {
		// TODO Auto-generated method stub
		List<NeedDeti> needs = workTableMapper.showMyselfBiding(userId, type, state, rb, nState);
		return needs;
	}

	// 显示自己的投标（数量）
	@Transactional(rollbackFor = Exception.class)
	public Integer showMyselfBidingCount(Integer userId, Integer type, Integer state, Integer nState) {
		// TODO Auto-generated method stub
		Integer count = workTableMapper.showMyselfBidingCount(userId, type, state, nState);
		return count;
	}

	// 取消自己的投标（数量）
	@Transactional(rollbackFor = Exception.class)
	public Integer deleteMyselfBid(Integer bidId, String userName) throws Exception {
		// TODO Auto-generated method stub
		// 添加日志
		Integer index = workTableMapper.deleteMyselfBid(bidId);
		Integer index1 = logMapper.createLog(userName, "取消的投标Id为" + bidId + "的投标");
		if (index > 0 && index1 > 0) {
			return 1;
		} else {
			throw new Exception();
		}
	}

	// 显示工作台我的作品(显示分页)
	@Override
	public JSONObject initMyWork(Integer start, Integer limit, Integer userId) {
		JSONObject data = new JSONObject();
		// 分页
		RowBounds rb = new RowBounds(start, limit);
		// 数量
		Integer count = workTableMapper.initMyWorkCount(userId);
		// 信息
		List<WorkDto> works = workTableMapper.initMyWork(userId, rb);

		data.put("count", count);
		data.put("works", works);
		return data;
	}

	// 上架下架 删除作品
	@Transactional(rollbackFor = Exception.class)
	public Integer updateState(Integer workId, Integer state, String userName, String content) throws Exception {
		// 添加日志
		Integer index = workTableMapper.updateState(workId, state);
		Integer index1 = logMapper.createLog(userName, content);
		if (index > 0 && index1 > 0) {
			return 1;
		} else {
			throw new Exception();
		}
	}

	// 修改我的作品
	@Transactional(rollbackFor = Exception.class)
	public Integer motifyMyWork(Integer workId, String title, Double money, Integer typeId, String workContent,
			String img, String content, String userName) throws Exception {
		// 添加日志
		Integer index = workTableMapper.motifyMyWork(workId, title, money, typeId, workContent, img);
		Integer index1 = logMapper.createLog(userName, content);
		if (index > 0 && index1 > 0) {
			return 1;
		} else {
			throw new Exception("修改作品失败！");
		}
	}

	@Override
	public JSONObject initBuyerWork(Integer start, Integer limit, Integer userId) {
		JSONObject data = new JSONObject();
		// 分页
		RowBounds rb = new RowBounds(start, limit);
		// 数量
		Integer count = workTableMapper.initBuyerWorkCount(userId);
		// 信息
		List<WorkDto> works = workTableMapper.initBuyerWork(userId, rb);
		

		data.put("count", count);
		data.put("works", works);
		return data;
	}

	// 购买的商品确认收货
	@Transactional(rollbackFor = Exception.class)
	public Integer okBuy(Integer workId, String content, String userName) throws Exception {
		// 添加日志
		Integer index = workTableMapper.okBuy(workId);
		Integer index1 = logMapper.createLog(userName, content);
		//修改对账状态
		Integer index2= accountMapper.okAccount(workId);
		if (index > 0 && index1 > 0&&index2 > 0) {
			return 1;
		} else {
			throw new Exception("确认收货失败！");
		}
	}
	//退款
	@Transactional(rollbackFor = Exception.class)
	public Integer returnMoney(Integer workId, Integer buyerId, Double workMoney, String content, String userName)
			throws Exception {
		//作品上架
		int state=1;
		int index1 = workTableMapper.updateState(workId,state);
		//作品购买人变成null
		int index5 = workTableMapper.updateBuyerId(workId,buyerId);
		//卖家扣钱
		int index2 = showWorkMapper.motifyBuyerMoney(userName,workMoney);
		//买家加钱
		int index3 = workTableMapper.motifySellerMoney(buyerId,workMoney);
		
		int index4 = logMapper.createLog(userName,content );
		
		Integer userId = userMapper.selectUserId(userName);
		
		int index6 =  accountMapper.addAccount(buyerId, userId, -1, -1, workId, workMoney, 3, "");
		if (index1 > 0 && index2 > 0&&index3 > 0 && index4 > 0&& index5 > 0&& index6 > 0) {
			return 1;
		} else {
			throw new Exception("退款失败！");
		}

	}

	//服务商发布作品文件该needSrc
	@Transactional(rollbackFor = Exception.class)
	public Integer updateNeedSrc(Integer needId, String src, String userName) throws Exception {
		// TODO Auto-generated method stub
		//修改需求src
		Integer index = workTableMapper.updateNeedSrc(needId, src);
		//添加日志
		Integer index1 = logMapper.createLog(userName, "提交了解决需求"+needId+"的文件");
		
		if(index>0&&index1>0) {
			return 1;
		}else {
			throw new Exception();
		}
	}
//联盟的投标中心
	@Transactional(rollbackFor = Exception.class)
	public List<NeedDeti> showLeagureBiding(Integer leaId, Integer type, Integer state, RowBounds rb, Integer nState) {
		// TODO Auto-generated method stub
		List<NeedDeti> needs = workTableMapper.showLeagureBiding(leaId, type, state, rb, nState);
	   return needs;
	}

	@Transactional(rollbackFor = Exception.class)
	public Integer showLeagureBidingCount(Integer leaId, Integer type, Integer state, Integer nState) {
		// TODO Auto-generated method stub
	   Integer count = workTableMapper.showLeagureBidingCount(leaId, type, state, nState);
	  return count;
	}

	// 雇主确定联盟完成项目(交项目付钱)
		@Transactional(rollbackFor = Exception.class)
		public String deliverLeague(Integer bidId, Integer leaId, Double money, User user, Integer needId)
				throws Exception {
			// TODO Auto-generated method stub
			// 判断用户的余额够不够
			if (user.getMoney() >= money) {
				// 余额够
				//查联盟盟主id
				Integer index0 = workTableMapper.selectMasterIdWithLeaId(leaId);
				// 修改投标信息为已完成
				Integer index1 = showNeedMapper.updateBidType(bidId, 2);
				System.err.println("1");
				// 修改需求为已完成
				Integer index2 = showNeedMapper.updateNeedState(needId, 4);
				System.err.println("2");
				// 增加服务商余额(联盟)
				Integer index3 = userMapper.recharge(index0, money);
				System.err.println("3");
				// 减少雇主余额
				Integer index4 = userMapper.payAccount(user.getId(), money);
				System.err.println("4");
				// 添加账务信息
				Integer index5 = accountMapper.addAccount(user.getId(), -1,leaId, needId, -1, money, 1, "");
				System.err.println("5");
				// 记录日志
				Integer index6 = logMapper.createLog(user.getName(), "需求被完成");
				System.err.println("6");
				if (index0!=null&&index1 > 0 && index2 > 0 && index3 > 0 && index4 > 0 && index5 > 0 && index6 > 0) {
					return "suc";
				} else {
					throw new Exception();
				}
			} else {
				return "noMoney";
			}

		}
		//卖家提交作品文件
		@Transactional(rollbackFor = Exception.class)
		public Integer updateWorkSrc(Integer workId, String src, String userName) throws Exception {
			// TODO Auto-generated method stub
			//修改作品src
			Integer index = workTableMapper.updateWorkSrc(workId, src);
			//添加日志
			Integer index1 = logMapper.createLog(userName, "提交了作品ID为"+workId+"的文件");
			
			if(index>0&&index1>0) {
				return 1;
			}else {
				throw new Exception();
			}
		}
	
}
