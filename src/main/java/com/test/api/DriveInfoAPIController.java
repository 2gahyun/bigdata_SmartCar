package com.test.api;

import java.util.LinkedHashMap;
import java.util.Map;

import com.test.service.DriveInfoService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class DriveInfoAPIController {
    @Autowired DriveInfoService service;

    @GetMapping("/drive/info")
    public Map<String, Object> getDriveInfo(){
        Map<String, Object> resultMap = new LinkedHashMap<String, Object>();
        resultMap.put("status", true);
        resultMap.put("data", service.getDriveInfo());
        return resultMap;
    }
}
