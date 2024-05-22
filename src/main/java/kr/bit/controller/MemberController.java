package kr.bit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.bit.entity.Member;
import kr.bit.mapper.MemberMapper;

@Controller
public class MemberController {
	
	@Autowired
	MemberMapper memberMapper;
	

	@RequestMapping("/memberJoin")
	public String memberJoin() {
		return "member/join";
	}
	
	@RequestMapping("/memberRegisterCheck")   //ajax에서 넘긴 id값을 주입받음
	public @ResponseBody int memberRegisterCheck(@RequestParam("memberID") String memberID) {
		
		Member m=memberMapper.registerCheck(memberID);
		
		if(m!=null || memberID.equals("")) {
			return 0;
		}
		return 1;
	}
	
}
