package avtar.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import avtar.model.Agency;
import avtar.repository.AgencyRepository;
import avtar.vo.AgencyListVO;

@Service
@Transactional
public class AgencyService {

	@Autowired
    private AgencyRepository agencyRepository;

    @Transactional(readOnly = true)
    public AgencyListVO findAll(int page, int maxResults) {
        Page<Agency> result = executeQueryFindAll(page, maxResults);

        if(shouldExecuteSameQueryInLastPage(page, result)){
            int lastPage = result.getTotalPages() - 1;
            result = executeQueryFindAll(lastPage, maxResults);
        }

        return buildResult(result);
    }

    public Iterable<Agency> findAll() {
        return  agencyRepository.findAll();
     }
    public void save(Agency agency) {
        agencyRepository.save(agency);
    }

    @Secured("ROLE_ADMIN")
    public void delete(int agencyId) {
        agencyRepository.delete(agencyId);
    }

    @Secured("ROLE_ADMIN")
    public Agency findById(int agencyId) {
        return agencyRepository.findOne(agencyId);
    }
    @Transactional(readOnly = true)
    public AgencyListVO findByNameLike(int page, int maxResults, String name) {
        Page<Agency> result = executeQueryFindByName(page, maxResults, name);

        if(shouldExecuteSameQueryInLastPage(page, result)){
            int lastPage = result.getTotalPages() - 1;
            result = executeQueryFindByName(lastPage, maxResults, name);
        }

        return buildResult(result);
    }

    private boolean shouldExecuteSameQueryInLastPage(int page, Page<Agency> result) {
        return isUserAfterOrOnLastPage(page, result) && hasDataInDataBase(result);
    }

    private Page<Agency> executeQueryFindAll(int page, int maxResults) {
        final PageRequest pageRequest = new PageRequest(page, maxResults, sortByNameASC());

        return agencyRepository.findAll(pageRequest);
    }

    private Sort sortByNameASC() {
        return new Sort(Sort.Direction.ASC, "name");
    }

    private AgencyListVO buildResult(Page<Agency> result) {
        return new AgencyListVO(result.getTotalPages(), result.getTotalElements(), result.getContent());
    }

    private Page<Agency> executeQueryFindByName(int page, int maxResults, String name) {
        final PageRequest pageRequest = new PageRequest(page, maxResults, sortByNameASC());

        return agencyRepository.findByNameLike(pageRequest, "%" + name + "%");
    }

    private boolean isUserAfterOrOnLastPage(int page, Page<Agency> result) {
        return page >= result.getTotalPages() - 1;
    }

    private boolean hasDataInDataBase(Page<Agency> result) {
        return result.getTotalElements() > 0;
    }
}
