package ezen.dev.spring.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ezen.dev.spring.vo.CartVo;
import ezen.dev.spring.vo.DelVo;
import ezen.dev.spring.vo.MemberVo;
import ezen.dev.spring.vo.OrderVo;
import ezen.dev.spring.vo.ProductVo;

@Repository
public class DelDao {
	
	private SqlSession sqlSession;
	
	public static final String MAPPER = "ezen.dev.spring.del";
	
	@Autowired
	public DelDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
     
     
	public int addDel(DelVo delVo) {
		return sqlSession.insert(MAPPER+".addDel", delVo);
	}



	public DelVo getDelInfo(Integer oidx_od) {
		return sqlSession.selectOne(MAPPER+".getDelInfo",oidx_od);
	}	 
  
     
}
