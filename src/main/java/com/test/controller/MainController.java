package com.test.controller;


import java.util.List;

import com.test.service.SmartCarService;
import com.test.vo.SymptomInfoVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
    @Autowired SmartCarService service;

    @GetMapping("/")
    public String getMain(Model model){
        Double speed_abnormal_rate = service.getSymptomRate("speed");
        Double break_abnormal_rate = service.getSymptomRate("break");
        Double steer_abnormal_rate = service.getSymptomRate("steer");

        System.out.println(speed_abnormal_rate);
        System.out.println(break_abnormal_rate);
        System.out.println(steer_abnormal_rate);

        model.addAttribute("spd_abn_rate", speed_abnormal_rate);
        model.addAttribute("brk_abn_rate", break_abnormal_rate);
        model.addAttribute("str_abn_rate", steer_abnormal_rate);

        Integer spd_abn_cnt = service.getAbnormalCount("speed");
        Integer brk_abn_cnt = service.getAbnormalCount("break");
        Integer str_abn_cnt = service.getAbnormalCount("steer");

        model.addAttribute("spd_abn_cnt", spd_abn_cnt);
        model.addAttribute("brk_abn_cnt", brk_abn_cnt);
        model.addAttribute("str_abn_cnt", str_abn_cnt);

        Integer cntAll = service.getSymptomCountAll();
        model.addAttribute("cntAll", cntAll);

        List<SymptomInfoVO> list = service.selectSmartCarSymptomInfo();
        model.addAttribute("list", list);

        return "/index";
    }
}
