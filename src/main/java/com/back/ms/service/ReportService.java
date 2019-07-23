package com.back.ms.service;

import com.back.ms.entity.vo.ReportRecord;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 报表图表
 * </p>
 *
 * @author jadin
 * @since 2019-04-17
 */
public interface ReportService {

    public void addReportRecord(String reportName, String timeSeries, Integer count, Date beginTime, Date endTime);

    public List<ReportRecord> findReportRecord(String reportName, Date beginTime, Date endTime);

    public List<Map> findReportChart(String reportName, Date beginTime, Date endTime);
}
