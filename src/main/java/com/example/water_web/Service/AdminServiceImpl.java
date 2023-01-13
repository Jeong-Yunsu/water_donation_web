package com.example.water_web.Service;

import com.example.water_web.Mapper.AdminMapper;
import com.example.water_web.Mapper.DonaMapper;
import com.example.water_web.Vo.CtgryVo;
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
public class AdminServiceImpl implements AdminService{

    @Autowired
    private AdminMapper dao;

    // 카테고리
    @Override
    public List<CtgryVo> ctgry() throws Exception {
        return dao.ctgry();
    }

    // 기부 등록
    @Override
    public void register(DonaVo vo) throws Exception {
        int cntr_sn = vo.getCntr_sn();
        Date date = java.sql.Timestamp.valueOf(LocalDateTime.now());

        vo.setRgtr_id(cntr_sn);
        vo.setRgtr_dt(date);
        vo.setCntr_str_dt(LocalDate.now());

        dao.register(vo);
    }

    // 기부 목록
    @Override
    public List<DonaVo> donaslist() throws Exception {
        return dao.donaslist();
    }

    // 기부 조회
    @Override
    public DonaVo donasView(int cntr_sn) throws Exception {
        return dao.donasView(cntr_sn);
    }

    // 기부 수정
    @Override
    public void donasModify(DonaVo vo) throws Exception {
        dao.donasModify(vo);
    }

    // 기부 삭제
    @Override
    public void donasDelete(int cntr_sn) {
        dao.donasDelete(cntr_sn);
    }

    // 소통 등록
    @Override
    public void mlrdRegister(MlrdVo vo) throws Exception {
        int cntr_sn = vo.getCntr_sn();
        Date date = java.sql.Timestamp.valueOf(LocalDateTime.now());

        vo.setRgtr_id(cntr_sn);
        vo.setRgtr_dt(date);

        dao.mlrdRegister(vo);
    }

    // 소통 목록
    @Override
    public List<DonaVo> mlrdList() throws Exception {
        return dao.mlrdList();
    }

    // 소통 조회
    @Override
    public MlrdVo mlrdView(int mlrd_sn) throws Exception {
        return dao.mlrdView(mlrd_sn);
    }

    // 소통 수정
    @Override
    public void mlrdModify(MlrdVo vo) throws Exception {
        dao.mlrdModify(vo);
    }
}
