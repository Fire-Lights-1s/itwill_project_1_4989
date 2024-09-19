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
	
	public int getReport_id() {
		return report_id;
	}
	public void setReport_id(int report_id) {
		this.report_id = report_id;
	}
	public String getReporter_id() {
		return reporter_id;
	}
	public void setReporter_id(String reporter_id) {
		this.reporter_id = reporter_id;
	}
	public String getReportee_id() {
		return reportee_id;
	}
	public void setReportee_id(String reportee_id) {
		this.reportee_id = reportee_id;
	}
	public int getReported_item_id() {
		return reported_item_id;
	}
	public void setReported_item_id(int reported_item_id) {
		this.reported_item_id = reported_item_id;
	}
	public String getReport_type() {
		return report_type;
	}
	public void setReport_type(String report_type) {
		this.report_type = report_type;
	}
	public String getReport_contents() {
		return report_contents;
	}
	public void setReport_contents(String report_contents) {
		this.report_contents = report_contents;
	}
	public Timestamp getReported_at() {
		return reported_at;
	}
	public void setReported_at(Timestamp reported_at) {
		this.reported_at = reported_at;
	}
	public String getReport_status() {
		return report_status;
	}
	public void setReport_status(String report_status) {
		this.report_status = report_status;
	}
	
	
}
