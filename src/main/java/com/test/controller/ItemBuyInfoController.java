package com.test.controller;

import java.util.List;

import com.test.mapper.ItemBuyInfoMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ItemBuyInfoController {
    @Autowired ItemBuyInfoMapper mapper;

    @GetMapping("/item")
    public String getItem(Model model){
        List<String> rankList = mapper.selectItemRank();
        model.addAttribute("rankList", rankList);

        return "/item/view";
    }
}
