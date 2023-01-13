package com.example.water_web.Controller;

import com.example.water_web.Service.MapService;
import com.example.water_web.Vo.DonaVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/*")
public class MapController {

    @Autowired
    MapService service;

    @GetMapping("/map")
    public void getLatlng(DonaVo vo, Model model) throws Exception {
        List<DonaVo> latlng = service.latlng(vo);
        model.addAttribute("latlng", latlng);

    }

    @PostMapping("/map")
    public String postLatlng(DonaVo vo) throws Exception {
        service.latlng(vo);

        return "redirect:/main";
    }
}

