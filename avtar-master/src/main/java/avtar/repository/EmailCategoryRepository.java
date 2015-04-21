package avtar.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

import avtar.model.EmailCategory;

public interface EmailCategoryRepository extends PagingAndSortingRepository<EmailCategory, Integer> {
    Page< EmailCategory> findByNameLike(Pageable pageable, String name);
}
