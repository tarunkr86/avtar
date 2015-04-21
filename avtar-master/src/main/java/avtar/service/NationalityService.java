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

import avtar.model.Nationality;
import avtar.repository.NationalityRepository;
import avtar.vo.NationalityListVO;

@Service
@Transactional
public class NationalityService {

	@PersistenceContext
	 EntityManager entityManager;
	
   @Autowired
   private NationalityRepository Repository;

   @Transactional(readOnly = true)
   public NationalityListVO findAll(int page, int maxResults) {
       Page<Nationality> result = executeQueryFindAll(page, maxResults);

       if(shouldExecuteSameQueryInLastPage(page, result)){
           int lastPage = result.getTotalPages() - 1;
           result = executeQueryFindAll(lastPage, maxResults);
       }

       return buildResult(result);
   }

   public void save(Nationality nationality) {
      Repository.save(nationality);
       //entityManager.merge(nationality);//used in update case
   }

   public Nationality findById(Integer id) {
      return  Repository.findOne(id);
   }
   @Secured("ROLE_ADMIN")
   public void delete(int nationalityId) {
       Repository.delete(nationalityId);
   }

   @Transactional(readOnly = true)
   public NationalityListVO findByNameLike(int page, int maxResults, String name) {
       Page<Nationality> result = executeQueryFindByName(page, maxResults, name);

       if(shouldExecuteSameQueryInLastPage(page, result)){
           int lastPage = result.getTotalPages() - 1;
           result = executeQueryFindByName(lastPage, maxResults, name);
       }

       return buildResult(result);
   }

   private boolean shouldExecuteSameQueryInLastPage(int page, Page<Nationality> result) {
       return isUserAfterOrOnLastPage(page, result) && hasDataInDataBase(result);
   }

   private Page<Nationality> executeQueryFindAll(int page, int maxResults) {
       final PageRequest pageRequest = new PageRequest(page, maxResults, sortByNameASC());

       return Repository.findAll(pageRequest);
   }

   private Sort sortByNameASC() {
       return new Sort(Sort.Direction.ASC, "name");
   }

   private NationalityListVO buildResult(Page<Nationality> result) {
       return new NationalityListVO(result.getTotalPages(), result.getTotalElements(), result.getContent());
   }

   private Page<Nationality> executeQueryFindByName(int page, int maxResults, String name) {
       final PageRequest pageRequest = new PageRequest(page, maxResults, sortByNameASC());

       return Repository.findByNameLike(pageRequest, "%" + name + "%");
   }

   private boolean isUserAfterOrOnLastPage(int page, Page<Nationality> result) {
       return page >= result.getTotalPages() - 1;
   }

   private boolean hasDataInDataBase(Page<Nationality> result) {
       return result.getTotalElements() > 0;
   }
}
