package kr.co.unibate.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.unibate.Service.BoardService;
import kr.co.unibate.Service.ComunityService;
import kr.co.unibate.bean.ClubData;
import kr.co.unibate.bean.CompetitionInfo;
import kr.co.unibate.bean.FboardLikeCheck;
import kr.co.unibate.bean.FboardReply;
import kr.co.unibate.bean.FboardReplyCheck;
import kr.co.unibate.bean.NoticeBoard;
import kr.co.unibate.bean.Proposal;
import kr.co.unibate.bean.QnAboard;
import kr.co.unibate.bean.SgReplyLikeChk;
import kr.co.unibate.bean.SuggestReply;
import kr.co.unibate.bean.SuggestionBoard;
import kr.co.unibate.bean.User;
import kr.co.unibate.bean.fboard;
import kr.co.unibate.util.PageNumberingManager;

@Controller
public class comunityController {
	
	@Autowired
	ComunityService comunityService;
	@Autowired
	BoardService boardService;
	
	PageNumberingManager pageNumberingManager = PageNumberingManager.getInstance();
	
	//메인 패이지 입니다.
	
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String rootpage(Model model){

		
		return "main";
	}
	
	@RequestMapping(value="/main.do", method=RequestMethod.GET)
	public String pagename(Model model){

		
		return "main";
	}
	
	//커뮤니티 파트 입니다.
	@RequestMapping(value="/compinfo.do", method=RequestMethod.GET)
	public String compinfo(Model model){
		
		comunityService.CompetitionDelete();
		
		ArrayList<CompetitionInfo> competitionInfo;
		
		competitionInfo=comunityService.getCompInfo();
		
		int counter = competitionInfo.size();
		
		System.out.println(counter);
		
		model.addAttribute("comp", competitionInfo);
		model.addAttribute("counter", counter);
		
		return "/comunity/comptition";
	}
	
	
	
	
	@RequestMapping(value="/notice.do", method=RequestMethod.GET)
	public String notice(
			@RequestParam("pageNum") String pageNum,
			Model model){
		
		if(pageNum==null){
			pageNum="1";
		}
		int pNum = Integer.parseInt(pageNum); 
		
		ArrayList<NoticeBoard> noticeBoard;
		int allNotice;
		int start;
		int end = 15;
		
		allNotice = comunityService.getNoticeAll();
		
		start = (pNum-1)*end;
		
		System.out.println("start : "+start);
		System.out.println("end"+end);
		
		noticeBoard = comunityService.getNoticeBoard(start, end);
	
		
		System.out.println(allNotice);
		
		int pageCount = pageNumberingManager.getTotalPage(allNotice, 15);
		int pageBlock = pageNumberingManager.getPageBlock(pNum, 10);
		int pageBStart = pageNumberingManager.getFirstpageInBlock(pageBlock, 10);
		int pageBEnd = pageNumberingManager.getLastPageInBlock(pageBlock, 10);
		
		System.out.println("pageCount : "+pageCount);
		System.out.println("pageBlock : "+pageBlock);
		System.out.println("pageBStart : "+pageBStart);
		System.out.println("pageBEnd : "+pageBEnd);
		
		model.addAttribute("nboard", noticeBoard);
		model.addAttribute("allNotice", allNotice);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("pageBlock",pageBlock);
		model.addAttribute("pageStart",pageBStart);
		model.addAttribute("pageEnd",pageBEnd);
		model.addAttribute("pageNum",pageNum);
		
		return "/comunity/notice";
	}
	
	@RequestMapping(value="/noticeView.do", method=RequestMethod.GET)
	public String noticeView(
			@RequestParam("pageNum") String pageNum,
			@RequestParam("notice_num") String notice_num,
			Model model){
		
		int n_num = Integer.parseInt(notice_num);
		
		comunityService.noticeHitsup(n_num);
		
		int count = comunityService.getNoticeAll();
		
		NoticeBoard noticeBoard=comunityService.getNotice(n_num);
		
		model.addAttribute("noticeboard", noticeBoard);
		
		model.addAttribute("notice_num", n_num);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("noticesum",count);
		
		return "/comunity/noticeview";
	}
	
	
	@RequestMapping(value="/reported.do", method=RequestMethod.GET)
	public String reported(Model model){
		
		model.addAttribute("proposal", new Proposal());
		
		return "/comunity/proposal";
	}
	
