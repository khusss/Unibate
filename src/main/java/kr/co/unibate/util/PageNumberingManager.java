package kr.co.unibate.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class PageNumberingManager {
	
	/*kr.co.unibate.util 디랙토리 생성후 사용해주세요.
	 getInstance로 반환하는 형태입니다.
	 
	PageNumberingManager pageNumberingManager = PageNumberingManager.getInstance();
	
	이런 형태로 Controller에 추가후 사용해 주세요.
	*/
	private static final PageNumberingManager pageNumberingManager=new PageNumberingManager();
	
	private static final Logger logger=LoggerFactory.getLogger(PageNumberingManager.class);
	
	private PageNumberingManager() {}
	
	public static PageNumberingManager getInstance(){
		return pageNumberingManager;
	}
	
	public int getTotalPage(int total_cnt, int rowsPerPage){
		
		logger.info("getTotalPage Called!!!");
		
		int total_pages=0;
		if((total_cnt%rowsPerPage)==0){
			total_pages=total_cnt/rowsPerPage;
		}else{
			total_pages=total_cnt/rowsPerPage+1;
		}
		
		logger.info("getTotalPage return total_pages="+total_pages);
		
		return total_pages;
	}
	
	public int getPageBlock(int curPage,int pagePerBlock){
		
		int block=0;
		
		if((curPage%pagePerBlock)==0){
			block=curPage/pagePerBlock;
		}else{
			block=curPage/pagePerBlock+1;
		}
		
		return block;
	}
	
	public int getFirstpageInBlock(int block, int pagePerBlock){
		return ((block-1)*pagePerBlock+1);
	}
	
	public int getLastPageInBlock(int block, int pagePerBlock){
		return (block*pagePerBlock);
	}
}
