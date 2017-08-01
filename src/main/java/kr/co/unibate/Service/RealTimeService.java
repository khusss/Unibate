package kr.co.unibate.Service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.unibate.bean.RTDebate;
import kr.co.unibate.bean.RTOpinion;
import kr.co.unibate.bean.RTResult;
import kr.co.unibate.bean.TempLike;
import kr.co.unibate.bean.TmpBest;
import kr.co.unibate.bean.User;
import kr.co.unibate.mapper.UnibateMapper;

@Component
public class RealTimeService {

	@Autowired
	private UnibateMapper boardMapper;
	
	public RTDebate Get_Rt_subj(String d_num){
		
		return this.boardMapper.Get_Rt_subj(d_num);
	}
	public ArrayList<RTOpinion> Get_Rt_Reply(String d_num){
		
		return this.boardMapper.Get_Rt_Reply(d_num);
	}
	
	public void Agree_Team(String d_num,String id) {
		boardMapper.Agree_Team(d_num,id);
	}
	public void Disagree_Team(String d_num,String id) {
		boardMapper.Disagree_Team(d_num,id);
	}
	public int Agree_Team_Count(String d_num){
		return this.boardMapper.Agree_Team_Count(d_num);
	}
	public int Disagree_Team_Count(String d_num){
		return this.boardMapper.Disagree_Team_Count(d_num);
	}
	
	public int Real_Team_Check(String id){
		return this.boardMapper.Real_Team_Check(id);
	}
	
	public String My_Group_Num(String id){
		return this.boardMapper.My_Group_Num(id);
	}
	public void Insert_Op(String d_num,String id,String d_opinion,String group_num) {
		boardMapper.Insert_Op(d_num,id,d_opinion,group_num);
	}
	
	public ArrayList<User> Real_Agree_Member(String d_num){
		return this.boardMapper.Real_Agree_Member(d_num);
	}
	public ArrayList<User> Real_Disagree_Member(String d_num){
		return this.boardMapper.Real_Disagree_Member(d_num);
	}
	
	public void Real_Team_Cancel(String d_num,String id,String my_group_num) {
		boardMapper.Real_Team_Cancel(d_num,id,my_group_num);
	}
	
	public void Real_Like_Up(String d_num,String id,String my_group_num) {
		boardMapper.Real_Like_Up(d_num,id,my_group_num);
	}
	public int Get_Score(String d_num,String group_num){
		return this.boardMapper.Get_Score(d_num,group_num);
	}
	public ArrayList<RTResult> Get_Rt_Result(){
		return this.boardMapper.Get_Rt_Result();
	}
	public int Best_Debate_Mem(String d_num){
		return this.boardMapper.Best_Debate_Mem(d_num);
	}
	
	public RTResult Get_Best_Result(String d_num){
		return this.boardMapper.Get_Best_Result(d_num);
	}
	
	
	public void Insert_Temp(String id) {
		boardMapper.Insert_Temp(id);
	}
	
	public int Check_Temp_Like(String id) {
		return this.boardMapper.Check_Temp_Like(id);
	}
	
	public void Del_Temp_Like() {
		boardMapper.Del_Temp_Like();
	}
	public TempLike Get_Temp_Date() {
		return this.boardMapper.Get_Temp_Date();
	}
	
	public int getTempDateChk(){
		return this.boardMapper.getTempDateChk();
	}
	
	public int getDefultScore(String d_num){
		return this.boardMapper.getDefultScore(d_num);
	}
	
	public int getCurrentRDebate(){
		return this.boardMapper.getCurrentRDebate();
	}
	
	public int getGroupScore(RTOpinion rtOpinion){
		return this.boardMapper.getGroupScore(rtOpinion);
	}
	public void Insert_Rt_Debate(String d_subject,String d_content) {

		boardMapper.Insert_Rt_Debate(d_subject,d_content);
	}
	public void Insert_Rt_Result(String d_num,String d_subject,String best_mem,String agree_score, String disagree_score,
			String start_date,String end_date) {

		boardMapper.Insert_Rt_Result(d_num,d_subject,best_mem,agree_score,disagree_score,start_date,end_date);
	}
	public int Get_Maxdnum_Debate() {
		
		return this.boardMapper.Get_Maxdnum_Debate();
	}
	public int Get_Maxdnum_Result() {
		return this.boardMapper.Get_Maxdnum_Result();
	}
	public String Get_Best_Mem_Id(String d_num) {
		return this.boardMapper.Get_Best_Mem_Id(d_num);
	}
	public String Get_Mem_School(String id) {
		return this.boardMapper.Get_Mem_School(id);
	}
	
	public ArrayList<RTResult> Get_Debate_List() {
		return this.boardMapper.Get_Debate_List();
	}
	public void Insert_Tmp_Best(String d_num,String best_month,String best_year) {
		this.boardMapper.Insert_Tmp_Best(d_num,best_month,best_year);
	}
	public TmpBest Get_Tmp_Best() {
		return this.boardMapper.Get_Tmp_Best();
	}
}