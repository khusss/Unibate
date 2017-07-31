package kr.co.unibate.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.unibate.Service.RealTimeService;
import kr.co.unibate.bean.RTDebate;
import kr.co.unibate.bean.RTOpinion;
import kr.co.unibate.bean.RTResult;
import kr.co.unibate.bean.TempLike;
import kr.co.unibate.bean.User;
import kr.co.unibate.util.PageNumberingManager;

@Controller
public class RealTimeController {
	PageNumberingManager pageNumberingManager = PageNumberingManager.getInstance();
	@Autowired
	RealTimeService realTimeService;
	
	@RequestMapping(value="/realtimedebate.do",method={RequestMethod.GET,RequestMethod.POST})
	 public String my_time(Model model,HttpServletRequest request){
		 
		
		
		int debate_num=this.realTimeService.getCurrentRDebate();
		String d_num=Integer.toString(debate_num);
		HttpSession sessid = request.getSession() ;
		String myid = (String)sessid.getAttribute("userid");

		String my_group_num = realTimeService.My_Group_Num(myid);
		System.out.println("my_group_num :"+my_group_num);
		
		if(my_group_num==null){
			my_group_num="3";
		}
		
		RTDebate rt_debate = realTimeService.Get_Rt_subj(d_num);
		ArrayList<RTOpinion> rt_opinion = realTimeService.Get_Rt_Reply(d_num);
		ArrayList<User> real_agree_member = realTimeService.Real_Agree_Member(d_num);
		ArrayList<User> real_disagree_member = realTimeService.Real_Disagree_Member(d_num);
		
		int agree_team_count = realTimeService.Agree_Team_Count(d_num);
		int disagree_team_count = realTimeService.Disagree_Team_Count(d_num);
		int agree_score;
		int disagree_score;
		
		RTOpinion groupnum1 = new RTOpinion();
		RTOpinion groupnum2 = new RTOpinion();
		groupnum1.setD_num(debate_num);
		groupnum1.setGroup_num(1);
		
		groupnum2.setD_num(debate_num);
		groupnum2.setGroup_num(2);
		
		if(this.realTimeService.getDefultScore(d_num)==0){
			agree_score=0;
			disagree_score=0;
		}else if(this.realTimeService.getGroupScore(groupnum1)==0 && this.realTimeService.getGroupScore(groupnum2)!=0){
			agree_score=0;
			disagree_score= realTimeService.Get_Score(d_num, "2");
		}else if(this.realTimeService.getGroupScore(groupnum1)!=0 && this.realTimeService.getGroupScore(groupnum2)==0){
			agree_score= realTimeService.Get_Score(d_num, "1");
			disagree_score= 0;
		}else{
			agree_score= realTimeService.Get_Score(d_num, "1");
			disagree_score= realTimeService.Get_Score(d_num, "2");
		}
		
		
		float a = (((float)agree_score/(agree_score+disagree_score)))*100;
		double score = Math.round(a*100d) / 100d;
		double dis_score=Math.round((100-score)*100d) / 100d;
		//현재 시간 구하기
		SimpleDateFormat formatter = new SimpleDateFormat ("yyyy-MM-dd hh:mm:ss");
		Calendar cal = Calendar.getInstance();
		String today = null;
		today = formatter.format(cal.getTime());
		Timestamp ts = Timestamp.valueOf(today);
		
		
		
		//10일 후 구하기
		cal.setTime(rt_debate.getD_date());
		cal.add(Calendar.DATE, 10);
		today = formatter.format(cal.getTime());
		Timestamp at = Timestamp.valueOf(today);
		

		
		model.addAttribute("at", at);
		model.addAttribute("ts", ts);
		model.addAttribute("dis_score", dis_score);
		model.addAttribute("score", score);
		model.addAttribute("real_disagree_member", real_disagree_member);
		model.addAttribute("real_agree_member", real_agree_member);
		model.addAttribute("rt_debate", rt_debate);
		model.addAttribute("rt_opinion", rt_opinion);
		model.addAttribute("agree_team_count", agree_team_count);
		model.addAttribute("disagree_team_count", disagree_team_count);
		model.addAttribute("my_group_num", my_group_num);
	  
		return "/realTimeDebate/realTimeView";
	  
	 }
	
	@RequestMapping(value="/agree_team.do",method={RequestMethod.GET,RequestMethod.POST})
	 public String agree_team(Model model,HttpServletRequest request){
		

		int debate_num=this.realTimeService.getCurrentRDebate();
		String d_num=Integer.toString(debate_num);
		HttpSession sessid = request.getSession() ;
		String myid = (String)sessid.getAttribute("userid");
	  
		int check = realTimeService.Real_Team_Check(myid);
		String my_group_num = realTimeService.My_Group_Num(myid);
		
		if(check>=1){
			if(my_group_num.equals("3")){
				
			}else{
			return "/realTimeDebate/IdCheck";
			}
		}
		System.out.println("여기까지는 옴");
		
		realTimeService.Agree_Team(d_num, myid);
		

	  return "/realTimeDebate/IdCheckOk";
	  
	 }
	@RequestMapping(value="/disagree_team.do",method={RequestMethod.GET,RequestMethod.POST})
	 public String disagree_team(Model model,HttpServletRequest request){
		

		int debate_num=this.realTimeService.getCurrentRDebate();
		String d_num=Integer.toString(debate_num);
		HttpSession sessid = request.getSession() ;
		String myid = (String)sessid.getAttribute("userid");
	  
		int check = realTimeService.Real_Team_Check(myid);
		String my_group_num = realTimeService.My_Group_Num(myid);
		if(check>=1){
			if(my_group_num.equals("3")){
				
			}else{
			return "/realTimeDebate/IdCheck";
			}
		}
		

		realTimeService.Disagree_Team(d_num, myid);
		


	  return "/realTimeDebate/IdCheckOk";
	  
	 }
	
