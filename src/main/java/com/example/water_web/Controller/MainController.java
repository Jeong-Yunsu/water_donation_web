package com.example.water_web.Controller;

import com.example.water_web.Service.MainService;
import com.example.water_web.Vo.DonaVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/*")
public class MainController {

    @Autowired
    MainService service;

    @GetMapping("/main")
    public void main1(DonaVo vo, Model model) throws Exception{
        List<DonaVo> list1 = null;
        List<DonaVo> list2 = null;
        List<DonaVo> list3 = null;
        list1 = service.main1(vo);
        list2 = service.main2(vo);
        list3 = service.main3(vo);

        model.addAttribute("main1", list1);
        model.addAttribute("main2", list2);
        model.addAttribute("main3", list3);
    }

    // 공지사항
    @GetMapping("/notice")
    public String introPage() {
        return "notice";
    }

//    @GetMapping("/dona")
//    public String toDona() {
//        return "dona";
//    }
//
//    @GetMapping("/donaing")
//    public String toDonaIng() {
//        return "donaing";
//    }
    
    // 스토어
    @GetMapping("/store")
    public String toStore() {
        return "store";
    }

}
