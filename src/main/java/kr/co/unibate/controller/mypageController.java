package kr.co.unibate.controller;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import kr.co.unibate.Service.BoardService;
import kr.co.unibate.Service.ClubService;
import kr.co.unibate.Service.LoginService;
import kr.co.unibate.bean.AgreeDisagreeBoard;
import kr.co.unibate.bean.AgreeDisagreeReply;
import kr.co.unibate.bean.ClubData;
import kr.co.unibate.bean.RTDebate;
import kr.co.unibate.bean.RTOpinion;
import kr.co.unibate.bean.User;
import kr.co.unibate.util.PageNumberingManager;
@SessionAttributes("id")
@Controller
public class mypageController {
	PageNumberingManager pageNumberingManager = PageNumberingManager.getInstance();
	@Autowired
	BoardService boardService;
	
	@Autowired
	LoginService loginService;
	
	@Autowired
	ClubService clubService;
	
	
	@RequestMapping(value="/my_club.do",method={RequestMethod.GET,RequestMethod.POST})
	 public String myclub(Model model,HttpServletRequest request){
	  
		HttpSession sessid = request.getSession() ;
		String myid = (String)sessid.getAttribute("userid");
		
		String my_club_num = boardService.My_Club_Num(myid);
		
		ClubData my_club = boardService.My_Club_Info(my_club_num);
		String my_club_member = boardService.My_Club_Member(my_club_num);
		
		ArrayList<User> my_club_member_list = boardService.My_Club_Member_List(my_club_num);
		String my_club_king = boardService.My_Club_King(my_club_num);
		
		model.addAttribute("my_club_king",my_club_king);
		model.addAttribute("my_club",my_club);
		model.addAttribute("my_club_member",my_club_member);
		model.addAttribute("my_club_member_list",my_club_member_list);
		
	  return "/mypage/myClub";
	  
	 }
	@RequestMapping(value="/my_debating.do",method={RequestMethod.GET,RequestMethod.POST})
	 public String my_debating(Model model){
	  
	  
	  return "/mypage/myDebating";
	  
	 }
	@RequestMapping(value="/my_history.do",method={RequestMethod.GET,RequestMethod.POST})
	 public String my_history(Model model){
	  
	  
	  return "/mypage/myHistory";
	  
	 }
	@RequestMapping(value="/reinfomation.do",method={RequestMethod.GET,RequestMethod.POST})
	public String recorrection(HttpSession session
			,Model model){
		
		String id = (String)session.getAttribute("userid");
		User user=this.loginService.callInfo(id);
		model.addAttribute("user",user);
		return "/mypage/infomodify";	
		
	}
	
	@RequestMapping(value="/info_modify.do",method={RequestMethod.GET,RequestMethod.POST})
	public String info_modify(RedirectAttributes redirectAttributes,HttpServletRequest request,
			HttpSession session
			,Model model) throws Exception{
		
		request.setCharacterEncoding("UTF-8");
		
		String pwd = request.getParameter("password");
		String pwd1 = request.getParameter("password1");
		String school = request.getParameter("school");
		String major = request.getParameter("major");
		String area = request.getParameter("area");
		String id = (String)session.getAttribute("userid");
		
		User user = new User();
		
		String realert="";
		
		user.setPwd(pwd);
		user.setSchool(school);
		user.setMajor(major);
		user.setArea(area);
		user.setId(id);
		
		if(!pwd.equals(pwd1) || pwd.length()<8){
			realert="비밀번호값 값이 올바르지 않습니다.";
			redirectAttributes.addFlashAttribute("realert",realert);
		}else if(school.equals("")){
			realert="학교가 입력되지 않았습니다.";
			redirectAttributes.addFlashAttribute("realert",realert);
		}else if(major.equals("")){
			realert="전공이 입력되지 않았습니다.";
			redirectAttributes.addFlashAttribute("realert",realert);
		}else{
			this.loginService.infoModify(user);
			realert="정보가 수정 되었습니다.";
			redirectAttributes.addFlashAttribute("realert",realert);
		}

		return "redirect:reinfomation.do";	
		
	}
	
	
	@RequestMapping(value="/ranking.do",method={RequestMethod.GET,RequestMethod.POST})
	public String ranking(HttpSession session
			,Model model){
		
		String id = (String)session.getAttribute("userid");
		User ind_rank = boardService.Ind_Rank(id);
		String my_club_num = boardService.My_Club_Num(id);
		ClubData my_club = boardService.My_Club_Rank(my_club_num);
		
		model.addAttribute("ind_rank",ind_rank);
		model.addAttribute("my_club",my_club);
		return "/mypage/myRank";	
		
	}
	

