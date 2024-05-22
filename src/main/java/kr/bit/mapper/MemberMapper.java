package kr.bit.mapper;

import org.apache.ibatis.annotations.Mapper;

import kr.bit.entity.Member;

@Mapper
public interface MemberMapper {

	public Member registerCheck(String memberID);
}
