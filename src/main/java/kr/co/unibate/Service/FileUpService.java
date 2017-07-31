package kr.co.unibate.Service;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.Iterator;
import java.util.StringTokenizer;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Service
public class FileUpService {
	
	public static String fileUpload(MultipartHttpServletRequest mRequest, String path) {
		String saveFileName="";
		String uploadPath = mRequest.getSession().getServletContext().getRealPath(path);
		System.out.println();
		
		File dir = new File(uploadPath);
		System.out.println(dir);
		
		if (!dir.isDirectory()) {
			dir.mkdirs();
		}
		
		Iterator<String> iter = mRequest.getFileNames();
		while(iter.hasNext()) {
			String uploadFileName = iter.next();
			
			MultipartFile mFile = mRequest.getFile(uploadFileName);
			String originalFileName = mFile.getOriginalFilename();
			saveFileName = originalFileName;
			StringTokenizer st;
			
			if(saveFileName != null && !saveFileName.equals("")) {
				if(new File(uploadPath + saveFileName).exists()) {
					System.out.println(saveFileName);
					st=new StringTokenizer(saveFileName, ".");
					
					saveFileName=st.nextToken()+"_"+System.currentTimeMillis()+"."+st.nextToken();
					System.out.println(saveFileName);
				}
				
				try {
					mFile.transferTo(new File(uploadPath + saveFileName));
									
				} catch (IllegalStateException e) {
					e.printStackTrace();

				} catch (IOException e) {
					e.printStackTrace();

				}
			} // if end
		} // while end
		return saveFileName;
	}

}
