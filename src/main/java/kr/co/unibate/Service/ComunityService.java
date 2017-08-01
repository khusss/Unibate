package kr.co.unibate.Service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

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
import kr.co.unibate.bean.fboard;
import kr.co.unibate.mapper.UnibateMapper;

@Component
public class ComunityService {
	
	@Autowired
	private UnibateMapper comunityMapper;
	
	//대회정보
	public ArrayList<CompetitionInfo> getCompInfo(){
		ArrayList<CompetitionInfo> competitionInfo;
		competitionInfo = this.comunityMapper.getCompInfo();
		
		return competitionInfo;
	}
	
	public void CompetitionInsert(CompetitionInfo competitionInfo){
		this.comunityMapper.CompetitionInsert(competitionInfo);
	}
	
	public void CompetitionDelete(){
		this.comunityMapper.CompetitionDelete();
	}
	
	//공지사항
	
	public ArrayList<NoticeBoard> getNoticeBoard(int start, int end){
		ArrayList<NoticeBoard> noticeBoard;
		noticeBoard = this.comunityMapper.getNoticeBoard(start,end);
		return noticeBoard;
	}
	
	public int getNoticeAll(){
		int allNotice=0;
		
		allNotice = this.comunityMapper.getNoticeAll();
		
		return allNotice;
	}

	
	public NoticeBoard getNotice(int notice_board_num){
		NoticeBoard noticeBoard;
		noticeBoard=this.comunityMapper.getNotice(notice_board_num);
		
		return noticeBoard;
	}
	
	public void noticeHitsup(int notice_board_num){
		this.comunityMapper.noticeHitsup(notice_board_num);
	}
	
	//신고함
	public void reportered_data(Proposal proposal){
		this.comunityMapper.reportered_data(proposal);
	}
	
	//건의함
	public ArrayList<SuggestionBoard> getSuggestionBoard( int start, int end){
		ArrayList<SuggestionBoard> suggestionBoard;
		suggestionBoard = this.comunityMapper.getSuggestionBoard(start,end);
		return suggestionBoard;
	}
	
	public SuggestionBoard getSuggestion( int suggestion_board_num){
		SuggestionBoard suggestionBoard;
		suggestionBoard=this.comunityMapper.getSuggestion(suggestion_board_num);
		
		return suggestionBoard;
	}
	
	public void SuggestionHitsup(int suggestion_board_num){
		this.comunityMapper.SuggestionHitsup(suggestion_board_num);
	}
	
	public int getSuggestionAll(){
		int allSuggestion=0;
		
		allSuggestion = this.comunityMapper.getSuggestionAll();
		
		return allSuggestion;
	}
	
	public void insertSuggestion(SuggestionBoard suggestionBoard){
		this.comunityMapper.insertSuggestion(suggestionBoard);
	}
	
	public void deleteSuggestion(int suggestion_board_num){
		this.comunityMapper.deleteSuggestion(suggestion_board_num);
	}
	
	//자유게시판
	
	public ArrayList<fboard> getFBoardList( int start, int end){
		ArrayList<fboard> fBoard;
		fBoard = this.comunityMapper.getFBoardList(start, end);
		return fBoard;
	}
	
	public fboard getFBoard( int fboard_num){
		fboard fBoard;
		fBoard=this.comunityMapper.getFBoard(fboard_num);
		
		return fBoard;
	}
	
	public void fBoardHitsup(int fboard_num){
		this.comunityMapper.fBoardHitsup(fboard_num);
	}
	
	public int getFBoardAll(){
		int allFboard=0;
		
		allFboard = this.comunityMapper.getFBoardAll();
		
		return allFboard;
	}
	
	public void insertFboard(fboard board){
		this.comunityMapper.insertFboard(board);
	}
	
	public void deleteFboard(int fboard_num){
		this.comunityMapper.deleteFboard(fboard_num);
	}
	
	//QNA
	
