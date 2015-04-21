package avtar.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

import avtar.model.Nationality;

public interface NationalityRepository extends PagingAndSortingRepository<Nationality, Integer> {
    Page<Nationality> findByNameLike(Pageable pageable, String name);
}
