package com.test.mapper;

import java.util.List;

import com.test.vo.SymptomInfoVO;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SmartCarMapper {
    public List<SymptomInfoVO> selectSmartCarSymptomInfo();
    public Integer selectSmartCarSymptomCount();
    public Integer selectAbnormalCount(String col);
}
