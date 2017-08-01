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
import org.springframework.web.bind.annotation.SessionAttributes;

import kr.co.unibate.Service.BoardService;
import kr.co.unibate.bean.AgreeDisagreeBoard;
import kr.co.unibate.bean.AgreeDisagreeReply;
import kr.co.unibate.util.PageNumberingManager;
@SessionAttributes("id")
@Controller
public class boardController {
	PageNumberingManager pageNumberingManager = PageNumberingManager.getInstance();
	@Autowired
	BoardService boardService;
	
	
	@RequestMapping(value="/reply_view.do", method=RequestMethod.GET)
	public String fDView(@RequestParam("ad_board_num") int ad_board_num,
			@RequestParam("board_group_num") int board_group_num,
			@RequestParam("pageNum") String pageNum,
			Model model){
	
		AgreeDisagreeBoard agreeDisagreeBoard;
		agreeDisagreeBoard = boardService.getBoard_Content(ad_board_num,board_group_num);
		boardService.BoardHits(agreeDisagreeBoard);
		
		
		if(pageNum==null){
			pageNum="1";
			//이코드 동작이 제대로 안됨.
		}
		int pNum = Integer.parseInt(pageNum); 
		
		int allNotice; // 총 게시물의 개수를 저정하는
		int start = 1; // 가져올 부분의 시작점을 저장하는 변수
		int end = 15; // 이부분이 몇개의 게시물을 뿌릴지 결정하는부분 15로 설정해둠
		allNotice = boardService.getReply_count(ad_board_num,board_group_num);
		
		start = (pNum-1)*end;  //	 시작점을 구하는 로직
		//ArrayList<AgreeDisagreeReply> reply_paging = boardService.getReply(ad_board_num, start, end);
		
		int pageCount = pageNumberingManager.getTotalPage(allNotice, 15);
		int pageBlock = pageNumberingManager.getPageBlock(pNum, 10);
		int pageBStart = pageNumberingManager.getFirstpageInBlock(pageBlock, 10);
		int pageBEnd = pageNumberingManager.getLastPageInBlock(pageBlock, 10);
		
		


		
		 model.addAttribute("reply_count",boardService.getReply_count(ad_board_num,board_group_num));
		 model.addAttribute("reply",boardService.getReply(ad_board_num,start,end,board_group_num));
		 model.addAttribute("ad_board_num", ad_board_num);
		 model.addAttribute("board_group_num", board_group_num);
		 model.addAttribute("pageCount", pageCount);
		model.addAttribute("pageBlock",pageBlock);
		model.addAttribute("pageStart",pageBStart);
		model.addAttribute("pageEnd",pageBEnd);
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("board",agreeDisagreeBoard);

		
			
		return "/freeDebate/fDView";
	}
	@RequestMapping(value="/book_reply_view.do", method=RequestMethod.GET)
	public String bookReplyView(@RequestParam("ad_board_num") int ad_board_num,
			@RequestParam("board_group_num") int board_group_num,
			@RequestParam("pageNum") String pageNum,
			Model model){
	
		AgreeDisagreeBoard agreeDisagreeBoard;
		agreeDisagreeBoard = boardService.getBoard_Content(ad_board_num,board_group_num);
		boardService.BoardHits(agreeDisagreeBoard);
		
		
		if(pageNum==null){
			pageNum="1";
			//이코드 동작이 제대로 안됨.
		}
		int pNum = Integer.parseInt(pageNum); 
		
		int allNotice; // 총 게시물의 개수를 저정하는
		int start = 1; // 가져올 부분의 시작점을 저장하는 변수
		int end = 15; // 이부분이 몇개의 게시물을 뿌릴지 결정하는부분 15로 설정해둠
		allNotice = boardService.getReply_count(ad_board_num,board_group_num);
		
		start = (pNum-1)*end;  //	 시작점을 구하는 로직
		//ArrayList<AgreeDisagreeReply> reply_paging = boardService.getReply(ad_board_num, start, end);
		
		int pageCount = pageNumberingManager.getTotalPage(allNotice, 15);
		int pageBlock = pageNumberingManager.getPageBlock(pNum, 10);
		int pageBStart = pageNumberingManager.getFirstpageInBlock(pageBlock, 10);
		int pageBEnd = pageNumberingManager.getLastPageInBlock(pageBlock, 10);
		
		


		
		 model.addAttribute("reply_count",boardService.getReply_count(ad_board_num,board_group_num));
		 model.addAttribute("reply",boardService.getReply(ad_board_num,start,end,board_group_num));
		 model.addAttribute("ad_board_num", ad_board_num);
		 model.addAttribute("board_group_num", board_group_num);
		 model.addAttribute("pageCount", pageCount);
		model.addAttribute("pageBlock",pageBlock);
		model.addAttribute("pageStart",pageBStart);
		model.addAttribute("pageEnd",pageBEnd);
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("board",agreeDisagreeBoard);

		
			
		return "/bookDebate/bookView";
	}
	

