package kr.co.unibate.Service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.unibate.bean.AgreeDisagreeBoard;
import kr.co.unibate.bean.AgreeDisagreeReply;
import kr.co.unibate.bean.ClubData;
import kr.co.unibate.bean.RTDebate;
import kr.co.unibate.bean.RTOpinion;
import kr.co.unibate.bean.User;
import kr.co.unibate.mapper.UnibateMapper;

@Component
public class BoardService {

	@Autowired
	private UnibateMapper unibateMapper;
	
	public ArrayList<AgreeDisagreeReply> getReply(int ad_board_num, int start, int end,int board_group_num) {
		return this.unibateMapper.getReply(ad_board_num, start, end,board_group_num);
	}

	public int getReply_count(int ad_board_num,int board_group_num) {
		return this.unibateMapper.getReply_count(ad_board_num,board_group_num);
	}

	public int getIt_Board_count(int board_group_num) {
		return this.unibateMapper.getIt_Board_count(board_group_num);
	}

	public void updateReplyLikeUp(AgreeDisagreeReply agreeDisagreeReply) {
		unibateMapper.UpdateReplyLikeUp(agreeDisagreeReply.getAd_reply_num(), agreeDisagreeReply.getAd_like(),agreeDisagreeReply.getBoard_group_num());
	}

	public void updateReplyDislikeUp(AgreeDisagreeReply agreeDisagreeReply) {
		unibateMapper.UpdateReplyDislikeUp(agreeDisagreeReply.getAd_reply_num(), agreeDisagreeReply.getAd_dislike(),agreeDisagreeReply.getBoard_group_num());
	}

	public void InsertReply(AgreeDisagreeReply agreeDisagreeReply) {
		unibateMapper.InsertReply(agreeDisagreeReply.getAd_board_num(), agreeDisagreeReply.getId(),
				agreeDisagreeReply.getAd_reply(),agreeDisagreeReply.getBoard_group_num());
	}

	public ArrayList<AgreeDisagreeBoard> getAd_Board_List(int start, int end,int board_group_num) {
		return this.unibateMapper.getAd_Board_List(start, end,board_group_num);
	}

	public ArrayList<AgreeDisagreeBoard> getAd_Board_Search_List(String ad_search,int start,int end,int board_group_num) {

		return this.unibateMapper.getAd_Board_Search_List(ad_search,start,end,board_group_num);
	}

	public AgreeDisagreeBoard getBoard_Content(int ad_board_num,int board_group_num) {

		return this.unibateMapper.getBoard_Content(ad_board_num,board_group_num);
	}
	public void BoardHits(AgreeDisagreeBoard agreeDisagreeBoard) {
		unibateMapper.BoardHits(agreeDisagreeBoard.getAd_board_num(), agreeDisagreeBoard.getBoard_count(),agreeDisagreeBoard.getBoard_group_num());
	}
	public ArrayList<User> getRanking_List() {
		return this.unibateMapper.getRanking_List();
	}
	public int getMember_Num(){
		return this.unibateMapper.getMember_Num();
	}
	
	public ArrayList<ClubData> getClub_Rank() {
		return this.unibateMapper.getClub_Rank();
	}
	
	public int getClub_Num(){
		return this.unibateMapper.getClub_Num();
	}
	public ArrayList<User> getMember_Search(String mem_rank_search) {
		return this.unibateMapper.getMember_Search(mem_rank_search);
	}
	
	public ArrayList<ClubData> getClub_Search(String club_rank_search) {
		return this.unibateMapper.getClub_Search(club_rank_search);
	}
	
	public String login(String id){
		String chk_pwd = unibateMapper.login(id);
		return chk_pwd;
	}
	public User Ind_Rank(String id){
		
		return this.unibateMapper.Ind_Rank(id);
	}
	public String My_Club_Num(String id){
		
		return this.unibateMapper.My_Club_Num(id);
	}
	public ClubData My_Club_Rank(String my_club_num){
		
		return this.unibateMapper.My_Club_Rank(my_club_num);
	}
	
	public ClubData My_Club_Info(String my_club_num){
		
		return this.unibateMapper.My_Club_Info(my_club_num);
	}
	
	public String My_Club_Member(String my_club_num){
		
		return this.unibateMapper.My_Club_Member(my_club_num);
	}
	
	public ArrayList<User> My_Club_Member_List(String my_club_num){
		
		return this.unibateMapper.My_Club_Member_List(my_club_num);
	}
	public String My_Club_King(String my_club_num){
		
		return this.unibateMapper.My_Club_King(my_club_num);
	}
	
	
}