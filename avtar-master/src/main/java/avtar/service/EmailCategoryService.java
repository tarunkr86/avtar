package avtar.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import avtar.model.EmailCategory;
import avtar.repository.EmailCategoryRepository;
import avtar.vo.EmailCategoryListVO;

@Service
@Transactional
public class EmailCategoryService {

	@Autowired
    private EmailCategoryRepository emailCategoryRepository;

    @Transactional(readOnly = true)
    public EmailCategoryListVO findAll(int page, int maxResults) {
        Page<EmailCategory> result = executeQueryFindAll(page, maxResults);

        if(shouldExecuteSameQueryInLastPage(page, result)){
            int lastPage = result.getTotalPages() - 1;
            result = executeQueryFindAll(lastPage, maxResults);
        }

        return buildResult(result);
    }

    public void save(EmailCategory emailCategory) {
        emailCategoryRepository.save(emailCategory);
    }

    @Secured("ROLE_ADMIN")
    public void delete(int emailCategoryId) {
        emailCategoryRepository.delete(emailCategoryId);
    }

    @Secured("ROLE_ADMIN")
    public EmailCategory findById(int emailCategoryId) {
        return emailCategoryRepository.findOne(emailCategoryId);
    }
    @Transactional(readOnly = true)
    public EmailCategoryListVO findByNameLike(int page, int maxResults, String name) {
        Page<EmailCategory> result = executeQueryFindByName(page, maxResults, name);

        if(shouldExecuteSameQueryInLastPage(page, result)){
            int lastPage = result.getTotalPages() - 1;
            result = executeQueryFindByName(lastPage, maxResults, name);
        }

        return buildResult(result);
    }

    private boolean shouldExecuteSameQueryInLastPage(int page, Page<EmailCategory> result) {
        return isUserAfterOrOnLastPage(page, result) && hasDataInDataBase(result);
    }

    private Page<EmailCategory> executeQueryFindAll(int page, int maxResults) {
        final PageRequest pageRequest = new PageRequest(page, maxResults, sortByNameASC());

        return emailCategoryRepository.findAll(pageRequest);
    }

    private Sort sortByNameASC() {
        return new Sort(Sort.Direction.ASC, "name");
    }

    private EmailCategoryListVO buildResult(Page<EmailCategory> result) {
        return new EmailCategoryListVO(result.getTotalPages(), result.getTotalElements(), result.getContent());
    }

    private Page<EmailCategory> executeQueryFindByName(int page, int maxResults, String name) {
        final PageRequest pageRequest = new PageRequest(page, maxResults, sortByNameASC());

        return emailCategoryRepository.findByNameLike(pageRequest, "%" + name + "%");
    }

    private boolean isUserAfterOrOnLastPage(int page, Page<EmailCategory> result) {
        return page >= result.getTotalPages() - 1;
    }

    private boolean hasDataInDataBase(Page<EmailCategory> result) {
        return result.getTotalElements() > 0;
    }
}
