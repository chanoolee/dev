package org.hdcd.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.hdcd.domain.Platform;
import org.hdcd.service.HomeServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class HomeController {

	private final HomeServiceImpl service;
	
	@GetMapping
	public String home(Locale locale, Model model) throws Exception {
		LocalDateTime now = LocalDateTime.now();
		
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy년 M월 d일 (E) a h시 m분 s초");
		String formattedNow = now.format(formatter);   
		
		model.addAttribute("serverTime", formattedNow);
		
		model.addAttribute("netflexList", service.netflexList());
		model.addAttribute("coupangList", service.coupangList());
		model.addAttribute("waveList", service.waveList());
		model.addAttribute("watchaList", service.watchaList());
		model.addAttribute("disneyList", service.disneyList());
		model.addAttribute("tivingList", service.tivingList());
		
		return "home";
	}
	
}