	@RequestMapping(value="/reply_update_view.do", method=RequestMethod.GET)
	public String fDView_update(AgreeDisagreeReply agreeDisagreeReply,@RequestParam("ad_reply_num") int ad_reply_num,
			@RequestParam("board_group_num") int board_group_num,
			@RequestParam("ad_board_num") int ad_board_num,@RequestParam("pageNum") String pageNum,Model model){
		
		
		
		 agreeDisagreeReply.setAd_reply_num(ad_reply_num);
		 boardService.updateReplyLikeUp(agreeDisagreeReply);
		 AgreeDisagreeBoard agreeDisagreeBoard;
			agreeDisagreeBoard = boardService.getBoard_Content(ad_board_num,board_group_num);
			if(pageNum==null){
				pageNum="1";
				//이코드 동작이 제대로 안됨.
			}
			int pNum = Integer.parseInt(pageNum); 
			
			int allNotice; // 총 게시물의 개수를 저정하는
			int start = 1; // 가져올 부분의 시작점을 저장하는 변수
			int end = 15; // 이부분이 몇개의 게시물을 뿌릴지 결정하는부분 15로 설정해둠
			allNotice = boardService.getReply_count(ad_board_num,board_group_num);
			
			start = (pNum-1)*end;  // 시작점을 구하는 로직
			
			
			int pageCount = pageNumberingManager.getTotalPage(allNotice, 15);
			int pageBlock = pageNumberingManager.getPageBlock(pNum, 10);
			int pageBStart = pageNumberingManager.getFirstpageInBlock(pageBlock, 10);
			int pageBEnd = pageNumberingManager.getLastPageInBlock(pageBlock, 10);
			
		 model.addAttribute("reply_count",boardService.getReply_count(ad_board_num,board_group_num));
		 model.addAttribute("reply",boardService.getReply(ad_board_num,start,end,board_group_num));
		 model.addAttribute("ad_board_num", ad_board_num);
		 model.addAttribute("board_group_num", board_group_num);
		 model.addAttribute("pageCount", pageCount);
		model.addAttribute("pageBlock",pageBlock);
		model.addAttribute("pageStart",pageBStart);
		model.addAttribute("pageEnd",pageBEnd);
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("board",agreeDisagreeBoard);
		   if(board_group_num/10 ==2){
				return "redirect:/book_reply_view.do";
			}
		 return "redirect:/reply_view.do";
	}