	@RequestMapping(value="/reported_com.do", method=RequestMethod.GET)
	public String reported_com(Proposal proposal,
											Model model){
		System.out.println(proposal.getId());
		comunityService.reportered_data(proposal);
		
		return "redirect:/reported.do";
	}
	
	@RequestMapping(value="/suggestion.do", method=RequestMethod.GET)
	public String suggestion(
			@RequestParam("pageNum") String pageNum,
			Model model){
		
		if(pageNum==null){
			pageNum="1";
		}
		int pNum = Integer.parseInt(pageNum); 
		
		ArrayList<SuggestionBoard> suggstionBoard;
		int allSuggestion;
		int start;
		int end = 15;
		
		allSuggestion = comunityService.getSuggestionAll();
		
		start = (pNum-1)*end;
		
		System.out.println("start : "+start);
		System.out.println("end"+end);
		
		suggstionBoard = comunityService.getSuggestionBoard(start, end);
	
		
		System.out.println(allSuggestion);
		
		int pageCount = pageNumberingManager.getTotalPage(allSuggestion, 15);
		int pageBlock = pageNumberingManager.getPageBlock(pNum, 10);
		int pageBStart = pageNumberingManager.getFirstpageInBlock(pageBlock, 10);
		int pageBEnd = pageNumberingManager.getLastPageInBlock(pageBlock, 10);
		
		System.out.println("pageCount : "+pageCount);
		System.out.println("pageBlock : "+pageBlock);
		System.out.println("pageBStart : "+pageBStart);
		System.out.println("pageBEnd : "+pageBEnd);
		
		model.addAttribute("sboard", suggstionBoard);
		model.addAttribute("allSuggestion", allSuggestion);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("pageBlock",pageBlock);
		model.addAttribute("pageStart",pageBStart);
		model.addAttribute("pageEnd",pageBEnd);
		model.addAttribute("pageNum",pageNum);
		
		return "/comunity/suggest";
	}
	
	@RequestMapping(value="/suggestion_write.do", method=RequestMethod.GET)
	public String suggestion_write(@RequestParam("pageNum") String pageNum,
											Model model){
		
		model.addAttribute("pageNum", pageNum);
		return "/comunity/suggwrite";
	}
	
	@RequestMapping(value="/suggestion_write_ok.do", method=RequestMethod.POST)
	public String suggestion_write_ok(@RequestParam("pageNum") String pageNum,
			@RequestParam("suggestion_content") String suggestion_content,
			@RequestParam("suggestion_subject") String suggestion_subject,
			@RequestParam("id") String id,
											Model model){
		
		suggestion_content = suggestion_content.replaceAll("\r\n", "<br>");
		SuggestionBoard suggestionBoard=new SuggestionBoard();
		
		suggestionBoard.setId(id);
		suggestionBoard.setSuggestion_content(suggestion_content);
		suggestionBoard.setSuggestion_subject(suggestion_subject);
		
		this.comunityService.insertSuggestion(suggestionBoard);
		
		model.addAttribute("pageNum",pageNum);
		
		return "redirect:/suggestion.do";
	}
	
	@RequestMapping(value="/suggestionView.do", method=RequestMethod.GET)
	public String suggestionView(@RequestParam("pageNum") String pageNum,
			@RequestParam("suggest_num") String suggest_num,HttpSession session,
											Model model){
		String id = (String)session.getAttribute("userid");
		int s_num = Integer.parseInt(suggest_num);
		this.comunityService.SuggestionHitsup(s_num);
		
		
		SuggestionBoard suggestionBoard=this.comunityService.getSuggestion(s_num);

		ArrayList<SuggestReply> reply = this.comunityService.getSuggestReply(suggest_num);

		SgReplyLikeChk sgReplyLikeChk = new SgReplyLikeChk();
		sgReplyLikeChk.setSuggestion_board_num(s_num);
		sgReplyLikeChk.setId(id);
		
		int r_result;
		int[] replychk=new int[reply.size()];
		for(int i=1; i<=reply.size(); i++){
			sgReplyLikeChk.setSg_reply_num(i);
			
			r_result=this.comunityService.sgReplyLikeCheck(sgReplyLikeChk);
			replychk[i-1]=r_result;
		}
		
		
		model.addAttribute("board", suggestionBoard);
		model.addAttribute("reply", reply);
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("suggest_num", suggest_num);
		model.addAttribute("replychk", replychk);
		model.addAttribute("rlen", reply.size());
		
		return "/comunity/suggview";
	}
	@RequestMapping(value="/s_reply_insert.do", method=RequestMethod.GET)
	public String s_reply_insert(@RequestParam("pageNum") String pageNum,
			@RequestParam("suggest_num") String suggest_num, 
			@RequestParam("suggest_reply") String suggest_reply,RedirectAttributes redirectAttr,
			HttpSession session,Model model){
		
		String id = (String)session.getAttribute("userid");
		suggest_reply = suggest_reply.replaceAll("\r\n", "<br>");
		int sg_num = Integer.parseInt(suggest_num);
		
		SuggestReply suggestReply=new SuggestReply();
		
		suggestReply.setSg_reply(suggest_reply);
		suggestReply.setSuggestion_board_num(sg_num);
		suggestReply.setId(id);
		
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
		String datetime = sdf.format(cal.getTime());
		session.setAttribute("tReply", datetime);
		this.comunityService.suggestReplyInsert(suggestReply);
		return "redirect:/suggestionView.do?pageNum="+pageNum+"&suggest_num="+suggest_num;
	}
	
