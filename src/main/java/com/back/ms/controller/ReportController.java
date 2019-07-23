package com.back.ms.controller;

import com.back.ms.service.ReportService;
import com.back.ms.util.RestResponse;
import com.xiaoleilu.hutool.date.DateUtil;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.*;

/**
 * <p>
 * 报表
 * </p>
 *
 * @author Jadin
 * @since 2019-04-18
 */
@Controller
@RequestMapping("/admin/report")
public class ReportController {
    private static final Logger LOGGER = LoggerFactory.getLogger(ReportController.class);

    private static final String DATE_FORMAT = "yyyy-MM-dd";

    @Autowired
    private ReportService reportService;


    @RequiresPermissions("admin:report:chart")
    @GetMapping("chart")
    public String list() {
        return "/admin/report/chart";
    }

    @RequiresPermissions("admin:report:chart")
    @GetMapping("list")
    @ResponseBody
    public RestResponse findReportRecord(@RequestParam(value = "reportName") String reportName,
                                         @RequestParam(value = "beginDate", required = false) String beginDate,
                                         @RequestParam(value = "endDate", required = false) String endDate) {
        Date today = DateUtil.beginOfDay(new Date());
        Date begin, end;
        if (StringUtils.isNotBlank(beginDate)) {
            begin = DateUtil.parse(beginDate, DATE_FORMAT);
        } else {
            begin = DateUtil.offsetDay(today, -30);
        }
        if (StringUtils.isNotBlank(endDate)) {
            end = DateUtil.parse(endDate, DATE_FORMAT);
        } else {
            end = today;
        }
        List<Map> list = reportService.findReportChart(reportName, begin, end);
        List timeList = new ArrayList(list.size());
        List countList = new ArrayList(list.size());
        for (Map map : list) {
            timeList.add(map.get("time"));
            countList.add(map.get("count"));
        }
        Map data = new HashMap();
        data.put("timeList", timeList);
        data.put("countList", countList);
        return RestResponse.success().setData(data);
    }


}