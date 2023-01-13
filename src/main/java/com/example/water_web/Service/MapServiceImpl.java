package com.example.water_web.Service;

import com.example.water_web.Mapper.MapMapper;
import com.example.water_web.Vo.DonaVo;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class MapServiceImpl implements MapService {

    @Autowired
    private MapMapper dao;

    // 기부 조회
    @Override
    public List<DonaVo> latlng(DonaVo vo) throws Exception {
        return dao.latlng(vo);
    }
}