	@RequestMapping(value="/sg_replylike.do", method=RequestMethod.GET)
	public String sg_replylike(@RequestParam("pageNum") String pageNum,
								@RequestParam("suggest_num") String suggest_num,
								@RequestParam("sg_reply_num") String sg_reply_num,
								@RequestParam("val") String val,
								HttpSession session,RedirectAttributes redirectAttributes,
								Model model){
		
		String id = (String)session.getAttribute("userid");
		int sg_num=Integer.parseInt(suggest_num);
		int r_num=Integer.parseInt(sg_reply_num);
		
		SgReplyLikeChk sgReplyLikeChk = new SgReplyLikeChk();
		sgReplyLikeChk.setSuggestion_board_num(sg_num);
		sgReplyLikeChk.setSg_reply_num(r_num);
		sgReplyLikeChk.setId(id);
		this.comunityService.sgReplyLikeAction(sgReplyLikeChk);
		
		if(val.equals("like")){
			this.comunityService.sgReplyLikeUp(sg_reply_num);
		}else{
			this.comunityService.sgRreplyDisLikeUp(sg_reply_num);
		}
		return "redirect:/suggestionView.do?pageNum="+pageNum+"&suggest_num="+suggest_num;
		
	}
	
	@RequestMapping(value="/	deleteSugg.do", method=RequestMethod.GET)
	public String deleteSugg(@RequestParam("pageNum") String pageNum,
			@RequestParam("suggest_num") String suggest_num,
											Model model){
		
		int sd_num = Integer.parseInt(suggest_num);
		
		this.comunityService.deleteSuggestion(sd_num);
		
		model.addAttribute("pageNum",pageNum);
		
		return "redirect:/suggestion.do";
	}

	
	//자유게시판
	
	@RequestMapping(value="/f_board.do", method=RequestMethod.GET)
	public String f_board(
			@RequestParam("pageNum") String pageNum,
			Model model){
		
		if(pageNum==null){
			pageNum="1";
		}
		int pNum = Integer.parseInt(pageNum); 
		
		ArrayList<fboard> fBoard;
		int allfboard;
		int start;
		int end = 15;
		
		allfboard = comunityService.getFBoardAll();
		
		start = (pNum-1)*end;
		
		System.out.println("start : "+start);
		System.out.println("end"+end);
		
		fBoard = comunityService.getFBoardList(start, end);
		
		
		System.out.println(allfboard);
		
		int pageCount = pageNumberingManager.getTotalPage(allfboard, 15);
		int pageBlock = pageNumberingManager.getPageBlock(pNum, 10);
		int pageBStart = pageNumberingManager.getFirstpageInBlock(pageBlock, 10);
		int pageBEnd = pageNumberingManager.getLastPageInBlock(pageBlock, 10);
		
		System.out.println("pageCount : "+pageCount);
		System.out.println("pageBlock : "+pageBlock);
		System.out.println("pageBStart : "+pageBStart);
		System.out.println("pageBEnd : "+pageBEnd);
		
		model.addAttribute("fboard", fBoard);
		model.addAttribute("allfboard", allfboard);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("pageBlock",pageBlock);
		model.addAttribute("pageStart",pageBStart);
		model.addAttribute("pageEnd",pageBEnd);
		model.addAttribute("pageNum",pageNum);
		
		return "/comunity/fboardList";
	}
	
