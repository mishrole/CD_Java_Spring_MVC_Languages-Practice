package com.codingdojo.languages.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.codingdojo.languages.entity.Language;
import com.codingdojo.languages.service.LanguageService;

@Controller
@RequestMapping("/languages")
public class LanguageController {
	
	@Autowired
	private LanguageService languageService;
	
	@RequestMapping()
	public String index(@ModelAttribute("language") Language language, Model model) {
		List<Language> languages = languageService.allLanguages();
		model.addAttribute("languages", languages);
		return "index";
	}
	
	@RequestMapping("/{id}/edit")
	public String edit(@PathVariable("id") Long id, Model model) {
		Language result = languageService.findLanguage(id);
		model.addAttribute("language", result);
		return "edit";
	}
	
	@RequestMapping("/{id}")
	public String show(@PathVariable("id") Long id, Model model) {
		Language result = languageService.findLanguage(id);
		model.addAttribute("language", result);
		return "show";
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String create(@Valid @ModelAttribute("language") Language language, BindingResult result) {
		if (result.hasErrors()) {
			return "index";
		}
		
		languageService.createLanguage(language);
		return "redirect:/languages";
	}
	
	@RequestMapping(value = "/{id}", method = RequestMethod.PUT)
	public String update(@PathVariable("id") Long id, @Valid @ModelAttribute("language") Language language, BindingResult result) {
		if (result.hasErrors()) {
			return "edit";
		}
		
		languageService.updateLanguage(id, language);
		return "redirect:/languages";
	}
	
	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
	public String destroy(@PathVariable("id") Long id) {
		languageService.deleteLanguage(id);
		return "redirect:/languages";
	}
}
