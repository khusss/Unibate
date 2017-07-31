package kr.co.unibate.mapper;



import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import kr.co.unibate.bean.AgreeDisagreeBoard;
import kr.co.unibate.bean.AgreeDisagreeReply;
import kr.co.unibate.bean.ClubData;
import kr.co.unibate.bean.CompetitionInfo;
import kr.co.unibate.bean.FboardLikeCheck;
import kr.co.unibate.bean.FboardReply;
import kr.co.unibate.bean.FboardReplyCheck;
import kr.co.unibate.bean.NoticeBoard;
import kr.co.unibate.bean.Proposal;
import kr.co.unibate.bean.QnAboard;
import kr.co.unibate.bean.RTDebate;
import kr.co.unibate.bean.RTOpinion;
import kr.co.unibate.bean.RTResult;
import kr.co.unibate.bean.RecruitingBoard;
import kr.co.unibate.bean.SgReplyLikeChk;
import kr.co.unibate.bean.SuggestReply;
import kr.co.unibate.bean.SuggestionBoard;
import kr.co.unibate.bean.TempLike;
import kr.co.unibate.bean.TmpBest;
import kr.co.unibate.bean.User;
import kr.co.unibate.bean.fboard;


@Repository
public interface UnibateMapper {
	
	//대회정보
	final String COMPETITIONINFO_LOAD="SELECT * FROM CompetitionInfo";
	final String COMPETITIONINFO_INSERT="INSERT INTO CompetitionInfo(competition_date, competition_name, competition_local, competition_url) VALUES(#{competition_date},#{competition_name},#{competition_local},#{competition_url})";
	final String COMPETITIONINFO_DELETE="delete from CompetitionInfo where info_code in "
			+ " (SELECT * FROM(select info_code from CompetitionInfo where competition_date < now()) a)";
	final String COMPETITIONINFO_CHK="SELECT COUNT(*) FROM CompetitionInfo";
	
	@Select(COMPETITIONINFO_CHK)
	int getCompetitionInfoCheck();
	
	@Select(COMPETITIONINFO_LOAD)
	@Results(value={
			@Result(property="info_code", column="INFO_CODE"),
			@Result(property="competition_date", column="COMPETITION_DATE"),
			@Result(property="competition_name", column="COMPETITION_NAME"),
			@Result(property="competition_url", column="COMPETITION_URL"),
			@Result(property="competition_local", column="COMPETITION_LOCAL")
	})
	ArrayList<CompetitionInfo> getCompInfo();
	
	@Insert(COMPETITIONINFO_INSERT)
	void CompetitionInsert(CompetitionInfo competitionInfo);
	
	@Delete(COMPETITIONINFO_DELETE)
	void CompetitionDelete();
	
	
	//공지사항
	final String NOTICEBOARD="SELECT NOTICE_BOARD_NUM, NOTICE_SUBJECT, NOTICE_DATE, NOTICE_HITS FROM NoticeBoard";
	final String NOTICE_PAGING="SELECT * FROM NoticeBoard ORDER BY  NOTICE_BOARD_NUM DESC LIMIT  #{start}, #{end} ";
	final String NOTICE_DATA="SELECT * FROM NoticeBoard WHERE notice_board_num=#{notice_board_num}";
	final String NOTICE_ALL="SELECT COUNT(1) FROM NoticeBoard";
	final String NOTICE_HITS_UP="UPDATE NoticeBoard SET NOTICE_HITS=NOTICE_HITS+1 WHERE  notice_board_num=#{notice_board_num}";
	

	@Select(NOTICE_PAGING)
	@Results(value={
			@Result(property="notice_board_num", column="NOTICE_BOARD_NUM"),
			@Result(property="notice_subject", column="NOTICE_SUBJECT"),
			@Result(property="notice_date", column="NOTICE_DATE"),
			@Result(property="notice_hits", column="NOTICE_HITS")
	})
	ArrayList<NoticeBoard> getNoticeBoard(@Param("start") int start, @Param("end") int end);
	
	@Select(NOTICE_DATA)
	@Results(value={
			@Result(property="notice_board_num", column="NOTICE_BOARD_NUM"),
			@Result(property="notice_subject", column="NOTICE_SUBJECT"),
			@Result(property="notice_date", column="NOTICE_DATE"),
			@Result(property="notice_hits", column="NOTICE_HITS"),
			@Result(property="notice_content", column="NOTICE_CONTENT")
	})
	NoticeBoard getNotice(@Param("notice_board_num") int notice_board_num);
	
	@Update(NOTICE_HITS_UP)
	void noticeHitsup(@Param("notice_board_num") int notice_board_num);
	
	@Select(NOTICE_ALL)
	int getNoticeAll();
	
	//주제건의
	final String SUGGESTION_INSERT="INSERT INTO SuggestionBoard(suggestion_content, suggestion_subject, suggestion_hit , id, suggestion_date ) VALUES( #{suggestion_content}, #{suggestion_subject}, 0, #{id}, now())";
	final String SUGGESTION_PAGING="SELECT * FROM SuggestionBoard ORDER BY  suggestion_board_num DESC LIMIT  #{start}, #{end} ";
	final String SUGGESTION_ALL="SELECT COUNT(1) FROM SuggestionBoard";
	final String SUGGESTION_HITS_UP="UPDATE SuggestionBoard SET suggestion_hit=suggestion_hit+1 WHERE  suggestion_board_num=#{suggestion_board_num}";
	final String SUGGESTION_DATA="SELECT * FROM SuggestionBoard WHERE suggestion_board_num=#{suggestion_board_num}";
	final String SUGGESTION_DELETE="DELETE FROM SuggestionBoard WHERE suggestion_board_num=#{suggestion_board_num}";
	
	final String SG_REPLY_IN="INSERT INTO suggest_reply(suggestion_board_num, sg_reply, id, sg_reply_date) VALUES(#{suggestion_board_num}, #{sg_reply}, #{id}, now())";
	final String GET_SG_REPLY="SELECT * FROM suggest_reply WHERE suggestion_board_num=#{suggestion_board_num} ORDER BY sg_reply_num";
	final String MAX_LIKE_SG_REPLY="SELECT * FROM suggest_reply WHERE suggestion_board_num=#{suggestion_board_num} ORDER BY sg_like";
	final String SG_REPLY_LIKE="UPDATE suggest_reply SET sg_like=sg_like+1 WHERE sg_reply_num=#{sg_reply_num}";
	final String SG_REPLY_DLIKE="UPDATE suggest_reply SET sg_dislike=sg_dislike+1 WHERE sg_reply_num=#{sg_reply_num}";
	
