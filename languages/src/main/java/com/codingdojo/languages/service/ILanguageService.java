package com.codingdojo.languages.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.codingdojo.languages.entity.Language;

public interface ILanguageService {
	public abstract List<Language> allLanguages();
	public abstract Language createLanguage(Language language);
	public abstract Language findLanguage(Long id);
	public abstract Language updateLanguage(Long id, Language language);
	public abstract void deleteLanguage(Long id);
	public Page<Language> findAllPageable(Pageable pageable);
}