	@RequestMapping(value="/reply_update2_view.do", method=RequestMethod.GET)
	public String fDView_update2(AgreeDisagreeReply agreeDisagreeReply,
			@RequestParam("board_group_num") int board_group_num,
			@RequestParam("pageNum") String pageNum,
			@RequestParam("ad_reply_num") int ad_reply_num,
			@RequestParam("ad_board_num") int ad_board_num,Model model){
		
		
		
		 agreeDisagreeReply.setAd_reply_num(ad_reply_num);
		 boardService.updateReplyDislikeUp(agreeDisagreeReply);
		 AgreeDisagreeBoard agreeDisagreeBoard;
			agreeDisagreeBoard = boardService.getBoard_Content(ad_board_num,board_group_num);
		 if(pageNum==null){
				pageNum="1";
				//이코드 동작이 제대로 안됨.
			}
			int pNum = Integer.parseInt(pageNum); 
			
			int allNotice; // 총 게시물의 개수를 저정하는
			int start = 1; // 가져올 부분의 시작점을 저장하는 변수
			int end = 15; // 이부분이 몇개의 게시물을 뿌릴지 결정하는부분 15로 설정해둠
			allNotice = boardService.getReply_count(ad_board_num,board_group_num);
			
			start = (pNum-1)*end;  // 시작점을 구하는 로직
			ArrayList<AgreeDisagreeReply> reply_paging = boardService.getReply(ad_board_num, start, end,board_group_num);
			
			int pageCount = pageNumberingManager.getTotalPage(allNotice, 15);
			int pageBlock = pageNumberingManager.getPageBlock(pNum, 10);
			int pageBStart = pageNumberingManager.getFirstpageInBlock(pageBlock, 10);
			int pageBEnd = pageNumberingManager.getLastPageInBlock(pageBlock, 10);
			
		 model.addAttribute("reply_count",boardService.getReply_count(ad_board_num,board_group_num));
		 model.addAttribute("reply",boardService.getReply(ad_board_num,start,end,board_group_num));
		 model.addAttribute("ad_board_num", ad_board_num);
		 model.addAttribute("board_group_num", board_group_num);
		 model.addAttribute("pageCount", pageCount);
		model.addAttribute("pageBlock",pageBlock);
		model.addAttribute("pageStart",pageBStart);
		model.addAttribute("pageEnd",pageBEnd);
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("board",agreeDisagreeBoard);
		
		   if(board_group_num/10 ==2){
				return "redirect:/book_reply_view.do";
			}
		 return "redirect:/reply_view.do";
	}
	
	
	@RequestMapping(value="/reply_insert_view.do", method=RequestMethod.GET)
	public String fDView_insert(AgreeDisagreeReply agreeDisagreeReply,@RequestParam("ad_board_num") int ad_board_num,
			@RequestParam("board_group_num") int board_group_num,
			HttpServletRequest request,@RequestParam("pageNum") String pageNum,Model model){
		
		HttpSession sessid = request.getSession() ;
		String id = (String)sessid.getAttribute("userid");
		agreeDisagreeReply.setId(id);
		 agreeDisagreeReply.setAd_board_num(ad_board_num);
		 AgreeDisagreeBoard agreeDisagreeBoard;
			agreeDisagreeBoard = boardService.getBoard_Content(ad_board_num,board_group_num);
		 boardService.InsertReply(agreeDisagreeReply);
			if(pageNum==null){
				pageNum="1";	
				//이코드 동작이 제대로 안됨.
			}
			int pNum = Integer.parseInt(pageNum); 
			
			int allNotice; // 총 게시물의 개수를 저정하는
			int start = 1; // 가져올 부분의 시작점을 저장하는 변수
			int end = 15; // 이부분이 몇개의 게시물을 뿌릴지 결정하는부분 15로 설정해둠
			allNotice = boardService.getReply_count(ad_board_num,board_group_num);
			
			start = (pNum-1)*end;  // 시작점을 구하는 로직
			
			
			int pageCount = pageNumberingManager.getTotalPage(allNotice, 15);
			int pageBlock = pageNumberingManager.getPageBlock(pNum, 10);
			int pageBStart = pageNumberingManager.getFirstpageInBlock(pageBlock, 10);
			int pageBEnd = pageNumberingManager.getLastPageInBlock(pageBlock, 10);
			
			
			 model.addAttribute("reply_count",boardService.getReply_count(ad_board_num,board_group_num));
			 model.addAttribute("reply",boardService.getReply(ad_board_num,start,end,board_group_num));
			 model.addAttribute("ad_board_num", ad_board_num);
			 model.addAttribute("board_group_num", board_group_num);
			 model.addAttribute("pageCount", pageCount);
			model.addAttribute("pageBlock",pageBlock);
			model.addAttribute("pageStart",pageBStart);
			model.addAttribute("pageEnd",pageBEnd);
			model.addAttribute("pageNum",pageNum);
		   model.addAttribute("reply_count",boardService.getReply_count(ad_board_num,board_group_num));
		   model.addAttribute("reply",boardService.getReply(ad_board_num,start,end,board_group_num));
		   model.addAttribute("board",agreeDisagreeBoard);
		
		   if(board_group_num/10 ==2){
				return "redirect:/book_reply_view.do";
			}
		 return "redirect:/reply_view.do";
		
		
	}
	
	
	@RequestMapping(value="/free_Board_List.do", method=RequestMethod.GET)
	public String freeboardList(@RequestParam("pageNum") String pageNum,
			@RequestParam("board_group_num") int board_group_num,
			Model model){
		if(pageNum==null){
			pageNum="1";
			//이코드 동작이 제대로 안됨.
		}
		int pNum = Integer.parseInt(pageNum); 
		
		int allNotice; // 총 게시물의 개수를 저정하는
		int start = 1; // 가져올 부분의 시작점을 저장하는 변수
		int end = 15; // 이부분이 몇개의 게시물을 뿌릴지 결정하는부분 15로 설정해둠
		
		allNotice = boardService.getIt_Board_count(board_group_num);
		start = (pNum-1)*end;  // 시작점을 구하는 로직
		
		
		
		int pageCount = pageNumberingManager.getTotalPage(allNotice, 15);
		int pageBlock = pageNumberingManager.getPageBlock(pNum, 10);
		int pageBStart = pageNumberingManager.getFirstpageInBlock(pageBlock, 10);
		int pageBEnd = pageNumberingManager.getLastPageInBlock(pageBlock, 10);
		
		
		model.addAttribute("ad_board_list",boardService.getAd_Board_List(start,end,board_group_num));
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("pageBlock",pageBlock);
		model.addAttribute("pageStart",pageBStart);
		model.addAttribute("pageEnd",pageBEnd);
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("board_group_num",board_group_num);
		model.addAttribute("it_board_count",allNotice);
		
		
		
		if (board_group_num == 11) {
			return "/freeDebate/itD";
		} else if (board_group_num == 12) {
			return "/freeDebate/social";
		} else if (board_group_num == 13) {
			return "/freeDebate/literature";
		} else if (board_group_num == 14) {
			return "/freeDebate/education";
		} else if (board_group_num == 15) {
			return "/freeDebate/philosophy";
		} else if (board_group_num == 16) {
			return "/freeDebate/sport";
		} else if (board_group_num == 17) {
			return "/freeDebate/environment";
		}
		 else if (board_group_num == 21) {
			return "/bookDebate/b_science";
		}
		 else if (board_group_num == 22) {
				return "/bookDebate/b_social";
			}
		 else if (board_group_num == 23) {
				return "/bookDebate/b_literature";
			}
		 else if (board_group_num == 24) {
				return "/bookDebate/b_education";
			}
		 else if (board_group_num == 25) {
				return "/bookDebate/b_philosophy";
			}
		 else if (board_group_num == 26) {
				return "/bookDebate/b_sport";
			}
		 else if (board_group_num == 27) {
				return "/bookDebate/b_environment";
			}

		else
			return "/freeDebate/itD";
		
		
		
		
	}
	
