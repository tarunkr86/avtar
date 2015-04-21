package avtar.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import avtar.model.CompanyLocation;
import avtar.repository.LocationRepository;
import avtar.vo.LocationListVO;

@Service
@Transactional
public class LocationService {

    @Autowired
    private LocationRepository Repository;

    @Transactional(readOnly = true)
    public LocationListVO findAll(int page, int maxResults) {
        Page<CompanyLocation> result = executeQueryFindAll(page, maxResults);

        if(shouldExecuteSameQueryInLastPage(page, result)){
            int lastPage = result.getTotalPages() - 1;
            result = executeQueryFindAll(lastPage, maxResults);
        }

        return buildResult(result);
    }

    public void save(CompanyLocation companyLocation) {
        Repository.save(companyLocation);
    }

    public CompanyLocation findById(Integer id) {
       return  Repository.findOne(id);
    }
    
    public Iterable<CompanyLocation> findAll() {
        return  Repository.findAll();
     }
    @Secured("ROLE_ADMIN")
    public void delete(int locationId) {
        Repository.delete(locationId);
    }

    @Transactional(readOnly = true)
    public LocationListVO findByNameLike(int page, int maxResults, String name) {
        Page<CompanyLocation> result = executeQueryFindByName(page, maxResults, name);

        if(shouldExecuteSameQueryInLastPage(page, result)){
            int lastPage = result.getTotalPages() - 1;
            result = executeQueryFindByName(lastPage, maxResults, name);
        }

        return buildResult(result);
    }

    private boolean shouldExecuteSameQueryInLastPage(int page, Page<CompanyLocation> result) {
        return isUserAfterOrOnLastPage(page, result) && hasDataInDataBase(result);
    }

    private Page<CompanyLocation> executeQueryFindAll(int page, int maxResults) {
        final PageRequest pageRequest = new PageRequest(page, maxResults, sortByNameASC());

        return Repository.findAll(pageRequest);
    }

    private Sort sortByNameASC() {
        return new Sort(Sort.Direction.ASC, "name");
    }

    private LocationListVO buildResult(Page<CompanyLocation> result) {
        return new LocationListVO(result.getTotalPages(), result.getTotalElements(), result.getContent());
    }

    private Page<CompanyLocation> executeQueryFindByName(int page, int maxResults, String name) {
        final PageRequest pageRequest = new PageRequest(page, maxResults, sortByNameASC());

        return Repository.findByNameLike(pageRequest, "%" + name + "%");
    }

    private boolean isUserAfterOrOnLastPage(int page, Page<CompanyLocation> result) {
        return page >= result.getTotalPages() - 1;
    }

    private boolean hasDataInDataBase(Page<CompanyLocation> result) {
        return result.getTotalElements() > 0;
    }
}

