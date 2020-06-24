package org.ywjava.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.ywjava.bean.Cloth;

public interface ClothDao {
	
	@Select(" select *  from tb_cloth ")
	List<Cloth> findAll();
	
	@Select(" select * from tb_cloth where id = #{id} ")
	Cloth findById(Integer id);

}
