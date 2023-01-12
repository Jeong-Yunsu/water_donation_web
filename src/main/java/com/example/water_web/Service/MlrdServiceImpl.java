package com.example.water_web.Service;

import com.example.water_web.Mapper.MlrdMapper;
import com.example.water_web.Vo.ComtVo;
import com.example.water_web.Vo.DonaVo;
import com.example.water_web.Vo.MlrdVo;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

@Service
@RequiredArgsConstructor
public class MlrdServiceImpl implements MlrdService {

    @Autowired
    private MlrdMapper dao;

    // 후기글 리스트 조회
    @Override
    public List<MlrdVo> viewMlrdList(int cntr_sn) throws Exception {
        return dao.viewMlrdList(cntr_sn);
    }

    // 기간 지난 기부글 조회 자세히 + 댓글
    @Override
    public List<MlrdVo> viewMlrd(int mlrd_sn) throws Exception {
        return dao.viewMlrd(mlrd_sn);
    }

    // 댓글 작성
    @Override
    public void comtRegist(ComtVo comt) throws Exception {
        int mbr_sn = comt.getMbr_sn();
        Date date = java.sql.Timestamp.valueOf(LocalDateTime.now());

        comt.setRgtr_id(mbr_sn);
        comt.setRgtr_dt(date);

        dao.comtRegist(comt);
    }

    // 댓글 리스트
    @Override
    public List<ComtVo> comtList(int mlrd_sn) throws Exception {
        return dao.comtList(mlrd_sn);
    }
}
