package kr.ac.kopo.report.service;

import java.io.IOException;

import kr.ac.kopo.report.vo.ReportVO;

public interface ReportService {
	
	//월간 금융리포트 생성
	public void monthlyReportCreate() throws IOException;
	
	
	//월간 금융리포트 발송
	public void monthlyReportExecute(ReportVO reportMember);
	
	

}
