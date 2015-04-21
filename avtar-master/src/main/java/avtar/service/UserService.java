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

import avtar.model.User;
import avtar.repository.UserRepository;
import avtar.vo.UserListVO;

@Service
@Transactional
public class UserService {

	@PersistenceContext
	 EntityManager entityManager;
	
    @Autowired
    private UserRepository userRepository;

    public User findByEmail(String email){
        return userRepository.findByEmail(email);
    }
    
    public Iterable<User> findAll() {
        return  userRepository.findAll();
     }
   
    @SuppressWarnings("unchecked")
	public Iterable<User> findByDepartmentId(int departmentId) {
    	 Query query = entityManager.createQuery("Select sm from User sm where sm.companyDepartment.id=:arg1");
    	 query.setParameter("arg1", departmentId);
    	 return query.getResultList();
     }
    @Transactional(readOnly = true)
    public UserListVO findAll(int page, int maxResults) {
        Page<User> result = executeQueryFindAll(page, maxResults);

        if(shouldExecuteSameQueryInLastPage(page, result)){
            int lastPage = result.getTotalPages() - 1;
            result = executeQueryFindAll(lastPage, maxResults);
        }

        return buildResult(result);
    }

    public void save(User user) {
        userRepository.save(user);
    }

    @Secured("ROLE_ADMIN")
    public void delete(int userId) {
        userRepository.delete(userId);
    }

    @Secured("ROLE_ADMIN")
    public User findById(int userId) {
        return userRepository.findOne(userId);
    }
    @Transactional(readOnly = true)
    public UserListVO findByNameLike(int page, int maxResults, String name) {
        Page<User> result = executeQueryFindByName(page, maxResults, name);

        if(shouldExecuteSameQueryInLastPage(page, result)){
            int lastPage = result.getTotalPages() - 1;
            result = executeQueryFindByName(lastPage, maxResults, name);
        }

        return buildResult(result);
    }

    private boolean shouldExecuteSameQueryInLastPage(int page, Page<User> result) {
        return isUserAfterOrOnLastPage(page, result) && hasDataInDataBase(result);
    }

    private Page<User> executeQueryFindAll(int page, int maxResults) {
        final PageRequest pageRequest = new PageRequest(page, maxResults, sortByNameASC());

        return userRepository.findAll(pageRequest);
    }

    private Sort sortByNameASC() {
        return new Sort(Sort.Direction.ASC, "name");
    }

    private UserListVO buildResult(Page<User> result) {
        return new UserListVO(result.getTotalPages(), result.getTotalElements(), result.getContent());
    }

    private Page<User> executeQueryFindByName(int page, int maxResults, String name) {
        final PageRequest pageRequest = new PageRequest(page, maxResults, sortByNameASC());

        return userRepository.findByNameLike(pageRequest, "%" + name + "%");
    }

    private boolean isUserAfterOrOnLastPage(int page, Page<User> result) {
        return page >= result.getTotalPages() - 1;
    }

    private boolean hasDataInDataBase(Page<User> result) {
        return result.getTotalElements() > 0;
    }
}