	@RequestMapping(value="/f_board_write.do", method=RequestMethod.GET)
	public String f_board_write(@RequestParam("pageNum") String pageNum,
											HttpSession session,RedirectAttributes redirectAttributes,
											Model model){
		String id = (String)session.getAttribute("userid");
		if(id!=null){
			model.addAttribute("pageNum", pageNum);
			return "/comunity/fboardWrite";
		}else{
			redirectAttributes.addFlashAttribute("loginCheck", "로그인후 글작성이 가능합니다.");
			return "redirect:/f_board.do?pageNum="+pageNum;
		}
		
	}
	@RequestMapping(value="/like.do", method=RequestMethod.GET)
	public String f_like(@RequestParam("pageNum") String pageNum,
								@RequestParam("fboard_num") String fboard_num,
								@RequestParam("val") String val,
								HttpSession session,RedirectAttributes redirectAttributes,
								Model model){
		
		String id = (String)session.getAttribute("userid");
		System.out.println(id);
		System.out.println(fboard_num);
		int f_num=Integer.parseInt(fboard_num);
		int result;
		System.out.println(f_num);
		
		FboardLikeCheck fboardLikeCheck=new FboardLikeCheck();
		
		fboardLikeCheck.setFboard_num(f_num);
		fboardLikeCheck.setId(id);
		this.comunityService.fLikeAction(fboardLikeCheck);
		result=this.comunityService.fLikeCheck(fboardLikeCheck);
		
		if(val.equals("like")){
			this.comunityService.likeUp(fboard_num);
		}else{
			this.comunityService.disLikeUp(fboard_num);
		}
		return "redirect:/f_boardView.do?pageNum="+pageNum+"&fboard_num="+fboard_num;
		
	}
	@RequestMapping(value="/r_like.do", method=RequestMethod.GET)
	public String r_like(@RequestParam("pageNum") String pageNum,
								@RequestParam("fboard_num") String fboard_num,
								@RequestParam("f_reply_num") String f_reply_num,
								@RequestParam("val") String val,
								HttpSession session,RedirectAttributes redirectAttributes,
								Model model){
		
		String id = (String)session.getAttribute("userid");
		System.out.println(id);
		System.out.println(fboard_num);
		int f_num=Integer.parseInt(fboard_num);
	
		System.out.println(f_num);
		int r_num=Integer.parseInt(f_reply_num);
	
		FboardReplyCheck fboardReplyCheck=new FboardReplyCheck();
	
		fboardReplyCheck.setFboard_num(f_num);
		fboardReplyCheck.setId(id);
		fboardReplyCheck.setF_reply_num(r_num);
		this.comunityService.fReplyLikeAction(fboardReplyCheck);
		
		
		if(val.equals("like")){
			this.comunityService.replyLikeUp(f_reply_num);
		}else{
			this.comunityService.replyDisLikeUp(f_reply_num);
		}
		return "redirect:/f_boardView.do?pageNum="+pageNum+"&fboard_num="+fboard_num;
		
	}
	
	@RequestMapping(value="/f_board_write_ok.do", method=RequestMethod.POST)
	public String f_board_write_ok(@RequestParam("pageNum") String pageNum,
			@RequestParam("fboard_content") String fboard_content,
			@RequestParam("fboard_subject") String fboard_subject,
			@RequestParam("urldata") String urldata,
			HttpSession session,
											Model model){
		fboard_content = fboard_content.replaceAll("\r\n", "<br>");
		
		String id = (String)session.getAttribute("userid");
		fboard fBoard=new fboard();
		
		StringTokenizer tokens = new StringTokenizer(urldata, "/");
		
		String URL="";
		while (tokens.hasMoreElements()) {
			URL=tokens.nextToken();
			 System.out.println("temp="+URL);
		}
		
		System.out.println(URL);
		
		if(URL.indexOf("=") > -1){
			System.out.println(URL.indexOf("="));
			URL=URL.substring(URL.indexOf("=")+1);
			System.out.println(URL);
		}
		
		
		fBoard.setId(id);
		fBoard.setFboard_content(fboard_content);
		fBoard.setFboard_subject(fboard_subject);
		fBoard.setUrldata(URL);
		
		this.comunityService.insertFboard(fBoard);
		
		model.addAttribute("pageNum",pageNum);
		
		return "redirect:/f_board.do";
	}
	
