package vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ReviewVO {
	private int brno;
	private String id;
	private String brcity;
	private String brtitle;
	private String brcontent;
	private String brfile;
	private MultipartFile uploadfilef;
	private int brating;
	//private int cno;
	private String brdate;
	private int brcnt;
	private int root;
	private int step;
	private int indent;
	
} //class
