package com.test.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ItemBuyInfoMapper {
    public List<String> selectItemRank();
    public Integer selectItemBuyCountByGen(String gen, String item);
    public List<Integer> selectItemCntGrpBygen(String item);
    public List<Integer> selectItemBuyCountAgeList(String item);
    public Double selectItemAvgScore(String item);
    public Integer selectItemBuyCountByRegion(String region, String item);
}