	final String SG_REPLY_LIKE_ACTION="INSERT INTO sg_likechk(suggestion_board_num, sg_reply_num, id) VALUES(#{suggestion_board_num},#{sg_reply_num},#{id})";
	final String SG_REPLY__LIKE_COUNT="SELECT COUNT(*) FROM sg_likechk WHERE suggestion_board_num=#{suggestion_board_num} and sg_reply_num=#{sg_reply_num} and id=#{id}";
	
	@Insert(SG_REPLY_LIKE_ACTION)
	void sgReplyLikeAction(SgReplyLikeChk sgReplyLikeChk);
	
	@Select(SG_REPLY__LIKE_COUNT)
	int sgReplyLikeCheck(SgReplyLikeChk sgReplyLikeChk);
	
	@Update(SG_REPLY_LIKE)
	void sgReplyLikeUp(String sg_reply_num);
	
	@Update(SG_REPLY_DLIKE)
	void sgRreplyDisLikeUp(String sg_reply_num);
	
	
	@Insert(SG_REPLY_IN)
	void suggestReplyInsert(SuggestReply suggestReply);
	
	@Select(GET_SG_REPLY)
	ArrayList<SuggestReply> getSuggestReply(String suggestion_board_num);
	
	@Select(MAX_LIKE_SG_REPLY)
	ArrayList<SuggestReply> getMaxLikeSuggestReply(String suggestion_board_num);
	
	@Select(SUGGESTION_PAGING)
	@Results(value={
			@Result(property="suggestion_board_num", column="SUGGESTION_BOARD_NUM"),
			@Result(property="suggestion_subject", column="SUGGESTION_SUBJECT"),
			@Result(property="suggestion_date", column="SUGGESTION_DATE"),
			@Result(property="suggestion_hits", column="SUGGESTION_HITS")
	})
	ArrayList<SuggestionBoard> getSuggestionBoard(@Param("start") int start, @Param("end") int end);
	
	@Select(SUGGESTION_DATA)
	@Results(value={
			@Result(property="suggestion_board_num", column="SUGGESTION_BOARD_NUM"),
			@Result(property="suggestion_subject", column="SUGGESTION_SUBJECT"),
			@Result(property="suggestion_content", column="SUGGESTION_CONTENT"),
	})
	SuggestionBoard getSuggestion(@Param("suggestion_board_num") int suggestion_board_num);
	
	@Update(SUGGESTION_HITS_UP)
	void SuggestionHitsup(@Param("suggestion_board_num") int suggestion_board_num);
	
	@Select(SUGGESTION_ALL)
	int getSuggestionAll();
	
	@Insert(SUGGESTION_INSERT)
	void insertSuggestion(SuggestionBoard suggestionBoard);
	
	@Delete(SUGGESTION_DELETE)
	void deleteSuggestion(@Param("suggestion_board_num") int suggestion_board_num);
	
	//신고함 파트 입니다.
	final String PROPOSAL_INSERT="INSERT INTO proposal(proposal_flag, proposal_subject, proposal_content, id, proposal_date ) VALUES( #{proposal_flag}, #{proposal_subject}, #{proposal_content}, #{id}, sysdate())";
	
	@Insert(PROPOSAL_INSERT)
	void reportered_data(Proposal proposal);
	
	
	
	//자유게시판
	
	final String FBOARD_INSERT="INSERT INTO fBoard(FBoard_content, FBoard_subject, FBoard_hit , id, FBoard_date ,URLdata) VALUES( #{fboard_content}, #{fboard_subject}, 0, #{id}, now(), #{urldata})";
	final String FBOARD_PAGING="SELECT * FROM fBoard ORDER BY  fboard_num DESC LIMIT  #{start}, #{end} ";
	final String FBOARD_ALL="SELECT COUNT(1) FROM fBoard";
	final String FBOARD_HITS_UP="UPDATE fBoard SET fboard_hit=fboard_hit+1 WHERE  fboard_num=#{fboard_num}";
	final String FBOARD_DATA="SELECT * FROM fBoard WHERE fboard_num=#{fboard_num}";
	final String FBOARD_DELETE="DELETE FROM fBoard WHERE fboard_num=#{fboard_num}";
	final String FBOARD_LIKE="UPDATE fBoard SET f_like=f_like+1 WHERE fboard_num=#{fboard_num}";
	final String FBOARD_DLIKE="UPDATE fBoard SET f_dislike=f_dislike+1 WHERE fboard_num=#{fboard_num}";
	
	//좋아요 체크
	
	final String F_LIKE_ACTION="INSERT INTO f_likechk(fboard_num, id) VALUES(#{fboard_num}, #{id})";
	final String F_LIKE_COUNT="SELECT COUNT(*) FROM f_likechk WHERE fboard_num=#{fboard_num} and id=#{id}";
	
	//리플
	
	final String F_REPLY_IN="INSERT INTO fboard_reply(fboard_num, f_reply, id, f_reply_date) VALUES(#{fboard_num}, #{f_reply}, #{id}, now())";
	final String GET_F_REPLY="SELECT * FROM fboard_reply WHERE fboard_num=#{fboard_num} ORDER BY f_reply_num";
	final String FBOARD_REPLY_LIKE="UPDATE fboard_reply SET f_like=f_like+1 WHERE f_reply_num=#{f_reply_num}";
	final String FBOARD_REPLY_DLIKE="UPDATE fboard_reply SET f_dislike=f_dislike+1 WHERE f_reply_num=#{f_reply_num}";
	
	final String F_REPLY_LIKE_ACTION="INSERT INTO f_r_likechk(fboard_num, f_reply_num, id) VALUES(#{fboard_num},#{f_reply_num},#{id})";
	final String F_REPLY__LIKE_COUNT="SELECT COUNT(*) FROM f_r_likechk WHERE fboard_num=#{fboard_num} and f_reply_num=#{f_reply_num} and id=#{id}";
	
	@Insert(F_REPLY_LIKE_ACTION)
	void fReplyLikeAction(FboardReplyCheck fboardReplyCheck);
	
	@Select(F_REPLY__LIKE_COUNT)
	int fReplyLikeCheck(FboardReplyCheck fboardReplyCheck);
	
