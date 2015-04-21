package avtar.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import avtar.model.CompanyDepartment;
import avtar.repository.DepartmentRepository;
import avtar.vo.DepartmentListVO;

@Service
@Transactional
public class DepartmentService {

    @Autowired
    private DepartmentRepository Repository;

    @Transactional(readOnly = true)
    public DepartmentListVO findAll(int page, int maxResults) {
        Page<CompanyDepartment> result = executeQueryFindAll(page, maxResults);

        if(shouldExecuteSameQueryInLastPage(page, result)){
            int lastPage = result.getTotalPages() - 1;
            result = executeQueryFindAll(lastPage, maxResults);
        }

        return buildResult(result);
    }

    public void save(CompanyDepartment companyDepartment) {
        Repository.save(companyDepartment);
    }

    public CompanyDepartment findById(Integer id) {
       return  Repository.findOne(id);
    }
    
    public Iterable<CompanyDepartment> findAll() {
        return  Repository.findAll();
     }
    @Secured("ROLE_ADMIN")
    public void delete(int departmentId) {
        Repository.delete(departmentId);
    }

    @Transactional(readOnly = true)
    public DepartmentListVO findByNameLike(int page, int maxResults, String name) {
        Page<CompanyDepartment> result = executeQueryFindByName(page, maxResults, name);

        if(shouldExecuteSameQueryInLastPage(page, result)){
            int lastPage = result.getTotalPages() - 1;
            result = executeQueryFindByName(lastPage, maxResults, name);
        }

        return buildResult(result);
    }

    private boolean shouldExecuteSameQueryInLastPage(int page, Page<CompanyDepartment> result) {
        return isUserAfterOrOnLastPage(page, result) && hasDataInDataBase(result);
    }

    private Page<CompanyDepartment> executeQueryFindAll(int page, int maxResults) {
        final PageRequest pageRequest = new PageRequest(page, maxResults, sortByNameASC());

        return Repository.findAll(pageRequest);
    }

    private Sort sortByNameASC() {
        return new Sort(Sort.Direction.ASC, "name");
    }

    private DepartmentListVO buildResult(Page<CompanyDepartment> result) {
        return new DepartmentListVO(result.getTotalPages(), result.getTotalElements(), result.getContent());
    }

    private Page<CompanyDepartment> executeQueryFindByName(int page, int maxResults, String name) {
        final PageRequest pageRequest = new PageRequest(page, maxResults, sortByNameASC());

        return Repository.findByNameLike(pageRequest, "%" + name + "%");
    }

    private boolean isUserAfterOrOnLastPage(int page, Page<CompanyDepartment> result) {
        return page >= result.getTotalPages() - 1;
    }

    private boolean hasDataInDataBase(Page<CompanyDepartment> result) {
        return result.getTotalElements() > 0;
    }
}

