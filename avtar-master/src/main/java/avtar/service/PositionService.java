package avtar.service;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import avtar.model.Position;
import avtar.model.User;
import avtar.repository.PositionRepository;
import avtar.vo.PositionListVO;

@Service
@Transactional
public class PositionService {

	@PersistenceContext
	 EntityManager entityManager;
	
    @Autowired
    private PositionRepository positionRepository;

    @Transactional(readOnly = true)
    public PositionListVO findAll(int page, int maxResults) {
        Page<Position> result = executeQueryFindAll(page, maxResults);

        if(shouldExecuteSameQueryInLastPage(page, result)){
            int lastPage = result.getTotalPages() - 1;
            result = executeQueryFindAll(lastPage, maxResults);
        }

        return buildResult(result);
    }

    public Iterable<Position> findAll() {
        return  positionRepository.findAll();
     }
    
    @SuppressWarnings("unchecked")
   	public Iterable<User> findByDepartmentId(int departmentId) {
       	 Query query = entityManager.createQuery("Select sm from Position sm where sm.department.id=:arg1");
       	 query.setParameter("arg1", departmentId);
       	 return query.getResultList();
        }
    public void save(Position position) {
        positionRepository.save(position);
    }

    @Secured("ROLE_ADMIN")
    public void delete(int positionId) {
        positionRepository.delete(positionId);
    }

    @Secured("ROLE_ADMIN")
    public Position findById(int positionId) {
        return positionRepository.findOne(positionId);
    }
    @Transactional(readOnly = true)
    public PositionListVO findByNameLike(int page, int maxResults, String name) {
        Page<Position> result = executeQueryFindByName(page, maxResults, name);

        if(shouldExecuteSameQueryInLastPage(page, result)){
            int lastPage = result.getTotalPages() - 1;
            result = executeQueryFindByName(lastPage, maxResults, name);
        }

        return buildResult(result);
    }

    private boolean shouldExecuteSameQueryInLastPage(int page, Page<Position> result) {
        return isUserAfterOrOnLastPage(page, result) && hasDataInDataBase(result);
    }

    private Page<Position> executeQueryFindAll(int page, int maxResults) {
        final PageRequest pageRequest = new PageRequest(page, maxResults, sortByNameASC());

        return positionRepository.findAll(pageRequest);
    }

    private Sort sortByNameASC() {
        return new Sort(Sort.Direction.ASC, "name");
    }

    private PositionListVO buildResult(Page<Position> result) {
        return new PositionListVO(result.getTotalPages(), result.getTotalElements(), result.getContent());
    }

    private Page<Position> executeQueryFindByName(int page, int maxResults, String name) {
        final PageRequest pageRequest = new PageRequest(page, maxResults, sortByNameASC());

        return positionRepository.findByNameLike(pageRequest, "%" + name + "%");
    }

    private boolean isUserAfterOrOnLastPage(int page, Page<Position> result) {
        return page >= result.getTotalPages() - 1;
    }

    private boolean hasDataInDataBase(Page<Position> result) {
        return result.getTotalElements() > 0;
    }
}