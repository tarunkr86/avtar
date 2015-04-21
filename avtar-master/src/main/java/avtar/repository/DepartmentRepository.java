package avtar.repository;


import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;


import avtar.model.CompanyDepartment;

public interface DepartmentRepository extends PagingAndSortingRepository<CompanyDepartment, Integer> {
    Page<CompanyDepartment> findByNameLike(Pageable pageable, String name);
}