	public ArrayList<QnAboard> getQNABoard(int start, int end){
		ArrayList<QnAboard> qnAboard;
		qnAboard = this.comunityMapper.getQNABoard(start,end);
		
		return qnAboard;
	}
	
	public QnAboard  getQNA( int qna_num){
		QnAboard QnAboard;
		QnAboard=this.comunityMapper.getQNA(qna_num);
		
		return QnAboard;
	}
	
	public int getQNAAll(){
		int allQNA=0;
		
		allQNA = this.comunityMapper.getQNAAll();
		
		return allQNA;	
	}
	
	public void insertQNA(QnAboard  qnAboard){
		this.comunityMapper.insertQNA(qnAboard);
	}
	
	public void likeUp(String id){
		this.comunityMapper.likeUp(id);
	}
	
	public void disLikeUp(String id){
		this.comunityMapper.disLikeUp(id);
	}
	
	public void fLikeAction(FboardLikeCheck fboardLikeCheck){
		this.comunityMapper.fLikeAction(fboardLikeCheck);
	}
	
	public int fLikeCheck(FboardLikeCheck fboardLikeCheck){
		return this.comunityMapper.fLikeCheck(fboardLikeCheck);
	}
	
	public void fReplyInsert(FboardReply fboardReply){
		this.comunityMapper.fReplyInsert(fboardReply);
	}
	
	public ArrayList<FboardReply> getFReplyList(String fboard_num){
		return this.comunityMapper.getFReplyList(fboard_num);
	}
	
	public void replyLikeUp(String f_reply_num){
		this.comunityMapper.replyLikeUp(f_reply_num);
	}
	public void replyDisLikeUp(String f_reply_num){
		this.comunityMapper.replyDisLikeUp(f_reply_num);
	}
	
	public void fReplyLikeAction(FboardReplyCheck fboardReplyCheck){
		this.comunityMapper.fReplyLikeAction(fboardReplyCheck);
	}
	public int fReplyLikeCheck(FboardReplyCheck fboardReplyCheck){
		return this.comunityMapper.fReplyLikeCheck(fboardReplyCheck);
	}
	
	public void suggestReplyInsert(SuggestReply suggestReply){
		this.comunityMapper.suggestReplyInsert(suggestReply);
	}
	public ArrayList<SuggestReply> getSuggestReply(String suggestion_board_num){
		return this.comunityMapper.getSuggestReply(suggestion_board_num);
	}
	
	public void sgReplyLikeUp(String sg_reply_num){
		this.comunityMapper.sgReplyLikeUp(sg_reply_num);
	}
	public void sgRreplyDisLikeUp(String sg_reply_num){
		this.comunityMapper.sgRreplyDisLikeUp(sg_reply_num);
	}
	
	public void sgReplyLikeAction(SgReplyLikeChk sgReplyLikeChk){
		this.comunityMapper.sgReplyLikeAction(sgReplyLikeChk);
	}

	public int sgReplyLikeCheck(SgReplyLikeChk sgReplyLikeChk){
		return this.comunityMapper.sgReplyLikeCheck(sgReplyLikeChk);
	}
	
	public ArrayList<SuggestReply> getMaxLikeSuggestReply(String suggestion_board_num){
		return this.comunityMapper.getMaxLikeSuggestReply(suggestion_board_num);
	}
	public int getCompetitionInfoCheck(){
		return this.comunityMapper.getCompetitionInfoCheck();
	}
	
	public int total_proposal(){
		int total_proposal = 0;
		
		total_proposal = this.comunityMapper.total_proposal();
		
		return total_proposal;
	}
	
	public ArrayList<Proposal> getProposal_List(int start, int end){
		ArrayList<Proposal> proposal_List;
		proposal_List = this.comunityMapper.getProposal_List(start, end);
		
		return proposal_List;
	}
	
	public Proposal getProposal_view(int proposal_num){
		return this.comunityMapper.getProposal_view(proposal_num);
	}
}