	@RequestMapping(value="/f_boardView.do", method=RequestMethod.GET)
	public String f_boardView(@RequestParam("pageNum") String pageNum,
			@RequestParam("fboard_num") String fboard_num, HttpSession session,
											Model model){
		String id = (String)session.getAttribute("userid");
		
		int f_num = Integer.parseInt(fboard_num);
		System.out.println(id);
		this.comunityService.fBoardHitsup(f_num);
		FboardLikeCheck fboardLikeCheck=new FboardLikeCheck();
		
		int result;
		fboardLikeCheck.setFboard_num(f_num);
		fboardLikeCheck.setId(id);
		result=this.comunityService.fLikeCheck(fboardLikeCheck);
		
		
		fboard fBoard=this.comunityService.getFBoard(f_num);
		ArrayList<FboardReply> reply=this.comunityService.getFReplyList(fboard_num);
		
		FboardReplyCheck fboardReplyCheck=new FboardReplyCheck();
		fboardReplyCheck.setFboard_num(f_num);
		fboardReplyCheck.setId(id);
		int r_result;
		int[] replychk=new int[reply.size()];
		for(int i=1; i<=reply.size(); i++){
			fboardReplyCheck.setF_reply_num(i);
			
			r_result=this.comunityService.fReplyLikeCheck(fboardReplyCheck);
			replychk[i-1]=r_result;
		}
		
		model.addAttribute("result", result);
		model.addAttribute("fboard", fBoard);
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("fboard_num",fboard_num);
		model.addAttribute("reply", reply);
		model.addAttribute("rlen", reply.size());
		model.addAttribute("replychk", replychk);
		return "/comunity/fboardView";
	}
	
	@RequestMapping(value="/f_reply_insert.do", method=RequestMethod.GET)
	public String f_reply_insert(@RequestParam("pageNum") String pageNum,
			@RequestParam("fboard_num") String fboard_num, @RequestParam("f_reply") String f_reply,HttpSession session,
											Model model){
		String id = (String)session.getAttribute("userid");
		f_reply = f_reply.replaceAll("\r\n", "<br>");
		int f_num = Integer.parseInt(fboard_num);
		
		FboardReply fboardReply=new FboardReply();
		
		fboardReply.setF_reply(f_reply);
		fboardReply.setFboard_num(f_num);
		fboardReply.setId(id);
		
		this.comunityService.fReplyInsert(fboardReply);
		
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
		String datetime = sdf.format(cal.getTime());
		session.setAttribute("tReply", datetime);
		
		return "redirect:/f_boardView.do?pageNum="+pageNum+"&fboard_num="+fboard_num;
	}
	
	
	
	@RequestMapping(value="/	deleteFboard.do", method=RequestMethod.GET)
	public String deleteFboard(@RequestParam("pageNum") String pageNum,
			@RequestParam("fboard_num") String fboard_num,
											Model model){
		
		int fd_num = Integer.parseInt(fboard_num);
		
		this.comunityService.deleteFboard(fd_num);
		
		model.addAttribute("pageNum",pageNum);
		
		return "redirect:/f_board.do";
	}
	
	//랭킹
	@RequestMapping(value="/rank.do", method=RequestMethod.GET)
	public String ranking(Model model,HttpServletRequest request){
		
		HttpSession sessid = request.getSession() ;
		String myid = (String)sessid.getAttribute("userid");
		String my_club_num = boardService.My_Club_Num(myid);
		ClubData my_club = boardService.My_Club_Rank(my_club_num);
		User ind_rank = boardService.Ind_Rank(myid);
		
		
		ArrayList<User> member= boardService.getRanking_List();
		ArrayList<ClubData> club_mem= boardService.getClub_Rank();

		
		model.addAttribute("my_club",my_club);
		model.addAttribute("ind_rank",ind_rank);
		model.addAttribute("member",member);
		model.addAttribute("club_mem",club_mem);
		return "/comunity/rank";
	}

	@RequestMapping(value="/member_Rank_Search.do", method=RequestMethod.GET)
	public String member_Rank_Search(@RequestParam("mem_rank_search") String mem_rank_search,HttpServletRequest request,Model model){
	
		HttpSession sessid = request.getSession() ;
		String myid = (String)sessid.getAttribute("id");
		String my_club_num = boardService.My_Club_Num(myid);
		ClubData my_club = boardService.My_Club_Rank(my_club_num);
		User ind_rank = boardService.Ind_Rank(myid);

		
		ArrayList<User> member= boardService.getMember_Search(mem_rank_search);
		ArrayList<ClubData> club_mem= boardService.getClub_Rank();	
	
		
		model.addAttribute("my_club",my_club);
		model.addAttribute("ind_rank",ind_rank);
		model.addAttribute("member",member);
		model.addAttribute("club_mem",club_mem);

		return "/comunity/rank";
	}
	
