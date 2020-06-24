package org.ywjava.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.ywjava.bean.Cloth;
import org.ywjava.bean.User;
import org.ywjava.dao.ClothDao;
import org.ywjava.dao.UserDao;
import org.ywjava.util.MyBatisFactory;

/**
 *  服务层对应业务操作
 *
 */
public class JDService {
	
	/**
	 * 对应注册页面的注册功能
	 * @param 要保存的User对象
	 * */
	public void register(User user) {
		System.out.println("调用服务层的register方法 -->");
		// 获得SqlSession对象
		SqlSession sqlSession = MyBatisFactory.getSqlSession();
		try {
			// 通过sqlSession获取UserDao（反射）
			UserDao userDao = sqlSession.getMapper(UserDao.class);
			// 保存数据
			userDao.save(user);
			// 提交
			sqlSession.commit();
		}catch(Exception e){
			// 回滚
			sqlSession.rollback();
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
	}
	
	/**
	 * 对应登录页面的登录功能
	 * @param Map对象,包含登录的登录名和密码
	 * @return 用户存在，返回包含用户信息的User对象
	 * 			用户不存在，返回null
	 * */
	public User login(Map<String, String> param) {
		System.out.println("调用服务层的login方法 -->");
		// 获得SqlSession对象
		SqlSession sqlSession = MyBatisFactory.getSqlSession();
		try {
			// 通过sqlSession获取UserDao（反射）
			UserDao userDao = sqlSession.getMapper(UserDao.class);
			// 调用Dao的登录方法
			User user = userDao.findByLogin(param);
			// 提交
			sqlSession.commit();
			return user;
		}catch(Exception e){
			// 回滚
			sqlSession.rollback();
			e.printStackTrace();
			return null;
		} finally {
			sqlSession.close();
		}
	}
	
	
	/**
	 * 对应首页功能
	 * @return 所有服装的集合
	 * */
	public List<Cloth> findAllcloth() {
		System.out.println("调用服务层的findAllCLothDao方法 -->");
		// 获得SqlSession对象
		SqlSession sqlSession = MyBatisFactory.getSqlSession();
		try {
			// 通过sqlSession获取UserDao（反射）
			ClothDao clothDao = sqlSession.getMapper(ClothDao.class);
			// 调用Dao的获取所有与图书方法
			List<Cloth> cloths = clothDao.findAll();
			// 提交
			sqlSession.commit();
			return cloths;
		}catch(Exception e){
			// 回滚
			sqlSession.rollback();
			e.printStackTrace();
			return null;
		} finally {
			sqlSession.close();
		}
	}
	
	/**
	 * 对应详情功能
	 * @return 单件服装的对象
	 * */
	public Cloth findById(Integer id) {
		System.out.println("调用服务层的findById方法 -->");
		// 获得SqlSession对象
		SqlSession sqlSession = MyBatisFactory.getSqlSession();
		try {
			// 通过sqlSession获取UserDao（反射）
			ClothDao clothDao = sqlSession.getMapper(ClothDao.class);
			
			Cloth cloth = clothDao.findById(id);
			
			// 提交
			sqlSession.commit();
			return cloth;
		}catch(Exception e){
			// 回滚
			sqlSession.rollback();
			e.printStackTrace();
			return null;
		} finally {
			sqlSession.close();
		}
	}

	/**
	 * 对应修改信息的查询功能
	 * @param 要修改的User对象
	 * */
	public User updata(Integer id) {
		System.out.println("调用服务层的updata查询修改对象方法 -->");
		// 获得SqlSession对象
		SqlSession sqlSession = MyBatisFactory.getSqlSession();
		try {
			// 通过sqlSession获取UserDao（反射）
			UserDao userDao = sqlSession.getMapper(UserDao.class);
			// 调用Dao的登录方法
			User user = userDao.findByupdata(id);
			// 提交
			sqlSession.commit();
			return user;
		}catch(Exception e){
			// 回滚
			sqlSession.rollback();
			e.printStackTrace();
			return null;
		} finally {
			sqlSession.close();
		}
	}
	/**
	 * 对应修改信息页面的修改功能
	 * @param 要修改的User对象
	 * */
	public User supdata(User user) {
				System.out.println("调用服务层的supdata方法修用户对象 -->");
				// 获得SqlSession对象
				SqlSession sqlSession = MyBatisFactory.getSqlSession();
				try {
					// 通过sqlSession获取UserDao（反射）
					UserDao userDao = sqlSession.getMapper(UserDao.class);
					// 调用Dao的修改方法
					User user1= userDao.upBysupdata(user);
					// 提交
					sqlSession.commit();
					return user;
				}catch(Exception e){
					
					// 回滚
					sqlSession.rollback();
					e.printStackTrace();
					return null;
				} finally {
					sqlSession.close();
				}
			
		
	}


		

	
	}


