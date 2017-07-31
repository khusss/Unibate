package kr.co.unibate.controller;



import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.unibate.Service.ComunityService;
import kr.co.unibate.Service.LoginService;
import kr.co.unibate.Service.RealTimeService;
import kr.co.unibate.bean.ClubData;
import kr.co.unibate.bean.CompetitionInfo;
import kr.co.unibate.bean.NoticeBoard;
import kr.co.unibate.bean.Proposal;
import kr.co.unibate.bean.RTDebate;
import kr.co.unibate.bean.RTResult;
import kr.co.unibate.bean.User;
import kr.co.unibate.util.PageNumberingManager;

@Controller
public class adminController {
	
	@Autowired
	LoginService loginService;
	
	@Autowired
	ComunityService comunityService;
	
	@Autowired
	RealTimeService realTimeService;
	
	PageNumberingManager pageNumberingManager = PageNumberingManager.getInstance();
	
	@RequestMapping(value="/admain.do",method={RequestMethod.GET,RequestMethod.POST})
	public String admain(Model model){
	
		return "/admin/admain";
	}
	
	@RequestMapping(value="/compReg.do", method=RequestMethod.GET)
	public String compinsert(Model model){
		if(this.comunityService.getCompetitionInfoCheck()>0){
			comunityService.CompetitionDelete();
			
			ArrayList<CompetitionInfo> competitionInfo;
			
			competitionInfo=comunityService.getCompInfo();
			
			int counter = competitionInfo.size();
			
			
			model.addAttribute("comp", competitionInfo);
			model.addAttribute("counter", counter);
		}
		return "/admin/comptition";
	}
	
	@RequestMapping(value="/compcheck.do", method=RequestMethod.POST)
	public String compcheck(
			HttpServletRequest request,
			@RequestParam("year") String year,
			@RequestParam("mon") String mon,
			@RequestParam("date") String date
			,Model model){
		String yearDate=year+"-"+mon+"-"+date;
		CompetitionInfo compinsert=new CompetitionInfo();
		compinsert.setCompetition_name(request.getParameter("competition_name"));
		compinsert.setCompetition_local(request.getParameter("competition_local"));
		compinsert.setCompetition_url(request.getParameter("competition_url"));
		compinsert.setCompetition_date(yearDate);
		
		comunityService.CompetitionInsert(compinsert);
		
		return "redirect:/compReg.do";
	}
	
	@RequestMapping(value="/memberReg.do",method={RequestMethod.GET,RequestMethod.POST})
	public String memberReg(HttpServletRequest request,Model model){
		
		return "/admin/memberReg";
	}
	@RequestMapping(value="/memberReg_chk.do",method={RequestMethod.GET,RequestMethod.POST})
	public String memberReg_chk(HttpServletRequest request,Model model){
		
		if(request.getParameter("option").equals("mem")){
			ArrayList<User> user = this.loginService.getMemberAll();
			model.addAttribute("user", user);
		}else{
			ArrayList<ClubData> club =this.loginService.getClubAllData();
			model.addAttribute("club", club);
		}
		return "/admin/memberReg";
	}
	
	@RequestMapping(value="/memdeletechk.do",method={RequestMethod.GET,RequestMethod.POST})
	public String memdelete(HttpServletRequest request,Model model){
		String id =request.getParameter("userid");
		this.loginService.deleteMember(id);
		return "redirect:/memberReg_chk.do?option=mem";
	}
	
	@RequestMapping(value="/clubdeletechk.do",method={RequestMethod.GET,RequestMethod.POST})
	public String clubdeletechk(HttpServletRequest request,Model model){
		String club_num =request.getParameter("club_num");
		this.loginService.clubmemReset(club_num);
		this.loginService.clubMemDel(club_num);
		this.loginService.clubDel(club_num);
		return "redirect:/memberReg_chk.do?option=club";
	}
	
	@RequestMapping(value="/noticeReg.do",method={RequestMethod.GET,RequestMethod.POST})
	public String noticeReg(@RequestParam("pageNum") String pageNum,Model model){
		int pNum = Integer.parseInt(pageNum); 
		
		ArrayList<NoticeBoard> noticeBoard;
		int allNotice;
		int start;
		int end = 15;
		
		allNotice = comunityService.getNoticeAll();
		
		start = (pNum-1)*end;
		
		noticeBoard = comunityService.getNoticeBoard(start, end);
		
		int pageCount = pageNumberingManager.getTotalPage(allNotice, 15);
		int pageBlock = pageNumberingManager.getPageBlock(pNum, 10);
		int pageBStart = pageNumberingManager.getFirstpageInBlock(pageBlock, 10);
		int pageBEnd = pageNumberingManager.getLastPageInBlock(pageBlock, 10);
		
		model.addAttribute("nboard", noticeBoard);
		model.addAttribute("allNotice", allNotice);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("pageBlock",pageBlock);
		model.addAttribute("pageStart",pageBStart);
		model.addAttribute("pageEnd",pageBEnd);
		model.addAttribute("pageNum",pageNum);
		return "/admin/noticeReg";
	}
	
