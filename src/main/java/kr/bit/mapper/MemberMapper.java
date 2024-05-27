package kr.bit.mapper;

import org.apache.ibatis.annotations.Mapper;

import kr.bit.entity.Member;
import kr.bit.entity.MemberAuth;

@Mapper
public interface MemberMapper {

	public Member registerCheck(String memberID);
	
	public int register(Member member);
	
	public Member memberLogin(Member memberVo);
	
	public int memberUpdate(Member memberVo);
	
	public Member getMember(String memberID);
	
	public void memberProfileUpdate(Member memberVo); //id기준으로 사진변경
	
	public void authInsert(MemberAuth memberAuth);
	
}
