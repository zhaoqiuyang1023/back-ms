package com.back.ms.mapper;

import com.back.ms.entity.vo.ReportRecord;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 报表统计数据记录到表
 *
 * @author Jadin
 * @since 2019-04-17
 */
@Component
public interface ReportDao {
    public void addReportRecord(@Param("reportName") String reportName,
                                @Param("timeSeries") String timeSeries,
                                @Param("count") Integer count,
                                @Param("beginTime") Date beginTime,
                                @Param("endTime") Date endTime);

    public List<ReportRecord> findReportRecord(@Param("reportName") String reportName,
                                               @Param("searchBegin") Date beginTime,
                                               @Param("searchEnd") Date endTime);

    public List<Map> findReportChart(@Param("reportName") String reportName,
                                     @Param("searchBegin") Date beginTime,
                                     @Param("searchEnd") Date endTime);
}