	@Update(FBOARD_REPLY_LIKE)
	void replyLikeUp(String f_reply_num);
	
	@Update(FBOARD_REPLY_DLIKE)
	void replyDisLikeUp(String f_reply_num);
	
	@Insert(F_REPLY_IN)
	void fReplyInsert(FboardReply fboardReply);
	
	@Select(GET_F_REPLY)
	ArrayList<FboardReply> getFReplyList(String fboard_num);
	
	@Insert(F_LIKE_ACTION)
	void fLikeAction(FboardLikeCheck fboardLikeCheck);
	
	@Select(F_LIKE_COUNT)
	int fLikeCheck(FboardLikeCheck fboardLikeCheck);
	
	@Update(FBOARD_LIKE)
	void likeUp(String fboard_num);
	
	@Update(FBOARD_DLIKE)
	void disLikeUp(String fboard_num);
	
	@Select(FBOARD_PAGING)
	@Results(value={
			@Result(property="fboard_num", column="fboard_num"),
			@Result(property="fboard_subject", column="fboard_SUBJECT"),
			@Result(property="fboard_date", column="fboard_DATE"),
			@Result(property="fboard_hits", column="fboard_HITS")
	})
	ArrayList<fboard> getFBoardList(@Param("start") int start, @Param("end") int end);
	
	@Select(FBOARD_DATA)
	@Results(value={
			@Result(property="fboard_num", column="fboard_num"),
			@Result(property="fboard_subject", column="fboard_subject"),
			@Result(property="fboard_content", column="fboard_content"),
			@Result(property="urldata", column="urldata")
	})
	fboard getFBoard(@Param("fboard_num") int fboard_num);
	
	@Update(FBOARD_HITS_UP)
	void fBoardHitsup(@Param("fboard_num") int fboard_num);
	
	@Select(FBOARD_ALL)
	int getFBoardAll();
	
	@Insert(FBOARD_INSERT)
	void insertFboard(fboard board);
	
	@Delete(FBOARD_DELETE)
	void deleteFboard(@Param("fboard_num") int fboard_num);
	
	
	//
	
	//주제건의
	final String QNA_INSERT="INSERT INTO qna(qna_content, qna_subject, id, qna_date ) VALUES( #{qna_content}, #{qna_subject}, #{id}, now())";
	final String QNA_PAGING="SELECT * FROM qna ORDER BY  qna_num DESC LIMIT  #{start}, #{end} ";
	final String QNA_ALL="SELECT COUNT(1) FROM qna";
	final String QNA_DATA="SELECT * FROM qna WHERE qna_num=#{qna_num}";
		
	@Select(QNA_PAGING)
	@Results(value={
			@Result(property="qna_num", column="qna_num"),
			@Result(property="qna_subject", column="qna_subject"),
			@Result(property="qna_date", column="qna_date"),
	})
	ArrayList<QnAboard> getQNABoard(@Param("start") int start, @Param("end") int end);
	
	@Select(QNA_DATA)
	@Results(value={
			@Result(property="qna_num", column="qna_num"),
			@Result(property="qna_subject", column="qna_subject"),
			@Result(property="qna_content", column="qna_content")
	})
	QnAboard getQNA(@Param("qna_num") int qna_num);
	
	@Select(QNA_ALL)
	int getQNAAll();
	
	@Insert(QNA_INSERT)
	void insertQNA(QnAboard QnAboard);
	
	//동아리 파트
	
	final String CLUB_INSERT="INSERT INTO club(club_name, club_introduce_text, id, club_img, club_make_date) VALUES(#{club_name}, #{club_introduce_text}, #{id}, #{club_img}, now())";
	final String CLUB_OVERLAP="SELECT COUNT(*) FROM club WHERE id LIKE #{id} ";
	final String CLUB_NAME_CHECK="SELECT COUNT(*) FROM club WHERE club_name LIKE #{club_name}";
	final String CLUB_MAKE_USER="SELECT club_name, id, club_num FROM club WHERE id LIKE #{id}";
	final String CLUB_PRIME_IN="INSERT INTO club_mem(club_flag, id, club_num) VALUES(1 , #{id},  #{club_num})";
	final String CLUB_MEM_IN="INSERT INTO club_mem(club_flag, id, club_num) VALUES(3, #{id},  #{club_num})";
	final String CLUB_JOIN_CHECK="select COUNT(*) from club_mem where id like #{id}";
	final String CLUB_MEM_UP="UPDATE club SET club_mem=(SELECT COUNT(*) FROM club_mem WHERE CLUB_NUM=#{club_num}) where club_num=#{club_num}";
	
	final String CLUB_NUM="SELECT CLUB_NUM FROM club WHERE CLUB_NAME LIKE #{CLUB_NAME}";
	
	final String CLUB_ALL_VIEW="SELECT club_make_date, club_name, club_mem FROM club";
	final String CLUB_ALL="SELECT COUNT(*) FROM club";
	
	final String CLUB_MEM_INFO="SELECT COUNT(*) FROM club_mem GROUP BY club_num HAVING club_num=#{club_num}";
	final String CLUB_MEM_NUM_UP="UPDATE club SET club_mem=#{club_mem} WHERE club_num=#{club_num}";
	
	final String MEM_CLUB_NUM_UP="UPDATE MEMBER1 set CLUB_NUM=(SELECT club_num FROM club_mem WHERE id LIKE #{id} ) where id=#{id}";
	
	
	@Insert(CLUB_INSERT)
	void insertClub(ClubData clubData);
	
	@Select(CLUB_OVERLAP)
	int overlapCheck(String id);
	
	@Select(CLUB_NAME_CHECK)
	int clubNameCheck(String club_name);
	
	@Select(CLUB_MAKE_USER)
	@Results(value={
			@Result(property="club_name", column="club_name"),
			@Result(property="id", column="id"),
			@Result(property="club_num", column="club_num")
	})
	ClubData clubMakeUser(String id);
	
	@Insert(CLUB_PRIME_IN)
	void insertCMemDB(ClubData clubData);
	
	@Select(CLUB_ALL_VIEW)
	@Results(value={
			@Result(property="club_date", column="club_date"),
			@Result(property="club_name", column="club_name"),
			@Result(property="club_mem", column="club_mem"),
	})
	ArrayList<ClubData> getClubBoard(@Param("start") int start, @Param("end") int end);
	
	@Select(CLUB_ALL)
	int getClubAll();
	
