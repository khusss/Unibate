package kr.co.unibate.controller;

import java.io.UnsupportedEncodingException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.unibate.bean.User;
import kr.co.unibate.Service.LoginService;

@Controller
public class LoginController {
	
	@Autowired
	LoginService loginService;
	
	@RequestMapping(value="/login.do",method={RequestMethod.GET,RequestMethod.POST})
	public String main(Model model){
	
		return "/login/loginhome";
	}
	

	////회원가입
	@RequestMapping(value="/member_form.do",method={RequestMethod.GET,RequestMethod.POST})
	public String member_form(Model model){
		
		return "/join/signup";//단순 뷰만 뿌려주는부분
	}
	
	
	@RequestMapping(value="/member_insert.do", method={RequestMethod.GET,RequestMethod.POST})
	public String member_insert(RedirectAttributes redirectAttributes,HttpServletRequest request, Model model) throws Exception{
		
		request.setCharacterEncoding("UTF-8");

		String id = request.getParameter("id");
		String email = request.getParameter("email_address");
		String pwd = request.getParameter("password");
		String pwd1 = request.getParameter("password1");
		String name = request.getParameter("name");
		String school = request.getParameter("school");
		String area = request.getParameter("area");
		String gender = request.getParameter("gender");
		String major = request.getParameter("major");
		User user = new User();
		user.setId(id);
		user.setEmail(email);
		user.setPwd(pwd1);
		user.setName(name);
		user.setSchool(school);
		user.setArea(area);
		user.setGender(gender);
		user.setMajor(major);
		
		String chk_id=loginService.id_check(id);
		String realert="";
		
		if(chk_id!=null && id.length()<10){
			realert="아이디 값이 올바르지 않습니다.";
			redirectAttributes.addFlashAttribute("realert",realert);
			return "redirect:member_form.do";
		}else if(!emailchk(email)){
			realert="이메일 값이 올바르지 않습니다.";
			redirectAttributes.addFlashAttribute("realert",realert);
			return "redirect:member_form.do";
		}else if( !pwd.equals(pwd1) || pwd.length()<8){
			realert="비밀번호값 값이 올바르지 않습니다.";
			redirectAttributes.addFlashAttribute("realert",realert);
			return "redirect:member_form.do";
		}else if(name.equals("")){
			realert="이름이 입력되지 않았습니다.";
			redirectAttributes.addFlashAttribute("realert",realert);
			return "redirect:member_form.do";
		}else if(school.equals("")){
			realert="학교가 입력되지 않았습니다.";
			redirectAttributes.addFlashAttribute("realert",realert);
			return "redirect:member_form.do";
		}else if(major.equals("")){
			realert="전공이 입력되지 않았습니다.";
			redirectAttributes.addFlashAttribute("realert",realert);
			return "redirect:member_form.do";
		}else{
			this.loginService.insertMember(user);
			return "redirect:login.do";
		}
		
		//단순 뷰만 뿌려주는부분
	}
	
	
	///////////////////////////////////////////////////회원가입 끝
	
	///////////////////////////////////////로그인

	@RequestMapping(value="/login_check.do",method={RequestMethod.GET,RequestMethod.POST})
	public String login_check (@RequestParam("id") String id,
			@RequestParam("password") String password,
			Model model){
		//model을 세션으로 생각하면 됨 
		int result=10;
		
		String chk_passwd=loginService.login(id);
		
		if(chk_passwd==null){
			result = -1;
			//id가 없을떄
		}else{
			if(!chk_passwd.equals(password)){
				result=0;
				//비밀번호가 틀렸을때
			}else{
				result=1;
				//성공
			}
		}
		
		model.addAttribute("result", result);
		model.addAttribute("id", id);
		
		return "/login/loginchk";
	}
	

