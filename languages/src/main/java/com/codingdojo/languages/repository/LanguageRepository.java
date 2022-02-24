package com.codingdojo.languages.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.languages.entity.Language;

@Repository
public interface LanguageRepository extends JpaRepository<Language, Long> {
	List<Language> findAll();
	Page<Language> findAll(Pageable pageable);
}
