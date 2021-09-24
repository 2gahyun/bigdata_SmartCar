package com.test.mapper;

import java.util.List;

import com.test.vo.DriveInfoVO;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DriveInfoMapper {
    public List<DriveInfoVO> selectDriveInfo();
}