	@RequestMapping(value="/free_Board_Search.do", method=RequestMethod.GET)
	public String itDList_Search(@RequestParam("ad_search") String ad_search,@RequestParam("pageNum") String pageNum,
			@RequestParam("board_group_num") int board_group_num,
			Model model){
		if(pageNum==null){
			pageNum="1";
			//이코드 동작이 제대로 안됨.
		}
		int pNum = Integer.parseInt(pageNum); 
		
		int allNotice; // 총 게시물의 개수를 저정하는
		int start = 1; // 가져올 부분의 시작점을 저장하는 변수
		int end = 15; // 이부분이 몇개의 게시물을 뿌릴지 결정하는부분 15로 설정해둠
		
		allNotice = boardService.getIt_Board_count(board_group_num);
		start = (pNum-1)*end;  // 시작점을 구하는 로직
		int pageCount = pageNumberingManager.getTotalPage(allNotice, 15);
		int pageBlock = pageNumberingManager.getPageBlock(pNum, 10);
		int pageBStart = pageNumberingManager.getFirstpageInBlock(pageBlock, 10);
		int pageBEnd = pageNumberingManager.getLastPageInBlock(pageBlock, 10);
		
		
		model.addAttribute("ad_board_list",boardService.getAd_Board_Search_List(ad_search,start,end,board_group_num));
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("pageBlock",pageBlock);
		model.addAttribute("pageStart",pageBStart);
		model.addAttribute("pageEnd",pageBEnd);
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("it_board_count",allNotice);
		model.addAttribute("board_group_num",board_group_num);
		if (board_group_num == 11) {
			return "/freeDebate/itD";
		} else if (board_group_num == 12) {
			return "/freeDebate/social";
		} else if (board_group_num == 13) {
			return "/freeDebate/literature";
		} else if (board_group_num == 14) {
			return "/freeDebate/education";
		} else if (board_group_num == 15) {
			return "/freeDebate/philosophy";
		} else if (board_group_num == 16) {
			return "/freeDebate/sport";
		} else if (board_group_num == 17) {
			return "/freeDebate/environment";
		}

		else
			return "/freeDebate/itD";
	}
	
