package com.test.service;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.test.mapper.DriveInfoMapper;
import com.test.vo.DriveInfoVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DriveInfoService {
    @Autowired DriveInfoMapper mapper;

    public Map<String, Object> getDriveInfo(){
        // 각각 리스트로 따로 분해해서 저장할 것이기 때문에 Map을 사용 / 장점 - DB에 호출빈도를 줄여줌
        Map<String, Object> resultMap = new LinkedHashMap<String, Object>();
        List<DriveInfoVO> list = mapper.selectDriveInfo();

        List<String> car_number_list = new ArrayList<String>();
        List<Integer> age_list = new ArrayList<Integer>();
        List<Double> spd_pedal_list = new ArrayList<Double>();
        List<Double> brk_pedal_list = new ArrayList<Double>();
        List<Double> spd_list = new ArrayList<Double>();

        for(DriveInfoVO vo : list) {
            // 따로 변수를 만들지않고 0부터 vo에 차례대로 데이터를 저장
            car_number_list.add(vo.getCar_number());
            age_list.add(vo.getAge());
            spd_pedal_list.add(vo.getSpeed_pedal());
            brk_pedal_list.add(vo.getBreak_pedal());
            spd_list.add(vo.getSpeed());
        }
        resultMap.put("count", list.size());
        resultMap.put("car_number_list", car_number_list);
        resultMap.put("age_list", age_list);
        resultMap.put("spd_pedal_list", spd_pedal_list);
        resultMap.put("brk_pedal_list", brk_pedal_list);
        resultMap.put("spd_list", spd_list);
        
        return resultMap;
    }
}
