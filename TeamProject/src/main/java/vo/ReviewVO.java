package vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ReviewVO {
	private int brno;
	private String id;
	private String brtitle;
	private String brcontent;
	private String brdate;
	private int brcnt;
	private String brfile;
	private MultipartFile uploadfilef;
	private int brating;
	private String brcity;
	private int cno;
	private int root;
	private int step;
	private int indent;
	
} //class