	@Select(CLUB_MEM_INFO)
	int getMemCount(int club_num);
	
	@Update(CLUB_MEM_NUM_UP)
	void upMemNum(int club_mem, int club_num);
	
	@Update(MEM_CLUB_NUM_UP)
	void upMemberClub(String id);
	
	@Insert(CLUB_MEM_IN)
	void clubMemIn(ClubData clubData);
	
	@Select(CLUB_JOIN_CHECK)
	int clubJoinCheck(String id);
	
	@Select(CLUB_NUM)
	int getClubNum(String club_name);
	
	@Update(CLUB_MEM_UP)
	void clubMemUp(int club_num);
	
	//동아리 홍보
	
	final String RECRUIT_INSERT="INSERT INTO recruiting(recruit_content, recruit_subject, recruit_hits , id, recruit_date, img ) VALUES( #{recruit_content}, #{recruit_subject}, 0, #{id}, now() ,#{img})";
	final String RECRUIT_PAGING="SELECT * FROM recruiting ORDER BY recruit_board_num DESC LIMIT  #{start}, #{end} ";
	final String RECRUIT_ALL="SELECT COUNT(1) FROM recruiting";
	final String RECRUIT_HITS_UP="UPDATE recruiting SET recruit_hits=recruit_hits+1 WHERE  recruit_board_num=#{recruit_board_num}";
	final String RECRUIT_DATA="SELECT * FROM recruiting WHERE recruit_board_num=#{recruit_board_num}";
	final String RECRUIT_DELETE="DELETE FROM recruiting WHERE recruit_board_num=#{recruit_board_num}";
	
	@Select(RECRUIT_PAGING)
	@Results(value={
			@Result(property="recruit_board_num", column="recruit_board_num"),
			@Result(property="recruit_subject", column="recruit_subject"),
			@Result(property="recruit_date", column="recruit_date"),
			@Result(property="recruit_hits", column="recruit_hits")
	})
	ArrayList<RecruitingBoard> getRecruitBoard(@Param("start") int start, @Param("end") int end);
	
	@Select(RECRUIT_DATA)
	@Results(value={
			@Result(property="recruit_board_num", column="recruit_board_num"),
			@Result(property="recruit_subject", column="recruit_SUBJECT"),
			@Result(property="recruit_content", column="recruit_CONTENT"),
	})
	RecruitingBoard getRecruit(@Param("recruit_board_num") int recruit_board_num);
	
	@Update(RECRUIT_HITS_UP)
	void Recruitsup(@Param("recruit_board_num") int recruit_board_num);
	
	@Select(RECRUIT_ALL)
	int RecruitAll();
	
	@Insert(RECRUIT_INSERT)
	void insertRecruit(RecruitingBoard RecruitingBoard);
	
	@Delete(RECRUIT_DELETE)
	void deleteRecruit(@Param("recruit_board_num") int recruit_board_num);
	
	
	
	// final String NOTICE_PAGING="SELECT * FROM NoticeBoard ORDER BY
	// NOTICE_BOARD_NUM DESC LIMIT #{start}, #{end} ";
	// 게시물 역순으로 조회해 둬서 꺼내야 최근 게시물이 첫패이지에 노출됨
	// limit은 start에서 end개수 만큼 뿌려줌
	// final String NOTICE_ALL="SELECT COUNT(1) FROM NoticeBoard";

	final String Reply = "SELECT * FROM reply where ad_board_num = #{ad_board_num} and board_group_num=#{board_group_num} order by ad_like desc LIMIT  #{start}, #{end}";

	final String Reply_Count = "SELECT count(*) from reply where ad_board_num=#{ad_board_num} and board_group_num=#{board_group_num}";

	final String Reply_like_Up = "UPDATE reply SET ad_like = #{ad_like}+1 WHERE ad_reply_num = #{ad_reply_num} and board_group_num=#{board_group_num}";

	final String Reply_Dislike = "UPDATE reply SET ad_dislike = #{ad_dislike}+1 WHERE ad_reply_num = #{ad_reply_num} and board_group_num=#{board_group_num}";

	final String Reply_Insert = "INSERT INTO reply (ad_board_num,id,ad_reply,reply_date,board_group_num) values(#{ad_board_num},#{id},#{ad_reply},now(),#{board_group_num})";

	final String Board_List = "SELECT * from ad_board_list where board_group_num=#{board_group_num} order by ad_board_num desc limit #{start},#{end}";
	
	final String It_Board_Count = "SELECT count(*) from ad_board_list where board_group_num=#{board_group_num}";
	final String Board_Search_List = "SELECT * from ad_board_list where ad_subject like CONCAT('%',#{ad_search},'%') and board_group_num=#{board_group_num} order by ad_board_num desc limit #{start},#{end}";
	final String Board_Content = "SELECT * from ad_board_list where ad_board_num=#{ad_board_num} and board_group_num=#{board_group_num}";
	final String Board_hits = "UPDATE ad_board_list SET board_count = #{board_count}+1 where ad_board_num = #{ad_board_num} and board_group_num= #{board_group_num}";
	
	
	final String Ranking_list = "SELECT id, score,name, ( @rank := @rank + 1 ) AS rank FROM MEMBER1 AS a, ( SELECT @rank := 0 ) AS b ORDER BY a.score DESC limit 0,9";
	final String Member_Num = "SELECT count(*) from MEMBER1";
	final String Club_Rank = "select a.club_name,sum(b.score) as score,( @rank := @rank + 1 ) AS rank from club as a join MEMBER1 as b on a.club_num=b.club_num,( SELECT @rank := 0 ) AS c group by a.club_name order by sum(b.score) DESC limit 0,9";
	final String Club_Num = "SELECT count(*) from club";
	final String Member_Search = "SELECT * from (SELECT id, score,name, ( @rank := @rank + 1 ) AS rank FROM MEMBER1 AS a, ( SELECT @rank := 0 ) AS b ORDER BY a.score DESC) as c where c.id like #{mem_rank_search}";
	final String Club_Search = "SELECT * from (select a.club_name as club_name,sum(b.score) as score,( @rank := @rank + 1 ) AS rank from club as a join MEMBER1 as b on a.club_num=b.club_num,( SELECT @rank := 0 ) AS c group by a.club_name order by sum(b.score) DESC) as d where d.club_name like #{club_rank_search}";
	final String Individual_Rank = "SELECT score,rank from (SELECT id,score,( @rank := @rank + 1 ) AS rank  FROM MEMBER1 AS a, ( SELECT @rank := 0 ) AS b order by score DESC) as c where id =#{id}";
	final String My_Club_Rank = "SELECT * from (select a.club_name,sum(b.score) as score,( @rank := @rank + 1 ) AS rank,a.club_num from club as a join MEMBER1 as b on a.club_num=b.club_num,( SELECT @rank := 0 ) AS c group by a.club_name order by sum(b.score) DESC) as d where d.club_num=#{my_club_num}";
	final String My_Club_Num = "select club_num from MEMBER1 where id=#{id}";
	final String My_Club_Info = "SELECT * from club where club_num=#{club_num}";
	
