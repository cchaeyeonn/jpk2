package ezen.dev.spring.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ezen.dev.spring.vo.MemberVo;

@Repository
public class MemberDao {

	//MyBatis瑜� �씠�슜�빐�꽌 DB�옉�뾽: SqlSession 媛앹껜 �븘�슂
	
	private SqlSession sqlSession;
	
	public static final String MAPPER = "ezen.dev.spring.dao";
	
	@Autowired
	public MemberDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public int joinMember(MemberVo memberVo) {
		//sqlSession媛앹껜瑜� �씠�슜�븳 �엯�젰�옉�뾽: insert("Mapper�뙆�씪�쓽 �꽕�엫�뒪�럹�씠�뒪.id媛�", �엯�젰媛�/�엯�젰媛앹껜)
		
		return sqlSession.insert(MAPPER+".joinMember", memberVo);
	}
	
	public MemberVo loginMember(String member_id) {
	return sqlSession.selectOne(MAPPER+".loginMember", member_id);
	
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


	public void setUpdateMemberInfo(MemberVo memberVo) {
		sqlSession.update(MAPPER+".setUpdateMemberInfo", memberVo);
		
	}

	public void memberDelyn(MemberVo memberVo) {
		sqlSession.update(MAPPER+".memberDelyn", memberVo);
		
	}

	public int authEmail(MemberVo memberVo) {
		return sqlSession.selectOne(MAPPER+".authEmail", memberVo);
	}

}
