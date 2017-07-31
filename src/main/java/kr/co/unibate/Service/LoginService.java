package kr.co.unibate.Service;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Component;

import kr.co.unibate.bean.ClubData;
import kr.co.unibate.bean.User;
import kr.co.unibate.mapper.UnibateMapper;

@Component
public class LoginService {
	
	@Autowired
	private UnibateMapper boardMapper;

	
	////////////////////////////////////////////////////
	public String find_id(String email,String name){
		String find_id=this.boardMapper.find_id(email, name);
		
		return find_id;
	}
	
	public String find_pwd(String id, String email, String name){ 
		String find_pwd=this.boardMapper.find_pwd(id,email,name);
		
		return find_pwd;
	}
	
 
	public void insertMember(User user){
		boardMapper.insertMember(user);
	}
	////////////////////////로그인 체크 
	public String login(String id){
		String chk_pwd = boardMapper.login(id);
		return chk_pwd;
	}
	

	/////////////////////회원가입 아이디 중복 체크
	public String id_check(String id){
		String id_check =boardMapper.id_check(id);	
		return id_check;
	}
	//////
	public User callInfo(String id){
		User user=this.boardMapper.callInfo(id);
		
		return user;
	}
	
	public void infoModify(User user){
		this.boardMapper.infoModify(user);
	}
	
	public ArrayList<User> getMemberAll(){
		return this.boardMapper.getMemberAll();
	}
	
	public ArrayList<ClubData> getClubAllData(){
		return this.boardMapper.getClubAllData();
	}
	
	public void deleteMember(String id){
		this.boardMapper.deleteMember(id);
	}
	
	public void clubmemReset(String club_num){
		this.boardMapper.clubmemReset(club_num);
	}
	
	public void clubMemDel(String club_num){
		this.boardMapper.clubMemDel(club_num);
	}
	
	public void clubDel(String club_num){
		this.boardMapper.clubDel(club_num);
	}
	public void insertNotice(String notice_subject, String notice_content){
		this.boardMapper.insertNotice(notice_subject, notice_content);
	}
	
	public void delNoticeBoard(String notice_board_num){
		this.boardMapper.delNoticeBoard(notice_board_num);
	}
}