	final String APPOINTMENT_MANAGER="UPDATE club_mem set club_flag=#{club_flag} WHERE ID=#{id}";

	@Update(APPOINTMENT_MANAGER)
	void appointmentManager(ClubData clubData);
	
	//내동아리 인원수
	final String My_Club_Member = "SELECT count(*) from MEMBER1 where club_num=#{my_club_num}";
	//내 동아리 멤버들 가져오기
	final String My_Club_Member_List = "select * from (SELECT m.id, m.name, c.club_flag, m.club_num from MEMBER1 as m INNER JOIN club_mem as c where m.id=c.id order by club_num) as d where d.club_num=#{club_num}";
	//클럽장 가져오기
	final String My_Club_King = "SELECT id FROM club_mem where CLUB_NUM=#{club_num} and club_flag=1";
	

	@Select(It_Board_Count)
	int getIt_Board_count(@Param("board_group_num") int board_group_num);

	
	@Select(Reply_Count)
	int getReply_count(@Param("ad_board_num") int ad_board_num,@Param("board_group_num") int board_group_num);
	@Select(Reply)
	@Results(value = { @Result(property = "ad_reply_num", column = "ad_reply_num"),
			@Result(property = "board_group_num", column = "board_group_num"),
			@Result(property = "id", column = "id"), @Result(property = "ad_reply", column = "ad_reply"),
			@Result(property = "ad_like", column = "ad_like"), @Result(property = "ad_dislike", column = "ad_dislike"),
			@Result(property = "reply_date", column = "reply_date"), })
	ArrayList<AgreeDisagreeReply> getReply(@Param("ad_board_num") int ad_board_num, @Param("start") int start,
			@Param("end") int end,@Param("board_group_num") int board_group_num);

	@Update(Reply_like_Up)
	void UpdateReplyLikeUp(@Param("ad_reply_num") int ad_reply_num, @Param("ad_like") int ad_like,@Param("board_group_num") int board_group_num);

	@Update(Reply_Dislike)
	void UpdateReplyDislikeUp(@Param("ad_reply_num") int ad_reply_num, @Param("ad_dislike") int ad_dislike,@Param("board_group_num") int board_group_num);

	@Insert(Reply_Insert)
	void InsertReply(@Param("ad_board_num") int ad_board_num, @Param("id") String id,
			@Param("ad_reply") String ad_reply,@Param("board_group_num") int board_group_num);

	@Select(Board_List)
	@Results(value = { 
			@Result(property = "ad_board_num", column = "ad_board_num"),
			@Result(property = "ad_subject", column = "ad_subject"),
			@Result(property = "board_group_num", column = "board_group_num"),
			@Result(property = "board_date", column = "board_date"),
			@Result(property = "board_count", column = "board_count"), })
	ArrayList<AgreeDisagreeBoard> getAd_Board_List( @Param("start") int start,
			@Param("end") int end,@Param("board_group_num") int board_group_num);

	@Select(Board_Search_List)
	@Results(value = { @Result(property = "ad_board_num", column = "ad_board_num"),
			@Result(property = "ad_subject", column = "ad_subject"),
			@Result(property = "board_date", column = "board_date"),
			@Result(property = "board_count", column = "board_count"),
			@Result(property = "board_group_num", column = "board_group_num"),})
	ArrayList<AgreeDisagreeBoard> getAd_Board_Search_List(@Param("ad_search") String ad_search,@Param("start") int start,
			@Param("end") int end,@Param("board_group_num") int board_group_num);

	@Select(Board_Content)
	@Results(value = { 
			@Result(property = "ad_board_num", column = "ad_board_num"),
			@Result(property = "board_content", column = "board_content"),
			@Result(property = "board_img", column = "board_img"),
			@Result(property = "ad_subject", column = "ad_subject"),
			@Result(property = "board_date", column = "board_date"),
			@Result(property = "board_count", column = "board_count"),
			@Result(property = "board_group_num", column = "board_group_num"),})
	AgreeDisagreeBoard getBoard_Content(@Param("ad_board_num") int ad_board_num,@Param("board_group_num") int board_group_num);
	
	@Update(Board_hits)
	void BoardHits(@Param("ad_board_num") int ad_board_num, @Param("board_count") int board_count,@Param("board_group_num") int board_group_num);
	
	@Select(Ranking_list)
	@Results(value = { 
			@Result(property = "id", column = "id"),
			@Result(property = "rank", column = "rank"),
			@Result(property = "name", column = "name"),
			@Result(property = "score", column = "score"),})
	ArrayList<User> getRanking_List();
	@Select(Member_Num)
	int getMember_Num();
	
	@Select(Club_Rank)
	@Results(value = { 
			@Result(property = "club_name", column = "club_name"),
			@Result(property = "score", column = "score"),
			@Result(property = "rank", column = "rank"),})
	ArrayList<ClubData> getClub_Rank();
	@Select(Club_Num)
	int getClub_Num();
	
	@Select(Member_Search)
	@Results(value = { 
			@Result(property = "id", column = "id"),
			@Result(property = "rank", column = "rank"),
			@Result(property = "name", column = "name"),
			@Result(property = "score", column = "score"),})
	ArrayList<User> getMember_Search(@Param("mem_rank_search") String mem_rank_search);
	
	@Select(Club_Search)
	@Results(value = { 
			@Result(property = "club_name", column = "club_name"),
			@Result(property = "score", column = "score"),
			@Result(property = "rank", column = "rank"),})
	ArrayList<ClubData> getClub_Search(@Param("club_rank_search") String club_rank_search);
	

	
	@Select(Individual_Rank)
	@Results(value = { 
			@Result(property = "score", column = "score"),
			@Result(property = "rank", column = "rank"),})
	User Ind_Rank(@Param("id") String id);
	
	
	@Select(My_Club_Num)
	String My_Club_Num(String id);
	 
