package kr.bit.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import kr.bit.entity.Member;
import kr.bit.entity.MemberUser;
import kr.bit.mapper.MemberMapper;
				
public class MemberUserDetailsService implements UserDetailsService{

	@Autowired
	private MemberMapper memberMapper;

	
	@Override   //id를 기준으로 id, pw, auth 리턴받기- DB로부터 유저정보 가져옴
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		//유저정보 - 권한정보 가져오기  아이디 기준으로 
		Member memberVo=memberMapper.memberLogin(username);  // -> memberMapper 수정
		
		if(memberVo!=null) { //세가지 + @
			return new MemberUser(memberVo); //Member, MemberAuth ->  회원+권한 ->MemberUser에 담는다
		}
		else {
			throw new UsernameNotFoundException(username+"이 존재하지 않는다");
		}
	}								
}




