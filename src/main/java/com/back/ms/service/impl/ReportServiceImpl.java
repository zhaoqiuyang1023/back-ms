package com.back.ms.service.impl;

import com.back.ms.mapper.ReportDao;
import com.back.ms.entity.vo.ReportRecord;
import com.back.ms.service.ReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * <p>
 *
 * </p>
 *
 * @author Jadin
 * @since 2019-04-18
 */
@Service
public class ReportServiceImpl implements ReportService {
    @Autowired
    protected ReportDao reportDao;

    @Override
    public void addReportRecord(String reportName, String timeSeries, Integer count, Date beginTime, Date endTime) {
        reportDao.addReportRecord(reportName, timeSeries, count, beginTime, endTime);
    }

    @Override
    public List<ReportRecord> findReportRecord(String reportName, Date beginTime, Date endTime) {
        return reportDao.findReportRecord(reportName, beginTime,endTime);
    }

    @Override
    public List<Map> findReportChart(String reportName, Date beginTime, Date endTime){
        return reportDao.findReportChart(reportName, beginTime,endTime);
    }
}
