package com.test.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CarMasterMapper {
    public List<Integer> selectAgesCount();
    public List<Integer> selectAgesCountByRegion(String region);
    public List<String> selectRegions();
    public List<Integer> selectCarYearCount();
    public List<Integer> selectCarYearCountByRegion(String region);
}
