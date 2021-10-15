package vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class NoticeVO {
	private int bfno;
	private String id;
	private String bftitle;
	private String bfcontent;
	private String bffile;
	private MultipartFile uploadfile;
	private String bfdate;
	private int bfcnt;
	
} //class