	@Select(My_Club_Rank)
	@Results(value = { 
			@Result(property = "club_name", column = "club_name"),
			@Result(property = "score", column = "score"),
			@Result(property = "rank", column = "rank"),})
	ClubData My_Club_Rank(@Param("my_club_num") String club_num);
	
	
	@Select(My_Club_Info)
	ClubData My_Club_Info(String club_num);
	
	
	
	@Select(My_Club_Member)
	String My_Club_Member(@Param("my_club_num") String my_club_num);
	
	
	
	@Select(My_Club_Member_List)
	@Results(value = { 
			@Result(property = "id", column = "id"),
			@Result(property = "name", column = "name"),})
	ArrayList<User> My_Club_Member_List(String club_num);
	
	@Select(My_Club_King)
	String My_Club_King(String club_num);
	
	
	
	//동아리 탈퇴
	final String MY_CLUB_FLAG="SELECT CLUB_FLAG FROM club_mem WHERE ID=#{id}";
	final String SECESSION_CLUB="DELETE FROM club_mem WHERE ID=#{id}";
	final String CLUB_NUM_0="UPDATE MEMBER1 SET CLUB_NUM=0 WHERE ID=#{id}";
	
	@Select(MY_CLUB_FLAG)
	int getClubFlag(String id);
	
	@Delete(SECESSION_CLUB)
	void secessionClub(String id);
	
	@Update(CLUB_NUM_0)
	void clubNumReset(String id);
	
	//회원 가입 파트
	
	final String SIGN_IN = "INSERT INTO MEMBER1(id,pwd,name,gender,area,school,major,email) VALUES(#{id},#{pwd},#{name},#{gender},#{area},#{school},#{major},#{email})";


	final String CALL_INFO="SELECT EMAIL,NAME,CLUB_NUM FROM MEMBER1 WHERE ID=#{id}";
	final String INFO_MODIFY="UPDATE MEMBER1 SET pwd=#{pwd},school=#{school},major=#{major},area=#{area} where id=#{id}";

	final String Login = "SELECT pwd FROM MEMBER1 WHERE id=#{id} ";
	final String Id_Check = "SELECT id FROM MEMBER1 WHERE id=#{id}";
	/////////////////////////////////////////////////////////////////
	
	final String CLUB_NUM_= "SELECT club_num FROM MEMBER1 WHERE ID LIKE #{id}";
	final String MEM_LEAVE="DELETE FROM MEMBER1 WHERE ID LIKE #{id} ";
	final String COMMIT="COMMIT";
	/////////////////////////////////////////////////////////////////
	
	@Update(COMMIT)
	void Commit();
	
	@Select(CLUB_NUM_)
	int getClubNumFromID(String id);

	@Delete(MEM_LEAVE)
	void deleteMem(String id);


	////회원가입 테이블 멤버 삽입
	@Insert(SIGN_IN)
	void insertMember(User user);

	////로그인 비밀번호 체크
	@Select(Login)
	String login(@Param("id") String id);

	////회원 가입 아이디 중복확인
	@Select(Id_Check)
	String id_check(@Param("id") String id);


	//////정보 수정 파트
	@Select(CALL_INFO)
	@Results(value={
	@Result(property="email",column="email"),
	@Result(property="name",column="name"),
	@Result(property="club_num",column="club_num"),
	})
	User callInfo(@Param("id") String id);

	@Update(INFO_MODIFY)
	void infoModify(User user);
	
	final String Find_Id = "SELECT id FROM MEMBER1 WHERE email=#{email} and name=#{name}";
	final String Find_Pwd="SELECT pwd FROM MEMBER1 WHERE id like #{id} and email like #{email} and name like #{name}";

	@Select(Find_Id)
	String find_id(@Param("email") String email,@Param("name")String name);
		
		
	@Select(Find_Pwd)
	String find_pwd(@Param("id")String id,@Param("email") String email,@Param("name")String name);
	
	

	//실시간 토론 주제 가져오기
	final String Get_Rt_subj="select * from rt_debate where d_num=#{d_num}";
	
	
	//실시간 토론 댓글 가져오기
	//final String Get_Rt_Reply = "select * from rt_opinion where d_num=#{d_num}";
	final String Get_Rt_Reply = "select a.group_num, a.opinion_num, a.d_num, a.id, a.d_opinion, a.opinion_date ,m.school from rt_opinion as a inner join MEMBER1 as m where a.id=m.id and a.d_num=#{d_num}";
	

	//실시간 토론 찬성팀 참가
	final String Agree_Team = "INSERT INTO rt_opinion(group_num,d_num,id,opinion_date) values (1,#{d_num},#{id},now())";
	
	//실시간 토론 반대팀 참가
	final String Disagree_Team ="INSERT INTO rt_opinion(group_num,d_num,id,opinion_date) values (2,#{d_num},#{id},now())";
	
	//실시간 찬성 팀원수 구하기
	final String Agree_Team_Count = "select count(*) from (select id from rt_opinion where group_num = 1 and d_num=1 group by id) as a ";
	
	//실시간 반대 팀원수 구하기
	final String Disagree_Team_Count = "select count(*) from (select id from rt_opinion where group_num = 2 and d_num=1 group by id) as a ";
	
	//실시간 토론 팀 참가여부 확인
	final String Real_Team_Check = "select count(*) from (select id from rt_opinion where group_num=1 or group_num=2) as a where a.id=#{id}";
	
	//내 그룹넘버(어느 팀인지)가져오기
	final String My_Group_Num = "SELECT group_num from rt_opinion where id=#{id} order by opinion_date DESC limit 1";
	
	//의견 등록하기
	final String Insert_Op = "INSERT INTO rt_opinion(group_num,d_num,id,d_opinion,opinion_date) values(#{group_num},#{d_num},#{id},#{d_opinion},now())";
	
	//찬성팀 리스트 가져오기
	final String Real_Agree_Member = "select b.id,b.name,sum(a.opinion_num) as opinion_num from rt_opinion as a join MEMBER1 as b on a.id=b.id where a.d_num=#{d_num} and a.group_num =1 group by a.id";
	
	//반대팀 리스트 가져오기
	final String Real_Disagree_Member = "select b.id,b.name,sum(a.opinion_num) as opinion_num from rt_opinion as a join MEMBER1 as b on a.id=b.id where a.d_num=#{d_num} and a.group_num =2 group by a.id";
	
