package kr.bit.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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

	@RequestMapping("/memberRegisterCheck") // ajax에서 넘긴 id값을 주입받음
	public @ResponseBody int memberRegisterCheck(@RequestParam("memberID") String memberID) {

		Member m = memberMapper.registerCheck(memberID);

		if (m != null || memberID.equals("")) {
			return 0;
		}
		return 1;
	}

	@RequestMapping("/memberRegister")
	public String memberRegister(Member member, String memberPw1, String memberPw2, RedirectAttributes rttr,
			HttpSession session) {

		if (member.getMemberID().equals("") || memberPw1.equals("") || memberPw2.equals("")
				|| member.getMemberName().equals("") || member.getMemberGender().equals("")
				|| member.getMemberEmail().equals("")) {

			rttr.addFlashAttribute("msg1", "실패");
			rttr.addFlashAttribute("msg2", "입력해주세요");

			return "redirect:/memberJoin";
		}

		if (!memberPw1.equals(memberPw2)) {
			rttr.addFlashAttribute("msg1", "실패");
			rttr.addFlashAttribute("msg2", "비밀번호가 다릅니다");

			return "redirect:/memberJoin";
		}

		int result = memberMapper.register(member); // db에 회원정보 삽입
		member.setMemberProfile("");

		if (result == 1) { // 1행 추가됨-> insert 성공 되면
			rttr.addFlashAttribute("msg1", "성공");
			rttr.addFlashAttribute("msg2", "회원가입에 성공했습니다");

			session.setAttribute("memberVo", member);

			return "redirect:/";
		} else {
			rttr.addFlashAttribute("msg1", "실패");
			rttr.addFlashAttribute("msg2", "회원가입에 실패했습니다");

			return "redirect:memberJoin/";
		}
	}

	@RequestMapping("/memberLoginForm")
	public String memberLoginForm() {
		return "member/memberLoginForm";
	}

	@RequestMapping("/memberLogout")
	public String memberLogout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	@RequestMapping("/memberLogin")
	public String memberLogin(Member member, RedirectAttributes rttr, HttpSession session) {

		if (member.getMemberID().equals("") || member.getMemberPw().equals("")) {

			rttr.addFlashAttribute("msg1", "실패");
			rttr.addFlashAttribute("msg2", "아이디나 비밀번호를 입력하세요");

			return "redirect:memberLoginForm/";
		}

		Member memberVo = memberMapper.memberLogin(member);
		// id와 pw가 일치할경우 회원정보들을 memberVo에 저장

		if (memberVo != null) {
			rttr.addFlashAttribute("msg1", "성공");
			rttr.addFlashAttribute("msg2", "로그인 되었습니다");

			session.setAttribute("memberVo", memberVo);

			return "redirect:/";
		} else {

			rttr.addFlashAttribute("msg1", "실패");
			rttr.addFlashAttribute("msg2", "로그인 다시 하세요");
			return "redirect:memberLoginForm/";
		}
	}

	@RequestMapping("/memberUpdateForm")
	public String memberUpdateForm() {
		return "member/memberUpdateForm";
	}

	@RequestMapping("/memberUpdate") // 수정된 데이터들이 Member클래스의 객체의 필드에 각각담겨져있다!
	public String memberUpdate(Member member, String memberPw1, String memberPw2, RedirectAttributes rttr,
			HttpSession session) {

		if (member.getMemberID().equals("") || memberPw1.equals("") || memberPw2.equals("")
				|| member.getMemberName().equals("") || member.getMemberGender().equals("")
				|| member.getMemberEmail().equals("")) {

			rttr.addFlashAttribute("msg1", "실패");
			rttr.addFlashAttribute("msg2", "입력해주세요");

			return "redirect:/memberUpdateForm";
		}

		if (!memberPw1.equals(memberPw2)) {
			rttr.addFlashAttribute("msg1", "실패");
			rttr.addFlashAttribute("msg2", "비밀번호가 다릅니다");

			return "redirect:/memberUpdateForm";
		}

		int result = memberMapper.memberUpdate(member);

		if (result == 1) {
			rttr.addFlashAttribute("msg1", "성공");
			rttr.addFlashAttribute("msg2", "회원 수정에 성공했습니다");

			session.setAttribute("memberVo", member);
			// 수정된 데이터들을 세션영역 memberVo에 담아서 redirect로 화면이동

			return "redirect:/";
		} else { // 수정 실패했을 때
			rttr.addFlashAttribute("msg1", "실패");
			rttr.addFlashAttribute("msg2", "회원 수정에 실패했습니다");
			
			return "redirect:/memberUpdateForm";
		}
	}
}
