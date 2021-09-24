package com.test.service;

import java.util.List;

import com.test.mapper.SmartCarMapper;
import com.test.vo.SymptomInfoVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SmartCarService {
    @Autowired SmartCarMapper mapper;
    public List<SymptomInfoVO> selectSmartCarSymptomInfo() {
        return mapper.selectSmartCarSymptomInfo();
    }

    public Double getSymptomRate(String col){
        Integer symptom_cnt = mapper.selectAbnormalCount(col);
        Integer cnt_all = mapper.selectSmartCarSymptomCount();
        Double rate = (double)symptom_cnt / cnt_all;
        return rate * 100;
    }
    public Integer getAbnormalCount(String col){
        return mapper.selectAbnormalCount(col);
    }
    public Integer getSymptomCountAll(){
        return mapper.selectSmartCarSymptomCount();
    }
}