	//팀 취소 하기 
	final String Real_Team_Cancel = "delete from rt_opinion where d_num=#{d_num} and group_num=#{my_group_num} and id=#{id}";
	
	//실시간 좋아요 업데이트
	final String Real_Like_Up = "update rt_opinion set opinion_num = opinion_num+1 where opinion_date = (select t.opinion_date from (select opinion_date from rt_opinion where group_num=#{my_group_num} and d_num=#{d_num} group by id having id =#{id} order by opinion_date DESC limit 1)as t)";
	
	//실시간 팀 점수 가져오기
	final String Get_Score = "select sum(opinion_num) from rt_opinion where d_num=#{d_num} and group_num = #{group_num}";
	//
	final String DEFAULT_SCORE="select count(opinion_num) from rt_opinion where d_num=#{d_num}";
	
	final String GROPE_SCORE="select count(opinion_num) from rt_opinion where d_num=#{d_num} and group_num = #{group_num}";
	//토론 결과 리스트 가져오기
	final String Get_Rt_Result = "select * from rt_result";
	
	//최고의 토론 참여자수 구하기
	final String Best_Debate_Mem = "select count(distinct id) from rt_opinion where d_num=#{d_num}";
	
	//최고의 토론 가져오기
	final String Get_Best_Result = "select * from rt_result where d_num=#{d_num}";
	
	//하루에 한번 좋아요를 할 수있게
	final String Insert_Temp = "Insert into temp_like values(#{id},now())";
	
	//좋아요 임시 테이블 아이디 체크
	final String Check_Temp_Like = "select count(*) from temp_like where id=#{id}";
	
	//좋아요 임시 테이블 삭제
	final String Del_Temp_Like = "delete from temp_like";
	
	//임시 좋아요 날짜 가져오기
	final String Get_Temp_Date = "select tmp_date from temp_like order by tmp_date DESC limit 1";
	//
	final String Get_Temp_Date_chk = "select count(tmp_date) from temp_like order by tmp_date DESC limit 1";
	//
	final String CURRENT_R_DEBATE="SELECT MAX(d_num) FROM rt_debate;";
	
	@Select(Get_Temp_Date_chk)
	int getTempDateChk();
	
	@Select(CURRENT_R_DEBATE)
	int getCurrentRDebate();
	
	
	@Select(DEFAULT_SCORE)
	int getDefultScore(String d_num);
	
	@Select(GROPE_SCORE)
	int getGroupScore(RTOpinion rtOpinion);
	
	@Select(Get_Rt_Reply)
	@Results(value = { 
			@Result(property = "group_num", column = "group_num"),
			@Result(property = "opinion_num", column = "opinion_num"),
			@Result(property = "id", column = "id"),
			@Result(property = "d_opinion", column = "d_opinion"),
			@Result(property = "opinion_date", column = "opinion_date"),
			@Result(property = "d_num", column = "d_num"),})
	ArrayList<RTOpinion> Get_Rt_Reply(@Param("d_num") String d_num);
	
	
	@Insert(Agree_Team)
	void Agree_Team(@Param("d_num") String d_num, @Param("id") String id);

	@Insert(Disagree_Team)
	void Disagree_Team(@Param("d_num") String d_num, @Param("id") String id);
	
	
	
	@Select(Agree_Team_Count)
	int Agree_Team_Count(@Param("d_num") String d_num);
	
	@Select(Disagree_Team_Count)
	int Disagree_Team_Count(@Param("d_num") String d_num);
	
	@Select(Real_Team_Check)
	int Real_Team_Check(@Param("id") String id);
	
	@Select(My_Group_Num)
	String My_Group_Num(@Param("id") String id);
	
	
	@Insert(Insert_Op)
	void Insert_Op(@Param("d_num") String d_num, @Param("id") String id,@Param("d_opinion") String d_opinion,@Param("group_num") String group_num);
	
	@Select(Real_Agree_Member)
	@Results(value = { 
			@Result(property = "id", column = "id"),
			@Result(property = "name", column = "name"),
			@Result(property = "opinion_num", column = "opinion_num"),})
	ArrayList<User> Real_Agree_Member(@Param("d_num") String d_num);
	
	@Select(Real_Disagree_Member)
	@Results(value = { 
			@Result(property = "id", column = "id"),
			@Result(property = "name", column = "name"),
			@Result(property = "opinion_num", column = "opinion_num"),})
	ArrayList<User> Real_Disagree_Member(@Param("d_num") String d_num);
	
	@Delete(Real_Team_Cancel)
	void Real_Team_Cancel(@Param("d_num") String d_num,@Param("id") String id,@Param("my_group_num") String my_group_num);
	
	
	@Update(Real_Like_Up)
	void Real_Like_Up(@Param("d_num") String d_num, @Param("id") String id,@Param("my_group_num") String my_group_num);
	
	@Select(Get_Score)
	int Get_Score(@Param("d_num") String d_num,@Param("group_num") String group_num);
	
	@Select(Get_Rt_Result)
	@Results(value = { 
			@Result(property = "d_num", column = "d_num"),
			@Result(property = "d_subject", column = "d_subject"),
			@Result(property = "best_mem", column = "best_mem"),
			@Result(property = "agree_score", column = "agree_score"),
			@Result(property = "disagree_score", column = "disagree_score"),
			@Result(property = "start_date", column = "start_date"),
			@Result(property = "end_date", column = "end_date"),})
	ArrayList<RTResult> Get_Rt_Result();

	@Select(Best_Debate_Mem)
	int Best_Debate_Mem(@Param("d_num") String d_num);
	
	@Select(Get_Best_Result)
	@Results(value = { 
			@Result(property = "d_num", column = "d_num"),
			@Result(property = "d_subject", column = "d_subject"),
			@Result(property = "best_mem", column = "best_mem"),
			@Result(property = "agree_score", column = "agree_score"),
			@Result(property = "disagree_score", column = "disagree_score"),
			@Result(property = "start_date", column = "start_date"),
			@Result(property = "end_date", column = "end_date"),})
	RTResult Get_Best_Result(@Param("d_num") String d_num);
	
	
	@Insert(Insert_Temp)
	void Insert_Temp(@Param("id") String id);

	@Select(Check_Temp_Like)
	int Check_Temp_Like(@Param("id") String id);
	
