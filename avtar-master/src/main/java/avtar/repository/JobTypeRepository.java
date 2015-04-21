package avtar.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

import avtar.model.JobType;

public interface JobTypeRepository extends PagingAndSortingRepository<JobType, Integer> {
   
    Page<JobType> findByNameLike(Pageable pageable, String name);
}
