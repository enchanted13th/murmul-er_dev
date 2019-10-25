package com.murmuler.organicstack.controller;

import com.murmuler.organicstack.service.MemberService;
import com.murmuler.organicstack.service.ReportService;
import com.murmuler.organicstack.service.RoomService;
import com.murmuler.organicstack.vo.*;
import com.murmuler.organicstack.service.ReviewService;
import com.murmuler.organicstack.vo.MemberVO;
import com.murmuler.organicstack.vo.ReviewVO;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class AdminController {
    private Log logger = LogFactory.getLog(AdminController.class);
    @Autowired
    private MemberService memberService;

    @Autowired
    private ReportService reportService;

    @Autowired
    private RoomService roomService;

    @Autowired
    private ReviewService reviewService;

    @RequestMapping("")
    public String home(){
        return "admin/home";
    }

    @RequestMapping("/logout")
    public String logout(HttpServletRequest request){
        HttpSession session = request.getSession();
        session.invalidate();
        return "redirect:/";
    }

    @RequestMapping("/members")
    public ModelAndView showMemberList(){
        logger.info("called members method");
        List<MemberVO> list = memberService.getAllMembers();

        if( list == null ){
            logger.warn(String.format("list is null."));
        }

        ModelAndView mav = new ModelAndView();
        mav.setViewName("admin/members");
        mav.addObject("members", list);

        return mav;
    }

    @RequestMapping(value = "ban-rooms", method = RequestMethod.POST)
    public void banRooms(@RequestParam String ban_ids,
                         ServletResponse response) throws IOException {
        logger.info("called ban rooms method entered...");
        String[] ids = ban_ids.split(",");

        List<String> idList = new ArrayList<>();
        for(String id : ids)
            idList.add(id);
        Map<String, Object> idMap = new HashMap<>();
        idMap.put("ids", idList);
        int res = roomService.modifyMultiPostType(idMap);
        JSONObject obj = new JSONObject();
        if(res > 0)
            obj.put("result","SUCCESS");
        else
            obj.put("result","FAIL");
        response.setContentType("application/json; charset=utf-8");
        response.getWriter().print(obj);
    }

    @RequestMapping(value = "/deleteAll", method = RequestMethod.POST)
    public void deleteAll(@RequestParam String del_ids,
                          @RequestParam String fromWhere,
                          HttpServletResponse response) throws IOException {
        logger.info("called delete All method");
        String[] ids = del_ids.split(",");
        int res = 0;
        logger.info("fromWhere: "+ fromWhere);
        List<String> idList = new ArrayList<>();
        for(String id : ids)
            idList.add(id);

        Map<String, Object> idMap = new HashMap<>();
        idMap.put("ids", idList);

        switch (fromWhere){
            case "member":
                MemberVO delMember = new MemberVO();
                delMember.setIds(ids);
                res = memberService.removeMultiMember(delMember);
                break;
            case "report":
                res = reportService.removeMultiReport(idMap);
            case "review":
                res = reviewService.removeMultiReivew(idMap);
                break;
        }

        JSONObject obj = new JSONObject();
        if(res > 0)
            obj.put("result","SUCCESS");
        else
            obj.put("result","FAIL");
        response.setContentType("application/json; charset=utf-8");
        response.getWriter().print(obj);
    }

    @RequestMapping("/report")
    public ModelAndView showReportList(){
        logger.info("called report list method entered....");
        List<ReportViewVO> list = reportService.getAllReports();
        ModelAndView mav = new ModelAndView();

        if( list == null ){
            logger.warn(String.format("list is null."));
            mav.setViewName("admin/home");
        }
        else {
            mav.setViewName("admin/reports");
            mav.addObject("reports", list);
        }

        return mav;
    }

    @RequestMapping("/reviews")
    public ModelAndView showReviewList(){
        List<ReviewVO> list = reviewService.getAllReviewList();

        if( list == null ){
            logger.warn(String.format("list is null."));
        }

        ModelAndView mav = new ModelAndView();
        mav.setViewName("admin/reviews");
        mav.addObject("reviews", list);

        return mav;
    }
}