	@Delete(Del_Temp_Like)
	void Del_Temp_Like();
	
	
	@Select(Get_Temp_Date)
	@Results(value = { 
			@Result(property = "id", column = "id"),
			@Result(property = "tmp_date", column = "tmp_date"),})
	TempLike Get_Temp_Date();
	
	
	@Select(Get_Rt_subj)
	@Results(value = { 
			@Result(property = "d_subject", column = "d_subject"),
			@Result(property = "d_content", column = "d_content"),
			@Result(property = "d_date", column = "d_date"),})
	RTDebate Get_Rt_subj(@Param("d_num") String d_num);
	
	final String GET_MEMBER_ALL="SELECT id,name,email,school,club_num FROM MEMBER1";
	
	@Select(GET_MEMBER_ALL)
	ArrayList<User> getMemberAll(); 
	
	final String CLUB_ALL_DATA="SELECT * FROM club";
	
	@Select(CLUB_ALL_DATA)
	ArrayList<ClubData> getClubAllData();
	
	final String DELETE_MEMBER="DELETE FROM MEMBER1 WHERE ID=#{id}";
	
	@Delete(DELETE_MEMBER)
	void deleteMember(String id);
	
	final String CLUB_MEM_RESET="UPDATE MEMBER1 SET CLUB_NUM=0 WHERE CLUB_NUM=#{club_num}";
	final String CLUB_MEM_DEL="DELETE FROM club_mem WHERE CLUB_NUM=#{club_num} ";
	final String CLUB_DEL="DELETE FROM CLUB WHERE CLUB_NUM=#{club_num}";
	
	@Update(CLUB_MEM_RESET)
	void clubmemReset(String club_num);
	
	@Delete(CLUB_MEM_DEL)
	void clubMemDel(String club_num);
	
	@Delete(CLUB_DEL)
	void clubDel(String club_num);
	
	final String INSERT_NOTICE="insert into NoticeBoard(notice_subject, notice_content, notice_date) values(#{notice_subject},#{notice_content},now())";
	
	@Insert(INSERT_NOTICE)
	void insertNotice(@Param("notice_subject") String notice_subject, @Param("notice_content") String notice_content);
	
	final String NOTICE_DELETE="DELETE FROM NoticeBoard WHERE notice_board_num=#{notice_board_num}";
	
	@Delete(NOTICE_DELETE)
	void delNoticeBoard(String notice_board_num);
	
///// 관리자(실시간 토론)
	final String Insert_Rt_Debate = "Insert into rt_debate (d_subject,d_content,d_date) values (#{d_subject},#{d_content},now())";
	
	@Insert(Insert_Rt_Debate)
	void Insert_Rt_Debate(@Param("d_subject") String d_subject,@Param("d_content") String d_content);
	
	//관리자 (토론결과)
	final String Insert_Rt_Result = "insert into rt_result values (#{d_num},#{d_subject},#{best_mem},#{agree_score},#{disagree_score},#{start_date},#{end_date})";
	@Insert(Insert_Rt_Result)
	void Insert_Rt_Result(@Param("d_num") String d_num,@Param("d_subject") String d_subject,@Param("best_mem") String best_mem,
			@Param("agree_score") String agree_score,@Param("disagree_score") String disagree_score,
			@Param("start_date") String start_date,@Param("end_date") String end_date);
	

	final String Get_Maxdnum_Debate = "select max(d_num) from rt_debate";
	
	@Select(Get_Maxdnum_Debate)
	int Get_Maxdnum_Debate();
	
	
	
	
	final String Get_Maxdnum_Result = "select max(d_num) from rt_result";
	@Select(Get_Maxdnum_Result)
	int Get_Maxdnum_Result();
	
	//최다 응원을 받음 멤버 구하기
	final String Get_Best_Mem_Id = "select id from rt_opinion where d_num = #{d_num} order by opinion_num DESC limit 1";
	@Select(Get_Best_Mem_Id)
	String Get_Best_Mem_Id(@Param("d_num") String d_num);
	
	//최다 멤버 학교 구하기
	final String Get_Mem_School = "select school from MEMBER1 where id =#{id}";
	@Select(Get_Mem_School)
	String Get_Mem_School(@Param("id") String id);
	
	
	//최고의 토론
	final String Get_Debate_List = "select d_num,d_subject from rt_debate";
	@Select(Get_Debate_List)
	@Results(value = { 
			@Result(property = "d_subject", column = "d_subject"),
			@Result(property = "d_num", column = "d_num"),})
	ArrayList<RTResult> Get_Debate_List();
	
	final String Insert_Tmp_Best = "insert into tmp_best values (#{d_num},#{best_year},#{best_month})";
	@Insert(Insert_Tmp_Best)
	void Insert_Tmp_Best(@Param("d_num") String d_num,@Param("best_year") String best_year,@Param("best_month") String best_month);
	
	
	
	
	final String Get_Tmp_Best = "select * from tmp_best order by d_num DESC limit 1";
	
	@Select(Get_Tmp_Best)
	@Results(value = { 
			@Result(property = "best_month", column = "best_month"),
			@Result(property = "best_year", column = "best_year"),
			@Result(property = "d_num", column = "d_num"),})
	TmpBest Get_Tmp_Best();
	
	final String Total_Proposal = "SELECT count(1) FROM proposal";
	final String Proposal_List = "SELECT proposal_num, proposal_subject,id,proposal_date from proposal order by proposal_num desc LIMIT  #{start}, #{end}";
	final String Proposal_View = "SELECT * FROM proposal WHERE proposal_num=#{proposal_num}";
	
	////proposal
	@Select(Total_Proposal)
	int	total_proposal();
	
	
	@Select(Proposal_List)
	@Results(value={
			@Result(property="proposal_num", column="proposal_num"),
			@Result(property="proposal_subject", column="proposal_subject"),
			@Result(property="id", column="id"),
			@Result(property="proposal_date", column="proposal_date")
	})
	ArrayList<Proposal> getProposal_List(@Param("start") int start, @Param("end") int end);
	
	@Select(Proposal_View)
	@Results(value={
			@Result(property="proposal_num", column="proposal_num"),
			@Result(property="proposal_flag", column="proposal_flag"),
			@Result(property="proposal_subject", column="proposal_subject"),
			@Result(property="proposal_content", column="proposal_content"),
			@Result(property="id", column="id"),
			@Result(property="proposal_date", column="proposal_date")
	})
	Proposal getProposal_view(@Param("proposal_num") int proposal_num);
}
