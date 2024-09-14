package com.itwillbs.domain;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReportDTO {
	private int report_id;
	private String reporter_id;
	private String reportee_id;
	private int reported_item_id;
	private String report_type;
	private String report_contents;
	private Timestamp reported_at;
	private String report_status;
	
	
}
