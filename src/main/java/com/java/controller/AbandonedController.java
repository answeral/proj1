package com.java.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.java.service.AbandonedService;
import com.java.utils.PaginationUtils;

@Controller
public class AbandonedController {

    private static final int PAGE_SIZE = 10; // 페이지당 항목 수

    @Autowired
    private AbandonedService abandonedService; // AnimalService 주입

    @GetMapping("/adoption/animalList")
    public String getAnimalList(@RequestParam(defaultValue = "1") int page,
                                @RequestParam(required = false) String uprCd,
                                @RequestParam(required = false) String orgCd,
                                Model model) throws Exception {
        int totalCount = abandonedService.getFilteredTotalCount(uprCd, orgCd); // 필터 조건에 맞는 총 동물 정보 수 가져오기
        int totalPages = (totalCount + PAGE_SIZE - 1) / PAGE_SIZE; // 총 페이지 수 계산

        List<Map<String, String>> animalList = abandonedService.getAnimalListByPage(page, PAGE_SIZE, uprCd, orgCd); // 현재 페이지 정보 가져오기
        List<String> paginationLinks = PaginationUtils.getPaginationLinks(page, totalPages);

        model.addAttribute("animalList", animalList);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("totalCount", totalCount); // 총 동물 정보 수 추가
        model.addAttribute("uprCd", uprCd);
        model.addAttribute("orgCd", orgCd);
        model.addAttribute("sidoList", abandonedService.getSidoList());
        if (uprCd != null) {
            model.addAttribute("sigunguList", abandonedService.getSigunguList(uprCd));
        }
        model.addAttribute("paginationLinks", paginationLinks);
        return "/adoption/animalList";
    }

    @GetMapping("/adoption/sigungu")
    @ResponseBody
    public List<Map<String, String>> getSigungu(@RequestParam String uprCd) throws Exception {
        return abandonedService.getSigunguList(uprCd);
    }
}
