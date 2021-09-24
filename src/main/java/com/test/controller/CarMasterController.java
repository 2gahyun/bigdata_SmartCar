package com.test.controller;

import java.util.List;

import com.test.mapper.CarMasterMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CarMasterController {
    @Autowired CarMasterMapper mapper;

    @GetMapping("/car/master")
    public String getCarMaster(Model model){
        List<String> regions = mapper.selectRegions();
        model.addAttribute("regions", regions);
        return "/car/master";
    }
}
