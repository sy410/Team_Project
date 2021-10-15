package vo;

import java.util.List;

import lombok.Data;

@Data
public class PmemberVO {
	private String id;
	private String pw;
	private String name;
	private String birth;
	private String tel;
	private String email;
	private String postcode;
	private String addr;
	private String detailAddr;
 	
	//private List<NoticeVO> nlist;
}
