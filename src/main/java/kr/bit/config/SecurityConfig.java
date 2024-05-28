package kr.bit.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.csrf.CsrfFilter;
import org.springframework.web.filter.CharacterEncodingFilter;

import kr.bit.security.MemberUserDetailsService;


@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
	
	@Bean
	public UserDetailsService userDetailsService() {
		return new MemberUserDetailsService();
	}
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(userDetailsService())
		.passwordEncoder(passwordEncoder());  //loadUserByUsername 함수 실행됨
	
	}

	//비밀번호 암호화 하기 위해 
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder(); //비밀번호를 암호하는데 사용할 수 있는 메서드를 가진 클래스
	}
		
	@Override
	protected void configure(HttpSecurity security) throws Exception {
		//요청에 대한 보안 -> 한글깨짐 방지
		CharacterEncodingFilter filter=new CharacterEncodingFilter();
		filter.setEncoding("UTF-8");
		filter.setForceEncoding(true);
		security.addFilterBefore(filter, CsrfFilter.class);
		
		//요청에 따른 권한 확인하고 서비스 하는 부분
		//인증: ex) 로그인 처리 (시큐리티에서 로그인, 로그아웃 처리 제공해줌)
		//인가: 인증된 사용자가 해당 기능을 접속할 권한이 있는지 확인(권한체크)
		
		security
				.authorizeRequests()  //시큐리티의 구성메서드 : 인가 규칙 설정
					.antMatchers("/") //경로에 대한 인가 설정 지정
					.permitAll()  //해당 경로에 대한 모든 요청을 인가 -> 모든 사용자 접근허용
					.and()
				.formLogin()  //스프링에서 제공해주는 폼이 기본으로 나온다
					.loginPage("/memberLoginForm")  //내가 폼 만든걸로 이동
					.loginProcessingUrl("/memberLogin") 
					.permitAll()
					.and()
				.logout()
					.invalidateHttpSession(true)
					.logoutSuccessUrl("/")
					.and()
				.exceptionHandling().accessDeniedPage("/access-denied");
	}
}

