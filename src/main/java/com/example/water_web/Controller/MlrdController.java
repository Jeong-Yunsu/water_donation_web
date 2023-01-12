package com.example.water_web.Controller;

import com.example.water_web.Service.DonaService;
import com.example.water_web.Service.MlrdService;
import com.example.water_web.Vo.ComtVo;
import com.example.water_web.Vo.DonaVo;
import com.example.water_web.Vo.MlrdVo;
import com.example.water_web.Vo.UserVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/*")
public class MlrdController {

    @Autowired
    MlrdService mlrdService;

    @Autowired
    DonaService Donaservice;

    // 후기글 리스트 조회 페이지
    @GetMapping("/viewmlrdlist")
    public void getView(@RequestParam("n") int cntr_sn, Model model) throws Exception {

        // tb_mlrd 가져옴
        List<MlrdVo> viewmlrdlist = mlrdService.viewMlrdList(cntr_sn);
        model.addAttribute("viewmlrdlist", viewmlrdlist);

        // tb_cntr, tb_cntr_ctbny 가져옴
        DonaVo view = Donaservice.donasView(cntr_sn);
        model.addAttribute("view", view);

        // percent 가져옴
        DonaVo view2 = Donaservice.magaDona(cntr_sn);
        model.addAttribute("view2", view2);

        // 기부 내역 조회
        List<DonaVo> breakdown = Donaservice.breakdown(cntr_sn);
        model.addAttribute("breakdown", breakdown);
        // 총 기부 내역 조회
        DonaVo breakdownSum = Donaservice.breakdownSum(cntr_sn);
        model.addAttribute("breakdownSum", breakdownSum);
    }

    // 후기글 자세히 페이지 + 댓글 페이지
    @GetMapping("/viewmlrd")
    public void getMlrdView(@RequestParam("q") int mlrd_sn, Model model) throws Exception {

        // tb_mlrd, tb_cntr, tb_cntr_ctbny, percent 가져옴
        List<MlrdVo> viewmlrd = mlrdService.viewMlrd(mlrd_sn);
        model.addAttribute("viewmlrd", viewmlrd);

        // 댓글 조회
        List<ComtVo> comt = mlrdService.comtList(mlrd_sn);
        model.addAttribute("comt", comt);
    }

    // 댓글 작성
    @PostMapping("/viewmlrd")
    public String PostMlrdComt(ComtVo comt, HttpSession session) throws Exception {

        UserVo user = (UserVo) session.getAttribute("user");
        comt.setMbr_sn(user.getMbr_sn());

        mlrdService.comtRegist(comt);

        return "redirect:/viewmlrd?q=" + comt.getMlrd_sn();
    }
}
