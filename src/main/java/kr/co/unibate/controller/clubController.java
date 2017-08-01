package kr.co.unibate.controller;



import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import kr.co.unibate.Service.ClubService;
import kr.co.unibate.Service.FileUpService;
import kr.co.unibate.bean.ClubData;
import kr.co.unibate.bean.RecruitingBoard;
import kr.co.unibate.util.PageNumberingManager;

@Controller
public class clubController {
	
	@Autowired
	ClubService clubService;
	
	@Autowired
	FileUpService fileUpService;
	
	PageNumberingManager pageNumberingManager=PageNumberingManager.getInstance();
	
	// 동아리 가입
	
	@RequestMapping(value="/clubenrollment.do", method=RequestMethod.GET)
	public String loginHome(Model model){
		
		return "/club/clubenrollment";
	}
	
	@RequestMapping(value="/check.do", method=RequestMethod.POST)
	public String check(@RequestParam("club_name") String club_name
			,Model model){
		int result = this.clubService.clubNameCheck(club_name);
		String data;
		if (result >= 1){
			data="이름이 중복입니다.";
		}else{
			data="사용 가능한 이름입니다.";
		}
		
		if(club_name.equals("")){
			data="이름을 입력해주세요.";
		}
		model.addAttribute("result",result);
		model.addAttribute("data", data);
		
		return "/club/namecheck";
	}
	
	@RequestMapping(value="/clubmake.do", method=RequestMethod.POST)
	public String clubmake(HttpServletRequest request,
			Model model){
		
		String c_name =request.getParameter("club_name");
		
		int result = this.clubService.clubNameCheck(c_name);
		System.out.println("11111111");
		System.out.println(c_name);
		String json="{\"result\":\""+result+"\"}";
		
		model.addAttribute("json",json);
		
		return "/club/clubmake";
	}
	
	@RequestMapping(value = "/clubenrollment_ok.do", method = RequestMethod.POST)
	public String clubenrollment_ok(MultipartHttpServletRequest multipartRequest, 
			RedirectAttributes redirectAttr,
            Model model) throws Exception{
		
		String path = "/file/club/";
		String filename = FileUpService.fileUpload(multipartRequest , path);
		
		if(filename.equals("")){
			filename="Unibate.png";
		}
		
		
		String c_name=multipartRequest.getParameter("club_name");
		String c_info=multipartRequest.getParameter("club_introduce_text");
		String c_id = multipartRequest.getParameter("id");
		
		c_info = c_info.replaceAll("\r\n", "<br>");
		
		
		ClubData clubData = new ClubData();
		clubData.setClub_img(filename);
		clubData.setClub_introduce_text(c_info);
		clubData.setClub_name(c_name);
		clubData.setId(c_id);
		if (this.clubService.overlapCheck(c_id)==1 && this.clubService.clubJoinCheck(c_id)==1){
			redirectAttr.addFlashAttribute("overlapErr","이미 만드신 클럽이 있습니다.");
			return "redirect:/clubenrollment.do";
		}else{
			redirectAttr.addFlashAttribute("overlapErr","클럽이 개설되었습니다.");
			
			this.clubService.insertClub(clubData);
			clubData = this.clubService.clubMakeUser(c_id);
			System.out.println(clubData.getClub_num());
			this.clubService.insertCMemDB(clubData);
			this.clubService.upMemberClub(c_id);
			redirectAttr.addAttribute("pageNum", "1");
			return "redirect:/clubstatus.do";
		}

	}
	
	@RequestMapping(value="/clubstatus.do", method=RequestMethod.GET)
	public String clubstatus(
			@RequestParam("pageNum") String pageNum
			,Model model){
		
		if(pageNum==null){
			pageNum="1";
		}
		
		int pNum = Integer.parseInt(pageNum); 
		
		ArrayList<ClubData> clubBoard;
		int allClub;
		int start;
		int end = 15;
		
		allClub = this.clubService.getClubAll();
		
		start = (pNum-1)*end;
		
		System.out.println("start : "+start);
		System.out.println("end"+end);
		
		clubBoard = this.clubService.getClubBoard(start, end);
	
		
		System.out.println(allClub);
		
		int pageCount = pageNumberingManager.getTotalPage(allClub, 15);
		int pageBlock = pageNumberingManager.getPageBlock(pNum, 10);
		int pageBStart = pageNumberingManager.getFirstpageInBlock(pageBlock, 10);
		int pageBEnd = pageNumberingManager.getLastPageInBlock(pageBlock, 10);
		
		System.out.println("pageCount : "+pageCount);
		System.out.println("pageBlock : "+pageBlock);
		System.out.println("pageBStart : "+pageBStart);
		System.out.println("pageBEnd : "+pageBEnd);
		
		
		model.addAttribute("cboard", clubBoard);
		model.addAttribute("allClub", allClub);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("pageBlock",pageBlock);
		model.addAttribute("pageStart",pageBStart);
		model.addAttribute("pageEnd",pageBEnd);
		model.addAttribute("pageNum",pageNum);
		
		return "/club/club";
	}
	
