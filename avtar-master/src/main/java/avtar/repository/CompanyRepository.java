package avtar.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

import avtar.model.Company;

public interface CompanyRepository extends PagingAndSortingRepository<Company, Integer> {
    Page<Company> findByNameLike(Pageable pageable, String name);
}