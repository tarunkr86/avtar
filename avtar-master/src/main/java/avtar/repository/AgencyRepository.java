package avtar.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

import avtar.model.Agency;


public interface AgencyRepository extends PagingAndSortingRepository<Agency, Integer> {
    Page< Agency> findByNameLike(Pageable pageable, String name);
}