	@RequestMapping(value="/club_secession.do", method=RequestMethod.GET)
	public String club_secession(@RequestParam("club_name")String club_name,
			HttpSession session, RedirectAttributes redirectAttr,
			Model model){
		String id =(String)session.getAttribute("userid");
		int c_num = this.clubService.getClubNum(club_name);
		if(this.clubService.getClubFlag(id)==1){
			redirectAttr.addFlashAttribute("secessionErr","클럽장은 탈퇴 할수 없습니다.");
			return "redirect:/my_club.do";
		}else{
			this.clubService.secessionClub(id);
			this.clubService.clubNumReset(id);
			this.clubService.clubMemUp(c_num);
			redirectAttr.addFlashAttribute("secessionErr","탈퇴 되었습니다.");
			return "redirect:/my_club.do";
		}
		
	}
	
	
		
	@RequestMapping(value="/club_management.do", method=RequestMethod.GET)
	public String club_management(HttpSession session, RedirectAttributes redirectAttr,
			Model model){
		String myid = (String)session.getAttribute("userid");
		String my_club_num = boardService.My_Club_Num(myid);
		ClubData my_club = boardService.My_Club_Info(my_club_num);
		
		ArrayList<User> my_club_member_list = boardService.My_Club_Member_List(my_club_num);
		String my_club_king = boardService.My_Club_King(my_club_num);
		
		model.addAttribute("my_club_king",my_club_king);
		model.addAttribute("my_club",my_club);
		model.addAttribute("my_club_member_list",my_club_member_list);
		
		return "mypage/clubmanagement";
	}
	
	
	@RequestMapping(value="/club_fire.do", method=RequestMethod.GET)
	public String club_fire(@RequestParam("club_name")String club_name,
			@RequestParam("id")String id, RedirectAttributes redirectAttr,
			Model model){
		int c_num = this.clubService.getClubNum(club_name);
		if(this.clubService.getClubFlag(id)==1){
			redirectAttr.addFlashAttribute("secessionErr","클럽장은 탈퇴 할수 없습니다.");
			return "redirect:/club_management.do";
		}else{
			this.clubService.secessionClub(id);
			this.clubService.clubNumReset(id);
			this.clubService.clubMemUp(c_num);
			redirectAttr.addFlashAttribute("secessionErr","탈퇴 되었습니다.");
			return "redirect:/club_management.do";
		}
		
	}
	
	@RequestMapping(value="/manager_appointment.do", method=RequestMethod.GET)
	public String manager_appointment(@RequestParam("flag") String flag,
			@RequestParam("id")String id, RedirectAttributes redirectAttr,
			Model model){
		int c_flag=Integer.parseInt(flag);
			
		ClubData clubdata=new ClubData();
		clubdata.setClub_flag(c_flag);
		clubdata.setId(id);
		
		this.clubService.appointmentManager(clubdata);
		
		
		return "redirect:/club_management.do";
	}
	
	@RequestMapping(value="/mem_leave.do", method=RequestMethod.GET)
	public String mem_leave(@RequestParam("club_num") String club_num,HttpSession session,
			RedirectAttributes redirectAttr,
			Model model){
		
		String id = (String)session.getAttribute("userid");
		int c_num=Integer.parseInt(club_num);
		
		if(c_num != 0){
			this.clubService.secessionClub(id);
			this.clubService.clubNumReset(id);
			this.clubService.clubMemUp(c_num);
			this.clubService.deleteMem(id);
		}else{
			this.clubService.deleteMem(id);
		}
		redirectAttr.addFlashAttribute("userDel","탈퇴 하셨습니다.");
		return "redirect:/logout.do";
	}
	
}