	@RequestMapping(value="/insertNotice.do",method={RequestMethod.GET,RequestMethod.POST})
	public String insertNotice(@RequestParam("pageNum") String pageNum,Model model){
		return "/admin/noticeWrite";
	}
	
	@RequestMapping(value="/insertNotice_ok.do",method={RequestMethod.GET,RequestMethod.POST})
	public String insertNotice_ok(@RequestParam("pageNum") String pageNum,
			@RequestParam("notice_subject") String notice_subject,
			@RequestParam("notice_content") String notice_content,Model model){
		
		notice_content=notice_content.replaceAll("\r\n", "<br>");
		this.loginService.insertNotice(notice_subject, notice_content);
		return "redirect:/noticeReg.do?pageNum=1";
	}
	
	@RequestMapping(value="/noticeRegView.do",method={RequestMethod.GET,RequestMethod.POST})
	public String noticeRegView(@RequestParam("pageNum") String pageNum,
			@RequestParam("notice_num") String notice_num,Model model){
		
		int n_num = Integer.parseInt(notice_num);
		
		
		int count = comunityService.getNoticeAll();
		
		NoticeBoard noticeBoard=comunityService.getNotice(n_num);
		
		model.addAttribute("noticeboard", noticeBoard);
		
		model.addAttribute("notice_num", n_num);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("noticesum",count);

		return "/admin/noticeView";
	}
	@RequestMapping(value="/noticedel.do",method={RequestMethod.GET,RequestMethod.POST})
	public String noticedel(@RequestParam("pageNum") String pageNum,
			@RequestParam("notice_num") String notice_num,Model model){
		
		this.loginService.delNoticeBoard(notice_num);

		return "redirect:/noticeReg.do?pageNum="+pageNum;
	}
	
	
	@RequestMapping(value="/realtimeReg.do",method={RequestMethod.GET,RequestMethod.POST})
	public String realtimeReg(Model model){
	
		
		return "/admin/realTimeManager";
	}
	@RequestMapping(value="/realtimeInsert.do",method={RequestMethod.GET,RequestMethod.POST})
	public String realtimeInsert(Model model){
	
		
		return "/admin/realTimeInsert";
	}
	@RequestMapping(value="/realtextInsert.do",method={RequestMethod.GET,RequestMethod.POST})
	public String realtextInsert(Model model,@RequestParam("d_subject") String d_subject,
			@RequestParam("d_content") String d_content){


		try {
			realTimeService.Insert_Rt_Debate(d_subject, d_content);
		} catch (Exception e) {
			System.out.println("에러에러에러::::");
		}
		
		
		
		return "redirect:/realtimeReg.do";
	}
	
	@RequestMapping(value="/realtimeResult.do",method={RequestMethod.GET,RequestMethod.POST})
	public String realtimeResult(Model model){
		
		
		int max_dnum_debate= realTimeService.Get_Maxdnum_Debate();
		
		
		int max_dnum_result;
		try {
			
			max_dnum_result = realTimeService.Get_Maxdnum_Result();
			
		} catch (Exception e) {
			max_dnum_result =0;
		
		}
		
		if(max_dnum_debate>max_dnum_result){
			
		for(int i = max_dnum_result+1 ; i <= max_dnum_debate ; i++){
			String d_num = toString().valueOf(i);
			RTDebate rtdbate=realTimeService.Get_Rt_subj(d_num);
			int agree_score = 0;
			int disagree_score = 0;
			
			
			try {
				agree_score = realTimeService.Get_Score(d_num,"1");
				
			} catch (Exception e) {
				System.out.println("토론 참여자 없어서 찬성스코어 0");
			}
			try {
				disagree_score = realTimeService.Get_Score(d_num,"2");
			} catch (Exception e) {
				System.out.println("토론 참여자 없어서 반대스코어 0");
			}
			
			
			
			String best_mem = realTimeService.Get_Best_Mem_Id(d_num);
			
			// 승패 %로 나타내기
			float a = (((float)agree_score/(agree_score+disagree_score)))*100;
			double score = Math.round(a*100d) / 100d;
			double dis_score=Math.round((100-score)*100d) / 100d;
			
			
			String ag_score = toString().valueOf(score);
			String disag_score = toString().valueOf(dis_score);
			//end_date(30일 후) 구하기
			
			SimpleDateFormat formatter = new SimpleDateFormat ("yyyy-MM-dd hh:mm:ss");
			Calendar cal = Calendar.getInstance();
			String today = null;
			cal.setTime(rtdbate.getD_date());
			cal.add(Calendar.DATE, 30);
			today = formatter.format(cal.getTime());
			Timestamp end_date = Timestamp.valueOf(today);
			
			try {
				String mem_school=realTimeService.Get_Mem_School(best_mem);
				model.addAttribute("mem_school", mem_school);
				
			} catch (Exception e) {
				String mem_school = "일반";
				model.addAttribute("mem_school", mem_school);
			}
			
			realTimeService.Insert_Rt_Result(d_num, rtdbate.getD_subject(),
					best_mem, ag_score, disag_score, rtdbate.getD_date().toString(), end_date.toString());
		
		}
		
		
		}else{
			
			
			return "/admin/realTimeResult";
		}
		
		
		
		return "/admin/realTimeManager";
	}
	