	@RequestMapping(value="/recruiting.do", method=RequestMethod.GET)
	public String recruiting(
			@RequestParam("pageNum") String pageNum
			,Model model){
		
		if(pageNum==null){
			pageNum="1";
		}
		int pNum = Integer.parseInt(pageNum); 
		
		ArrayList<RecruitingBoard> recruitingBoard;
		int allRecruit;
		int start;
		int end = 15;
		
		allRecruit = this.clubService.RecruitAll();
		
		start = (pNum-1)*end;
		
		System.out.println("start : "+start);
		System.out.println("end"+end);
		
		recruitingBoard = this.clubService.getRecruitBoard(start, end);
	
		
		System.out.println(allRecruit);
		
		int pageCount = pageNumberingManager.getTotalPage(allRecruit, 15);
		int pageBlock = pageNumberingManager.getPageBlock(pNum, 10);
		int pageBStart = pageNumberingManager.getFirstpageInBlock(pageBlock, 10);
		int pageBEnd = pageNumberingManager.getLastPageInBlock(pageBlock, 10);
		
		System.out.println("pageCount : "+pageCount);
		System.out.println("pageBlock : "+pageBlock);
		System.out.println("pageBStart : "+pageBStart);
		System.out.println("pageBEnd : "+pageBEnd);
		
		model.addAttribute("rBoard", recruitingBoard);
		model.addAttribute("allRecruit", allRecruit);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("pageBlock",pageBlock);
		model.addAttribute("pageStart",pageBStart);
		model.addAttribute("pageEnd",pageBEnd);
		model.addAttribute("pageNum",pageNum);
		
		return "/club/recruit";
	}
	
	
	@RequestMapping(value="/recruit_write.do", method=RequestMethod.GET)
	public String recruit_write(@RequestParam("pageNum") String pageNum
			,Model model){
		
		model.addAttribute("pageNum", pageNum);
		return "/club/recruitwrite";
	}
	
	@RequestMapping(value="/recruit_write_ok.do", method=RequestMethod.POST)
	public String recruit_write_ok(MultipartHttpServletRequest multipartRequest,
			@RequestParam("pageNum") String pageNum
			,Model model){
		
		String r_subject=multipartRequest.getParameter("recruit_subject");
		String r_content=multipartRequest.getParameter("recruit_content");
		String r_id = multipartRequest.getParameter("id");
		
		String path = "/file/recruit/";
		String filename = FileUpService.fileUpload(multipartRequest , path);
		
		RecruitingBoard recruitingBoard = new RecruitingBoard();
		
		recruitingBoard.setId(r_id);
		recruitingBoard.setImg(filename);
		recruitingBoard.setRecruit_subject(r_subject);
		recruitingBoard.setRecruit_content(r_content);
		
		this.clubService.insertRecruit(recruitingBoard);
		
		model.addAttribute("pageNum", pageNum);
		
		return "redirect:/recruiting.do";
	}
	
	@RequestMapping(value="/recruit_View.do", method=RequestMethod.GET)
	public String recruit_View(@RequestParam("pageNum") String pageNum,
			@RequestParam("recruit_num") String recruit_num,
											Model model){
		
		int f_num = Integer.parseInt(recruit_num);
		
		this.clubService.Recruitsup(f_num);
		
		RecruitingBoard recruitingBoard=this.clubService.getRecruit(f_num);
		
		model.addAttribute("rboard", recruitingBoard);
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("recruit_num",recruit_num);
		
		return "/club/recruitView";
	}
	
	@RequestMapping(value="/	deleteRboard.do", method=RequestMethod.GET)
	public String deleteFboard(@RequestParam("pageNum") String pageNum,
			@RequestParam("recruit_num") String recruit_num,
											Model model){
		
		int r_num = Integer.parseInt(recruit_num);
		
		this.clubService.deleteRecruit(r_num);
		
		model.addAttribute("pageNum",pageNum);
		
		return "redirect:/recruiting.do";
	}
	@RequestMapping(value="/clubjoin.do", method=RequestMethod.POST)
	public String clubjoin(HttpServletRequest request, RedirectAttributes redirectAttr,
			Model model){
		HttpSession session = request.getSession() ;
		String c_id = (String)session.getAttribute("userid");
		System.out.println(c_id);
		String club_name = request.getParameter("club_name");
		System.out.println(club_name);
		int c_num=this.clubService.getClubNum(club_name);
		System.out.println(c_num);
		int result=this.clubService.clubJoinCheck(c_id);
		System.out.println(result);
		
		ClubData clubData=new ClubData();
		
		clubData.setId(c_id);
		clubData.setClub_num(c_num);
		
		if(result==0){
			this.clubService.clubMemIn(clubData);
			this.clubService.upMemberClub(c_id);
			this.clubService.clubMemUp(c_num);
			redirectAttr.addFlashAttribute("joinCheck","클럽에 가입되었습니다.");
			redirectAttr.addAttribute("pageNum", "1");
			return "redirect:/clubstatus.do";
		}else{
			redirectAttr.addFlashAttribute("joinCheck","이미 클럽에 가입되었습니다.");
			redirectAttr.addAttribute("pageNum", "1");
			return "redirect:/clubstatus.do";
		}
	}
	
	
		
}
