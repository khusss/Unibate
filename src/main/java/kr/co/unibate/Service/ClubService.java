package kr.co.unibate.Service;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.unibate.bean.ClubData;
import kr.co.unibate.bean.RecruitingBoard;
import kr.co.unibate.mapper.UnibateMapper;

@Component
public class ClubService {
	
	@Autowired
	private UnibateMapper comunityMapper;
	
	
	public void insertClub(ClubData clubData){
		this.comunityMapper.insertClub(clubData);
	}
	
	public int overlapCheck(String id){
		int check = this.comunityMapper.overlapCheck(id);
		
		return check;
	}
	
	public int clubNameCheck(String club_name){
		int check = this.comunityMapper.clubNameCheck(club_name);
		
		return check;
	}
	
	public ClubData clubMakeUser(String id){
		ClubData clubData;
		
		clubData=this.comunityMapper.clubMakeUser(id);
		
		return clubData;
	}
	
	public void insertCMemDB(ClubData clubData){
		this.comunityMapper.insertCMemDB(clubData);
	}
	
	public ArrayList<ClubData> getClubBoard(int start, int end){
		ArrayList<ClubData> clubData;
		
		clubData=this.comunityMapper.getClubBoard(start, end);
		
		return clubData;
	}
	
	public int getClubAll(){
		int clubAll;
		
		clubAll=this.comunityMapper.getClubAll();
		
		return clubAll;
	}
	
	public ArrayList<RecruitingBoard> getRecruitBoard(int start, int end){
		ArrayList<RecruitingBoard> recruitingBoard;
		
		recruitingBoard = this.comunityMapper.getRecruitBoard(start, end);
		
		return recruitingBoard;
	}
	
	public RecruitingBoard getRecruit(int recruit_board_num){
		
		RecruitingBoard recruitingBoard;
		
		recruitingBoard=this.comunityMapper.getRecruit(recruit_board_num);
		
		return recruitingBoard;
	}
	
	public void Recruitsup(int recruit_board_num){
		this.comunityMapper.Recruitsup(recruit_board_num);
	}
	
	public int RecruitAll(){
		
		int RecruitAll;
		
		RecruitAll=this.comunityMapper.RecruitAll();
		
		return RecruitAll;
	}
	
	public void insertRecruit(RecruitingBoard RecruitingBoard){
		
		this.comunityMapper.insertRecruit(RecruitingBoard);
	}
	
	public void deleteRecruit(int recruit_board_num){
		this.comunityMapper.deleteRecruit(recruit_board_num);
	}
	
	public int getMemCount(int club_num){
		
		int result = this.comunityMapper.getMemCount(club_num);
		
		return result;
	}
	
	public void upMemNum(int club_mem, int club_num){
		this.comunityMapper.upMemNum(club_mem, club_num);
	}
	
	public void upMemberClub(String id){
		this.comunityMapper.upMemberClub(id);
	}
	
	public void clubMemIn(ClubData clubData){
		this.comunityMapper.clubMemIn(clubData);
	}
	
	public int clubJoinCheck(String id){
		return this.comunityMapper.clubJoinCheck(id);
	}
	
	public int getClubNum(String club_name){
		return this.comunityMapper.getClubNum(club_name);
	}
	
	public void clubMemUp(int club_num){
		this.comunityMapper.clubMemUp(club_num);
	}
	
	public void clubNumReset(String id){
		this.comunityMapper.clubNumReset(id);
	}
	
	public void secessionClub(String id){
		this.comunityMapper.secessionClub(id);
	}
	
	public int getClubFlag(String id){
		return this.comunityMapper.getClubFlag(id);
	}
	
	public void appointmentManager(ClubData clubData){
		this.comunityMapper.appointmentManager(clubData);
	}
	
	public void deleteMem(String id){
		this.comunityMapper.deleteMem(id);
	}
	
	public void Commit(){
		this.comunityMapper.Commit();
	}
}
