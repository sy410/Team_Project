package vo;

import lombok.Data;

@Data
public class QnaVO {
	private int bqno;
	private String bqpw;
	private String id;
	private String bqtitle;
	private String bqcontent;
	private String bqdate;
	private int root;
	private int step;
	private int indent;

} //class
