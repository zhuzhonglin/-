package org.ywjava.util;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

// mybatis的帮助类
public class MyBatisFactory {
	
	// 静态变量
	private static SqlSessionFactory sqlSessionFactory;
	
	// 静态块，在类中只执行一次 
	static {
		InputStream is = null;
		try {
			// 读取mybatis-config.xml文件返回输入流
			is = Resources.getResourceAsStream("mybatis-config.xml");
			// 通过解析mybatis-config.xml获得SqlSessionFactory对象
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(is);
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(is != null) 
					is.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	
	public static SqlSession getSqlSession() {
		return sqlSessionFactory.openSession();
	}

}
