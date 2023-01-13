package com.example.water_web.Mapper;

import com.example.water_web.Vo.DonaVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MapMapper {

    // 위도 경도
    List<DonaVo> latlng(DonaVo vo) throws Exception;
}
