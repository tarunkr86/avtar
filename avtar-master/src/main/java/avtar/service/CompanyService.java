package avtar.service;


import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import avtar.model.Company;
import avtar.repository.CompanyRepository;
import avtar.vo.CompanyListVO;

@Service
@Transactional
public class CompanyService {

	@PersistenceContext
	 EntityManager entityManager;
	
    @Autowired
    private CompanyRepository Repository;

    @Transactional(readOnly = true)
    public CompanyListVO findAll(int page, int maxResults) {
        Page<Company> result = executeQueryFindAll(page, maxResults);

        if(shouldExecuteSameQueryInLastPage(page, result)){
            int lastPage = result.getTotalPages() - 1;
            result = executeQueryFindAll(lastPage, maxResults);
        }

        return buildResult(result);
    }

    public void save(Company company) {
       Repository.save(company);
        //entityManager.merge(company);//used in update case
    }

    public Company findById(Integer id) {
       return  Repository.findOne(id);
    }
    @Secured("ROLE_ADMIN")
    public void delete(int companyId) {
        Repository.delete(companyId);
    }

    @Transactional(readOnly = true)
    public CompanyListVO findByNameLike(int page, int maxResults, String name) {
        Page<Company> result = executeQueryFindByName(page, maxResults, name);

        if(shouldExecuteSameQueryInLastPage(page, result)){
            int lastPage = result.getTotalPages() - 1;
            result = executeQueryFindByName(lastPage, maxResults, name);
        }

        return buildResult(result);
    }

    private boolean shouldExecuteSameQueryInLastPage(int page, Page<Company> result) {
        return isUserAfterOrOnLastPage(page, result) && hasDataInDataBase(result);
    }

    private Page<Company> executeQueryFindAll(int page, int maxResults) {
        final PageRequest pageRequest = new PageRequest(page, maxResults, sortByNameASC());

        return Repository.findAll(pageRequest);
    }

    private Sort sortByNameASC() {
        return new Sort(Sort.Direction.ASC, "name");
    }

    private CompanyListVO buildResult(Page<Company> result) {
        return new CompanyListVO(result.getTotalPages(), result.getTotalElements(), result.getContent());
    }

    private Page<Company> executeQueryFindByName(int page, int maxResults, String name) {
        final PageRequest pageRequest = new PageRequest(page, maxResults, sortByNameASC());

        return Repository.findByNameLike(pageRequest, "%" + name + "%");
    }

    private boolean isUserAfterOrOnLastPage(int page, Page<Company> result) {
        return page >= result.getTotalPages() - 1;
    }

    private boolean hasDataInDataBase(Page<Company> result) {
        return result.getTotalElements() > 0;
    }
}