	@RequestMapping(value="/logout.do",method={RequestMethod.GET,RequestMethod.POST})
	public String logout(Model model){
		
		
		return "/login/logout";
		
		
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	//ajax 동작 부분
	
	@RequestMapping(value="/id_check.do",method={RequestMethod.GET,RequestMethod.POST})
	public String id_check (@RequestParam("id") String id,Model model){
		//model을 세션으로 생각하면 됨 
		int result=10;
		String chk_id=loginService.id_check(id);
		if(id.length()<10){
			result = -1;
		}
		else if(chk_id==null){
			result = 0; /// 해당 아이디 사용가능
		}else{
			result = 1; //// 해당 아이디 사용불가능
		}
		
		model.addAttribute("result", result);
		model.addAttribute("id", id);
		
		return "/ajax/idcheck";
	}

	

	
	
	@RequestMapping(value="/email_check.do",method={RequestMethod.GET,RequestMethod.POST})
	public String email_check(@RequestParam("e_mail") String e_mail,Model model){
		boolean result = emailchk(e_mail);
		
		model.addAttribute("result",result);
		
		return "/ajax/email_check";
		
	}
	

	
	@RequestMapping(value="/pwd_check.do",method={RequestMethod.GET,RequestMethod.POST})
	public String pwd_check(HttpServletRequest request
			,Model model){
		String data=null;
		
		String pwd1=request.getParameter("password");
		String pwd2=request.getParameter("password1");
		
		if(pwd1.equals("")){
			data="<font color='#FF6600'><b>비밀번호를 입력하세요.</b></font>";
		}else if(pwd2.equals("")){	
			data="<font color='#FF6600'><b>비밀번호 확인을 입력하세요.</b></font>";
		}else if(pwd1.length()<8){
			data="<font color='#FF6600'><b>비밀번호를 8자 이상 입력하세요.</b></font>";
		}else if(pwd1.equals(pwd2)){
			data="<b>사용 가능한 비밀번호입니다.</b>";
		}
		else{
			data="<font color='#FF6600'><b>비밀번호가 일치하지 않습니다.</b></font>";
		}
		
		model.addAttribute("data",data);
		return "/ajax/other_check";
		
	}
	
	@RequestMapping(value="/name_check.do",method={RequestMethod.GET,RequestMethod.POST})
	public String name_check(@RequestParam("name") String name
			,Model model){
		String data=null;
		
		if(name.equals("")){
			data="<font color='#FF6600'><b>이름을 입력해주세요.</b></font>";
		}else{
			data="<b>이름을 입력하셨습니다.</b>";
		}

		model.addAttribute("data",data);

		return "/ajax/other_check";
		
	}
	
	@RequestMapping(value="/school_check.do",method={RequestMethod.GET,RequestMethod.POST})
	public String school_check(@RequestParam("school") String school
			,Model model){
		String data=null;

		if(school.equals("")){
			data="<font color='#FF6600'><b>학교를 입력해주세요.</b></font>";
		}else{
			data="<b>학교를 입력하셨습니다.</b>";
		}

		model.addAttribute("data",data);
		return "/ajax/other_check";
		
	}
	
	@RequestMapping(value="/major_check.do",method={RequestMethod.GET,RequestMethod.POST})
	public String major_check(@RequestParam("major") String major
			,Model model){
		String data=null;
		
		if(major.equals("")){
			data="<font color='#FF6600'><b>전공을 입력해주세요.</b></font>";
		}else{
			data="<b>전공를 입력하셨습니다.</b>";
		}

		model.addAttribute("data",data);
		return "/ajax/other_check";
		
	}
	
	//email 무결성 체크
	public boolean emailchk(String e_mail){
		boolean result = false;
		String regex = "^[_a-z0-9-]+(.[_a-z0-9-]+)*@(?:\\w+\\.)+\\w+$"; 
		Pattern p = Pattern.compile(regex);
		Matcher m = p.matcher(e_mail);
		if(m.matches()) {
			result = true; 
		}
		
		return result;
	}
	
	
	@RequestMapping(value="/id_checkp.do",method={RequestMethod.GET,RequestMethod.POST})
	public String id_checkp (@RequestParam("id") String id,Model model){
		//model을 세션으로 생각하면 됨 
		int result=10;
		String chk_id=loginService.id_check(id);
		if(id.length()<10){
			result = -1;
		}
		else if(chk_id==null){
			result = 2; /// 해당 아이디 사용가능
		}else{
			result = 3; //// 해당 아이디 사용불가능
		}
		
		model.addAttribute("result", result);
		model.addAttribute("id", id);
		
		return "/ajax/idcheck";
	}
	
	@RequestMapping(value="/member_find.do",method={RequestMethod.GET,RequestMethod.POST})
	public String member_find(Model model){
		
		model.addAttribute("member_insert",new User());
		return "/find/find_id";//단순 뷰만 뿌려주는부분
	}


	@RequestMapping(value = "/find_id.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String find_id(RedirectAttributes redirectAttributes, HttpServletRequest request, Model model) {

		int result = 10;
		// model을 세션으로 생각하면 됨
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		String find_id = loginService.find_id(email, name);
		User user = new User();
		user.setEmail(email);
		user.setName(name);
		String realert = "";

		if (user.getEmail() == "") {
			realert = "이메일을 입력하세요";
			redirectAttributes.addFlashAttribute("realert", realert);
		} else if (user.getName() == "") {
			realert = "이름을 입력하세요";
			redirectAttributes.addFlashAttribute("realert", realert);
		} else if(user.getEmail()!="" && user.getName()!=""&& find_id==null){
			result = 0; /// 입력된 정보와 돌일한 아이디가 없음
			redirectAttributes.addFlashAttribute("namecheckErr","해당 내용으로 가입된 정보가 없습니다.");
			return "redirect:/member_find.do";
			
		}else {
			result = 1; //// 입력된 정보와 동일한 아이디 발견
			redirectAttributes.addFlashAttribute("namecheckErr","아이디는 "+find_id.substring(0, (find_id.length()-4))+"**** 입니다.");
			return "redirect:/member_find.do";
		}

		

		return "redirect:/member_find.do";

	}
	
	@RequestMapping(value="/find_pwd.do",method={RequestMethod.GET,RequestMethod.POST})
	public String find_pwd(RedirectAttributes redirectAttributes,HttpServletRequest request, Model model) throws Exception{
		
		
		
		request.setCharacterEncoding("UTF-8");
		int result= 10;
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		String find_pwd = loginService.find_pwd(id, email, name);
		User user = new User();
		
		user.setId(id);
		user.setEmail(email);
		user.setName(name);
		
		
		String realert="";
		
		if(user.getId()==null){
			realert="아이디 값이 입력되지 않았습니다.";
			redirectAttributes.addFlashAttribute("realert",realert);
		}else if(!emailchk(user.getEmail())){
			realert="이메일 값이 입력되지 않았습니다.";
			redirectAttributes.addFlashAttribute("realert",realert);
		}else if(user.getName().equals("")){
			realert="이름이 입력되지 않았습니다.";
			redirectAttributes.addFlashAttribute("realert",realert);
		}else if(user.getId()!=null&&user.getEmail()!=null&&user.getName()!=null&&find_pwd == null) {
			result = 2; /// 입력된 정보와 돌일한 아이디가 없음
			redirectAttributes.addFlashAttribute("namecheckErr","해당 내용과 일치하는 정보가 없습니다..");
			return "redirect:/member_find.do";
		} else {
			result = 3; //// 입력된 정보와 동일한 아이디 발견
			redirectAttributes.addFlashAttribute("namecheckErr","비밀번호는 "+find_pwd.substring(0, (find_pwd.length()-4))+"**** 입니다.");
			return "redirect:/member_find.do";
		}
		return "redirect:/member_find.do";
	
		//단순 뷰만 뿌려주는부분
	}
	
}
