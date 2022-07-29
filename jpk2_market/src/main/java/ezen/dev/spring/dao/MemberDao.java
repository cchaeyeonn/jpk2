package ezen.dev.spring.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ezen.dev.spring.vo.MemberVo;

@Repository
public class MemberDao {

	//MyBatis를 이용해서 DB작업: SqlSession 객체 필요
	
	private SqlSession sqlSession;
	
	public static final String MAPPER = "ezen.dev.spring.dao";
	
	@Autowired
	public MemberDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public int joinMember(MemberVo memberVo) {
		//sqlSession객체를 이용한 입력작업: insert("Mapper파일의 네임스페이스.id값", 입력값/입력객체)
		
		return sqlSession.insert(MAPPER+".joinMember", memberVo);
	}
	
	public HashMap<String, Long> loginMember(HashMap<String, String> loginInfo) {
		HashMap<String, Long> resultMap = sqlSession.selectOne(MAPPER+".loginMember", loginInfo);
		
		if(resultMap.get("member_auth") == 0) {
			resultMap.put("member_grade", 0L);
		}
		return resultMap;
	}

	public MemberVo getMemberInfo(String member_id) {
		return sqlSession.selectOne(MAPPER+".getMemberInfo", member_id);
	}

	public int checkId(String id) {
		return sqlSession.selectOne(MAPPER+".checkId", id);
	}
	public int checkEmail(String email) {
		return sqlSession.selectOne(MAPPER+".checkEmail", email);
	}
	public int checkPw(MemberVo memberVo) {
		return sqlSession.selectOne(MAPPER+".checkPw", memberVo);
	}

	public MemberVo chkAuth(String authKey) throws Exception{

		return sqlSession.selectOne(MAPPER+".chkAuth", authKey);
	}

	public void successAuth(MemberVo memberVo) throws Exception{
		sqlSession.update(MAPPER+".successAuth", memberVo);
		
	}

	public String getAuthInfo(String member_id) {
		return sqlSession.selectOne(MAPPER+".getAuthInfo",member_id);
	}
	
	public String getNameInfo(String member_id) {
		return sqlSession.selectOne(MAPPER+".getNameInfo",member_id);
	}

	public MemberVo getIdInfo(HashMap<String, String> findId) {

		return sqlSession.selectOne(MAPPER+".getIdInfo", findId);
	}

	public int setTempPw(MemberVo memberVo) throws Exception{
		return sqlSession.update(MAPPER+".setTempPw", memberVo);
	}


	public void setUpdatePw(MemberVo memberVo) {
		sqlSession.update(MAPPER+".setUpdatePw", memberVo);
		
	}

}
