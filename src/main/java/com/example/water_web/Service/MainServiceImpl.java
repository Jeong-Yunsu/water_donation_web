package com.example.water_web.Service;

import com.example.water_web.Mapper.MainMapper;
import com.example.water_web.Vo.DonaVo;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class MainServiceImpl implements MainService {

    @Autowired
    private MainMapper dao;

    @Override
    public List<DonaVo> main1(DonaVo vo) throws Exception {
        return dao.main1(vo);
    }

    @Override
    public List<DonaVo> main2(DonaVo vo) throws Exception {
        return dao.main2(vo);
    }

    @Override
    public List<DonaVo> main3(DonaVo vo) throws Exception {
        return dao.main3(vo);
    }
}
