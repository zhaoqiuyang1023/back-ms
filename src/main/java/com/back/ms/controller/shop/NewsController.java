package com.back.ms.controller.shop;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.back.ms.entity.ao.NewsSummaryAO;
import com.back.ms.entity.news.News;
import com.back.ms.entity.news.NewsSetting;
import com.back.ms.service.NewsService;
import com.back.ms.service.NewsSettingService;
import com.back.ms.util.LayerData;
import com.back.ms.util.RestResponse;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import io.swagger.annotations.ApiOperation;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;


@CrossOrigin
@Controller
@RequestMapping("/news")
public class NewsController {

    @Autowired
    private NewsService newsService;

    @Autowired
    private NewsSettingService newsSettingService;




    @GetMapping("/list")
    public String list(Model model) {
        model.addAttribute("newsTypes", newsSettingService.selectList(new EntityWrapper<NewsSetting>().eq("name", "newsTypes")));
        return "news/list";
    }

    @PostMapping("/list")
    @ResponseBody
    public LayerData<News> list(NewsSummaryAO newsSummaryAO) {
        System.out.println(newsSummaryAO);
        Page<News> pageD = newsService.findNewsByPage(newsSummaryAO);
        LayerData<News> layerData = new LayerData<>();
        List<News> newsSettings = pageD.getRecords();
        layerData.setData(newsSettings);
        layerData.setCount(pageD.getTotal());
        System.out.println(JSON.toJSONString(layerData));
        return layerData;
    }

    /**
     * get single info
     * @return R
     */
    @ApiOperation(value = "根据新闻标题模糊查询", notes = "根据新闻标题模糊查询上架已经发布的新闻")
    @PostMapping("/del/{downId}")
    @ResponseBody
    public RestResponse down(@PathVariable("downId") String downId) {
        News news = newsService.selectById(downId);
        news.setShelve(Boolean.FALSE);
        news.setPublished(Boolean.FALSE);
        System.out.println(downId);
        return newsService.deleteNewsById(downId) ? RestResponse.success() : RestResponse.failure("删除失败!");
    }


    /**
     * get single info//首页
     *
     * @param id
     * @return R
     */
    @ApiOperation(value = "根据新闻id", notes = "根据新闻id查询")
    @GetMapping("/edit/{id}")
    public String findNewsById(@PathVariable("id") String id,Model model) {
        News news = newsService.selectById(id);
        NewsSetting selfset=newsSettingService.selectOne(new EntityWrapper<NewsSetting>().eq("id", news.getType()));
        model.addAttribute("selfset",selfset);
        model.addAttribute("news",news);
        model.addAttribute("newsTypes", newsSettingService.selectList(new EntityWrapper<NewsSetting>().eq("name", "newsTypes")));

        List<String> aa=JSONArray.parseArray(news.getKeyWords(),String.class);
        model.addAttribute("keywords",aa );
        return "news/update";
    }

    @ApiOperation(value = "根据新闻id", notes = "根据新闻id查询")
    @GetMapping("/add")
    public String add(Model model) {
        model.addAttribute("newsTypes", newsSettingService.selectList(new EntityWrapper<NewsSetting>().eq("name", "newsTypes")));
        return "news/add";
    }


    /**
     * save
     *
     * @param newsObject
     * @return R
     */
    @ApiOperation(value = "保存新闻", notes = "保存新闻")
    @PostMapping("/save")
    @ResponseBody
    public RestResponse save(@RequestBody JSONObject newsObject) {
        News news = JSON.parseObject(newsObject.toJSONString(), News.class);
        news.setDateUpdate(new Date());
        if(StringUtils.isEmpty(news.getId())){
            news.setDateCreate(new Date());
            System.out.println(new Date());
        }
        return newsService.insertOrUpdate(news)?RestResponse.success() : RestResponse.failure("保存失败!");
    }





}
