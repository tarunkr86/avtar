package avtar.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

import avtar.model.EmailTemplate;

public interface EmailTemplateRepository  extends PagingAndSortingRepository<EmailTemplate, Integer> {
    Page< EmailTemplate> findByNameLike(Pageable pageable, String name);
}
