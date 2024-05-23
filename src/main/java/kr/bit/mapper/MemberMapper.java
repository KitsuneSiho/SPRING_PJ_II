package kr.bit.mapper;

import org.apache.ibatis.annotations.Mapper;

import kr.bit.entity.Member;

@Mapper
public interface MemberMapper {

	public Member registerCheck(String memberID);
	
	public int register(Member member);
	
	public Member memberLogin(Member memberVo);
	
	public int memberUpdate(Member memberVo);
	
	public Member getMember(String memberID);
	
}