	@RequestMapping(value="/insert_op.do",method={RequestMethod.GET,RequestMethod.POST})
	 public String insert_op(Model model,HttpServletRequest request,@RequestParam("d_opinion") String d_opinion){
		
		System.out.println("::::"+d_opinion);
		int debate_num=this.realTimeService.getCurrentRDebate();
		String d_num=Integer.toString(debate_num);
		HttpSession session = request.getSession() ;
		String myid = (String)session.getAttribute("userid");
		int check = realTimeService.Real_Team_Check(myid);
		
		System.out.println(myid);
		
		String my_group_num = realTimeService.My_Group_Num(myid);
		if(my_group_num == null){
			my_group_num = "3";
		}
		
		realTimeService.Insert_Op(d_num, myid, d_opinion, my_group_num);


	  return "redirect:/realtimedebate.do";
	  
	 }
	@RequestMapping(value="/team_cancel.do",method={RequestMethod.GET,RequestMethod.POST})
	 public String team_cancel(Model model,HttpServletRequest request){
		
	
		int debate_num=this.realTimeService.getCurrentRDebate();
		String d_num=Integer.toString(debate_num);
		HttpSession sessid = request.getSession() ;
		String myid = (String)sessid.getAttribute("userid");

		String my_group_num = realTimeService.My_Group_Num(myid);

		
		realTimeService.Real_Team_Cancel(d_num, myid, my_group_num);


	  return "redirect:/realtimedebate.do";
	  
	 }

	@RequestMapping(value = "/real_like_up.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String real_like_up(Model model, @RequestParam("id") String id, HttpServletRequest request) {

		Calendar oCalendar = Calendar.getInstance();
		int tmp = oCalendar.get(Calendar.DAY_OF_MONTH);
		String _date2 = String.valueOf(tmp);
		System.out.println(id);
		
		int debate_num=this.realTimeService.getCurrentRDebate();
		String d_num=Integer.toString(debate_num);
		HttpSession sessid = request.getSession();
		String myid = (String) sessid.getAttribute("userid");
		if (realTimeService.getTempDateChk()==0) {

			String my_group_num = realTimeService.My_Group_Num(id);
			int check = realTimeService.Check_Temp_Like(myid);
			
			if (check == 0) {
				realTimeService.Insert_Temp(myid);
				realTimeService.Real_Like_Up(d_num, id, my_group_num);
			} else {

				return "/realTimeDebate/LikeCheck";
			}

			TempLike tmp_date = realTimeService.Get_Temp_Date();
			System.out.println("tmp_date : " + tmp_date.getTmp_date().toString());
			String _date = tmp_date.getTmp_date().toString().substring(8, 10);
			System.out.println(_date);

			if (_date.equals(_date2)) {
				System.out.println("삭제 전전전전");
			} else {
				realTimeService.Del_Temp_Like();
				System.out.println("삭제 후후훟후");
			}
		}else{
			TempLike tmp_date = realTimeService.Get_Temp_Date();
			String _date = tmp_date.getTmp_date().toString().substring(8,10);
			System.out.println(_date);
			
			if(_date.equals(_date2)){
					System.out.println("삭제 전전전전");
			}else{
				realTimeService.Del_Temp_Like();
				System.out.println("삭제 후후훟후");
			}

			String my_group_num = realTimeService.My_Group_Num(id);
			int check = realTimeService.Check_Temp_Like(myid);
			
			if(check == 0){
				realTimeService.Insert_Temp(myid);
				realTimeService.Real_Like_Up(d_num, id, my_group_num);
			}else{
				
				return "/realTimeDebate/LikeCheck";
			}


		}
		return "redirect:/realtimedebate.do";

	}
	
	@RequestMapping(value="/debateresult.do",method={RequestMethod.GET,RequestMethod.POST})
	 public String debate_result(Model model){

		int debate_num=this.realTimeService.getCurrentRDebate();
		String d_num=Integer.toString(debate_num);
		ArrayList<RTResult> rt_result = realTimeService.Get_Rt_Result();
		
		
		model.addAttribute("rt_result", rt_result);
		
		
	  return "/realTimeDebate/debateResult";
	  
	 }
	@RequestMapping(value="/bestdebate.do",method={RequestMethod.GET,RequestMethod.POST})
	 public String bestdebate(Model model){
		
		int debate_num=this.realTimeService.getCurrentRDebate();
		String d_num=Integer.toString(debate_num);
		RTDebate best_rt = realTimeService.Get_Rt_subj(d_num);
		int mem_num = realTimeService.Best_Debate_Mem(d_num);
		
		RTResult best_result = realTimeService.Get_Best_Result(d_num);
		
		
		model.addAttribute("best_rt", best_rt);
		model.addAttribute("mem_num", mem_num);
		model.addAttribute("best_result", best_result);
		
		
		
	  return "/realTimeDebate/bestDebate";
	  
	 }
	
}