	@RequestMapping(value="/realtimeBest.do",method={RequestMethod.GET,RequestMethod.POST})
	public String realtimeBest(Model model){
	
		ArrayList<RTResult> rtResult=realTimeService.Get_Debate_List();
		
		model.addAttribute("rtResult", rtResult);
		return "/admin/realTimeBest";
	}

	@RequestMapping(value="/bestInsert.do",method={RequestMethod.GET,RequestMethod.POST})
	public String bestInsert(Model model,@RequestParam("d_num") String d_num,@RequestParam("best_year") String best_year,
			@RequestParam("best_month") String best_month){
	
		realTimeService.Insert_Tmp_Best(d_num, best_month, best_year);

		return "/admin/realTimeManager";
	}
	
	@RequestMapping(value="/proposal_View.do",method={RequestMethod.GET,RequestMethod.POST})
	public String proposalView(@RequestParam("proposal_num") int proposal_num, @RequestParam("pageNum") int pageNum, Model model) {

		int pNum = pageNum;
		
		ArrayList<Proposal> proposal_List;
		
		
		int total_singo=0;
		int start;
		int end = 15;
		total_singo = comunityService.total_proposal();
		
		start = (pNum-1)*end;
		proposal_List =comunityService.getProposal_List(start,end);
		
		int pageCount = pageNumberingManager.getTotalPage(total_singo, 15);
		int pageBlock = pageNumberingManager.getPageBlock(pNum, 10);
		int pageBStart = pageNumberingManager.getFirstpageInBlock(pageBlock, 10);
		int pageBEnd = pageNumberingManager.getLastPageInBlock(pageBlock, 10);
		
		Proposal proposal=this.comunityService.getProposal_view(proposal_num);
		
		
		 model.addAttribute("total_singo", total_singo);
		 model.addAttribute("current_page", "1");
		 model.addAttribute("proposal_List", proposal_List);
		 model.addAttribute("pageCount", pageCount);
		 model.addAttribute("pageBlock",pageBlock);
		 model.addAttribute("pageStart",pageBStart);
		 model.addAttribute("pageEnd",pageBEnd);
		 model.addAttribute("pageNum",pageNum);
		 model.addAttribute("data", proposal);
			
		 
		return "/admin/a_singo";
	}
	
	@RequestMapping(value="/proposalReg.do",method={RequestMethod.GET,RequestMethod.POST})
	public String a_singo(Proposal proposal,@RequestParam("pageNum") String pageNum,Model model){
		
		
		
		if(pageNum==null){
			pageNum="1";
		}
		int pNum = Integer.parseInt(pageNum);
		
		ArrayList<Proposal> proposal_List;
		
		
		int total_singo=0;
		int start;
		int end = 15;
		total_singo = comunityService.total_proposal();
		
		start = (pNum-1)*end;
		proposal_List =comunityService.getProposal_List(start,end);
		
		int pageCount = pageNumberingManager.getTotalPage(total_singo, 15);
		int pageBlock = pageNumberingManager.getPageBlock(pNum, 10);
		int pageBStart = pageNumberingManager.getFirstpageInBlock(pageBlock, 10);
		int pageBEnd = pageNumberingManager.getLastPageInBlock(pageBlock, 10);
		
		
		
		 model.addAttribute("total_singo", total_singo);
		 model.addAttribute("current_page", "1");
		 model.addAttribute("proposal_List", proposal_List);
			model.addAttribute("pageCount", pageCount);
			model.addAttribute("pageBlock",pageBlock);
			model.addAttribute("pageStart",pageBStart);
			model.addAttribute("pageEnd",pageBEnd);
			model.addAttribute("pageNum",pageNum);
			
		 
		return "/admin/a_singo";
	}
}
