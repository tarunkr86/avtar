package avtar.repository;


import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;


import avtar.model.CompanyLocation;

public interface LocationRepository extends PagingAndSortingRepository<CompanyLocation, Integer> {
    Page<CompanyLocation> findByNameLike(Pageable pageable, String name);
}
