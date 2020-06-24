package org.ywjava.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.ywjava.bean.User;

public interface UserDao {
	
	/**
	 * 查询所有用户
	 * */
	@Select(" select * from tb_user ")
	List<User> findAll();
	
	/**
	 * 添加用户
	 * */
	@Insert(" insert into tb_user(loginname,password,username,"
			+ "sex,age,address,phone,email,headPic) values(#{loginname},#{password},"
			+ "#{username},#{sex},#{age},#{address},#{phone},#{email},#{headPic}) ")
	void save(User user);
	
	/**
	 * 登录
	 * */
	@Select(" select * from tb_user where loginname = #{loginname} and password = #{password} ")
	User findByLogin(Map<String, String> param);


	/**
	 * 修改用户查询
	 * */

	@Select(" select * from tb_user where id = #{id} ")
	User findByupdata(Integer id);

	/**
	 * 修改用户信息
	 * */
	@Update(" update tb_user set loginname=#{loginname},password=#{password},username=#{username},sex=#{sex},age=#{age},address=#{address},phone=#{phone},email=#{email} where id=#{id}")
	User upBysupdata(User user1);

	
}