	@RequestMapping(value="/dataanalysis.do", method=RequestMethod.GET)
	public String dataAnalysis(Model model){
		
		 
		return "/dataAnalysis/dataAnalysisView";
	}
	
	
	/*
	@RequestMapping(value="/mypage.do",method={RequestMethod.GET,RequestMethod.POST})
	 public String mypage(Model model,HttpServletRequest request){
	  
		HttpSession sessid = request.getSession() ;
		String myid = (String)sessid.getAttribute("id");
		User ind_rank = boardService.Ind_Rank(myid);	
		

		model.addAttribute("ind_rank",ind_rank);
	  
	  return "/login/mypage";
	  
	 }
	
	@RequestMapping(value="/my_club.do",method={RequestMethod.GET,RequestMethod.POST})
	 public String myclub(Model model,HttpServletRequest request){
	  
		HttpSession sessid = request.getSession() ;
		String myid = (String)sessid.getAttribute("id");
		
		String my_club_num = boardService.My_Club_Num(myid);
		ClubData my_club = boardService.My_Club_Info(my_club_num);
		String my_club_member = boardService.My_Club_Member(my_club_num);
		ArrayList<User> my_club_member_list = boardService.My_Club_Member_List(my_club_num);
		User my_club_king = boardService.My_Club_King(my_club_num);
		
		model.addAttribute("my_club_king",my_club_king);
		model.addAttribute("my_club",my_club);
		model.addAttribute("my_club_member",my_club_member);
		model.addAttribute("my_club_member_list",my_club_member_list);
		
	  return "/login/myClub";
	  
	 }
	@RequestMapping(value="/my_debating.do",method={RequestMethod.GET,RequestMethod.POST})
	 public String my_debating(Model model){
	  
	  
	  return "/login/myDebating";
	  
	 }
	@RequestMapping(value="/my_history.do",method={RequestMethod.GET,RequestMethod.POST})
	 public String my_history(Model model){
	  
	  
	  return "/login/myHistory";
	  
	 }
	
	@RequestMapping(value="/real_time.do",method={RequestMethod.GET,RequestMethod.POST})
	 public String my_time(Model model){
		String d_num="1";
		RTDebate rt_debate = boardService.Get_Rt_subj();
		ArrayList<RTOpinion> rt_opinion = boardService.Get_Rt_Reply(d_num);
		
		model.addAttribute("rt_debate", rt_debate);
		model.addAttribute("rt_opinion", rt_opinion);
		
		
	  return "/realTimeDebate/realTimeView";
	  
	 }
	 */
}