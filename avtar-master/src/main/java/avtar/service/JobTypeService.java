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

import avtar.model.JobType;
import avtar.repository.JobTypeRepository;
import avtar.vo.JobTypeListVO;


@Service
@Transactional
public class JobTypeService {

	@PersistenceContext
	 EntityManager entityManager;
	
   @Autowired
   private JobTypeRepository jobTypeRepository;

   
   public Iterable<JobType> findAll() {
       return  jobTypeRepository.findAll();
    }
  
   @SuppressWarnings("unchecked")
	public Iterable<JobType> findByDepartmentId(int departmentId) {
   	 Query query = entityManager.createQuery("Select sm from JobType sm where sm.companyDepartment.id=:arg1");
   	 query.setParameter("arg1", departmentId);
   	 return query.getResultList();
    }
   @Transactional(readOnly = true)
   public JobTypeListVO findAll(int page, int maxResults) {
       Page<JobType> result = executeQueryFindAll(page, maxResults);

       if(shouldExecuteSameQueryInLastPage(page, result)){
           int lastPage = result.getTotalPages() - 1;
           result = executeQueryFindAll(lastPage, maxResults);
       }

       return buildResult(result);
   }

   public void save(JobType jobType) {
       jobTypeRepository.save(jobType);
   }

   @Secured("ROLE_ADMIN")
   public void delete(int jobTypeId) {
       jobTypeRepository.delete(jobTypeId);
   }

   @Secured("ROLE_ADMIN")
   public JobType findById(int jobTypeId) {
       return jobTypeRepository.findOne(jobTypeId);
   }
   @Transactional(readOnly = true)
   public JobTypeListVO findByNameLike(int page, int maxResults, String name) {
       Page<JobType> result = executeQueryFindByName(page, maxResults, name);

       if(shouldExecuteSameQueryInLastPage(page, result)){
           int lastPage = result.getTotalPages() - 1;
           result = executeQueryFindByName(lastPage, maxResults, name);
       }

       return buildResult(result);
   }

   private boolean shouldExecuteSameQueryInLastPage(int page, Page<JobType> result) {
       return isJobTypeAfterOrOnLastPage(page, result) && hasDataInDataBase(result);
   }

   private Page<JobType> executeQueryFindAll(int page, int maxResults) {
       final PageRequest pageRequest = new PageRequest(page, maxResults, sortByNameASC());

       return jobTypeRepository.findAll(pageRequest);
   }

   private Sort sortByNameASC() {
       return new Sort(Sort.Direction.ASC, "name");
   }

   private JobTypeListVO buildResult(Page<JobType> result) {
       return new JobTypeListVO(result.getTotalPages(), result.getTotalElements(), result.getContent());
   }

   private Page<JobType> executeQueryFindByName(int page, int maxResults, String name) {
       final PageRequest pageRequest = new PageRequest(page, maxResults, sortByNameASC());

       return jobTypeRepository.findByNameLike(pageRequest, "%" + name + "%");
   }

   private boolean isJobTypeAfterOrOnLastPage(int page, Page<JobType> result) {
       return page >= result.getTotalPages() - 1;
   }

   private boolean hasDataInDataBase(Page<JobType> result) {
       return result.getTotalElements() > 0;
   }
}