	@RequestMapping(value="/club_Rank_Search.do", method=RequestMethod.GET)
	public String club_Rank_Search(@RequestParam("club_rank_search") String club_rank_search,HttpServletRequest request,Model model){
	
		
		HttpSession sessid = request.getSession() ;
		String myid = (String)sessid.getAttribute("id");
		String my_club_num = boardService.My_Club_Num(myid);
		ClubData my_club = boardService.My_Club_Rank(my_club_num);
		User ind_rank = boardService.Ind_Rank(myid);
		
		ArrayList<User> member= boardService.getRanking_List();
		
		ArrayList<ClubData> club_mem= boardService.getClub_Search(club_rank_search);
			
		
		model.addAttribute("my_club",my_club);
		model.addAttribute("ind_rank",ind_rank);
		model.addAttribute("member",member);
		model.addAttribute("club_mem",club_mem);

		return "/comunity/rank";
	}
	
	//QNA
	
	@RequestMapping(value="/qna.do", method=RequestMethod.GET)
	public String qna(
			@RequestParam("pageNum") String pageNum,
			Model model){
		
		if(pageNum==null){
			pageNum="1";
		}
		int pNum = Integer.parseInt(pageNum); 
		
		ArrayList<QnAboard> qnAboards;
		int allQNA;
		int start;
		int end = 15;
		
		allQNA = comunityService.getQNAAll();
		
		start = (pNum-1)*end;
		
		System.out.println("start : "+start);
		System.out.println("end"+end);
		
		qnAboards = comunityService.getQNABoard(start, end);
	
		
		System.out.println(allQNA);
		
		int pageCount = pageNumberingManager.getTotalPage(allQNA, 15);
		int pageBlock = pageNumberingManager.getPageBlock(pNum, 10);
		int pageBStart = pageNumberingManager.getFirstpageInBlock(pageBlock, 10);
		int pageBEnd = pageNumberingManager.getLastPageInBlock(pageBlock, 10);
		
		System.out.println("pageCount : "+pageCount);
		System.out.println("pageBlock : "+pageBlock);
		System.out.println("pageBStart : "+pageBStart);
		System.out.println("pageBEnd : "+pageBEnd);
		
		model.addAttribute("qboard", qnAboards);
		model.addAttribute("allQNA", allQNA);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("pageBlock",pageBlock);
		model.addAttribute("pageStart",pageBStart);
		model.addAttribute("pageEnd",pageBEnd);
		model.addAttribute("pageNum",pageNum);
		
		return "/comunity/qna";
	}
	
	@RequestMapping(value="/qna_write.do", method=RequestMethod.GET)
	public String qna_write(@RequestParam("pageNum") String pageNum,
											Model model){
		
		model.addAttribute("pageNum", pageNum);
		return "/comunity/qnawrite";
	}
	
	@RequestMapping(value="/qna_write_ok.do", method=RequestMethod.POST)
	public String qna_write_ok(@RequestParam("pageNum") String pageNum,
			@RequestParam("qna_content") String qna_content,
			@RequestParam("qna_subject") String qna_subject,
			@RequestParam("id") String id,
											Model model){
		
		qna_content = qna_content.replaceAll("\r\n", "<br>");
		QnAboard qnAboard=new QnAboard();
		
		qnAboard.setId(id);
		qnAboard.setQna_content(qna_content);
		qnAboard.setQna_subject(qna_subject);
		
		this.comunityService.insertQNA(qnAboard);
		
		model.addAttribute("pageNum",pageNum);
		
		return "redirect:/qna.do";
	}
	
	@RequestMapping(value="/qnaView.do", method=RequestMethod.GET)
	public String qnaView(@RequestParam("pageNum") String pageNum,
			@RequestParam("qna_num") String qna_num,
											Model model){
		
		int q_num = Integer.parseInt(qna_num);
		
		
		QnAboard qnAboard=this.comunityService.getQNA(q_num);
		
		model.addAttribute("board", qnAboard);
		model.addAttribute("pageNum",pageNum);
		
		return "/comunity/qnaview";
	}
}
