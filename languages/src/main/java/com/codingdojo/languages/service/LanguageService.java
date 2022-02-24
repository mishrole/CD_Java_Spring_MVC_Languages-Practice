package com.codingdojo.languages.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.codingdojo.languages.entity.Language;
import com.codingdojo.languages.repository.LanguageRepository;

@Service
public class LanguageService implements ILanguageService {
	
	@Autowired
	private LanguageRepository languageRepository;

	@Override
	public List<Language> allLanguages() {
		return languageRepository.findAll();
	}

	@Override
	public Language createLanguage(Language language) {
		return languageRepository.save(language);
	}

	@Override
	public Language findLanguage(Long id) {
		Optional<Language> optionalLanguage = languageRepository.findById(id);
		
		if (optionalLanguage.isPresent()) {
			return optionalLanguage.get();
		}
		
		return null;
	}

	@Override
	public Language updateLanguage(Long id, Language language) {
		Optional<Language> optionalLanguage = languageRepository.findById(id);
		
		if (optionalLanguage.isPresent()) {
			Language data = optionalLanguage.get();
			data.setCreator(language.getCreator());
			data.setCurrentVersion(language.getCurrentVersion());
			data.setName(language.getName());
			
			return languageRepository.save(data);
		}
		
		return null;
	}

	@Override
	public void deleteLanguage(Long id) {
		Optional<Language> optionalLanguage = languageRepository.findById(id);
		
		if (optionalLanguage.isPresent()) {
			languageRepository.deleteById(id);
		}
		
	}

	@Override
	public Page<Language> findAllPageable(Pageable pageable) {
		return languageRepository.findAll(pageable);
	}

}
