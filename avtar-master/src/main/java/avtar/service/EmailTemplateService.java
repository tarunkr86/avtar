package avtar.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import avtar.model.EmailTemplate;
import avtar.repository.EmailTemplateRepository;
import avtar.vo.EmailTemplateListVO;

@Service
@Transactional
public class EmailTemplateService {

	@Autowired
    private EmailTemplateRepository emailTemplateRepository;

    @Transactional(readOnly = true)
    public EmailTemplateListVO findAll(int page, int maxResults) {
        Page<EmailTemplate> result = executeQueryFindAll(page, maxResults);

        if(shouldExecuteSameQueryInLastPage(page, result)){
            int lastPage = result.getTotalPages() - 1;
            result = executeQueryFindAll(lastPage, maxResults);
        }

        return buildResult(result);
    }

    public void save(EmailTemplate emailTemplate) {
        emailTemplateRepository.save(emailTemplate);
    }

    @Secured("ROLE_ADMIN")
    public void delete(int emailTemplateId) {
        emailTemplateRepository.delete(emailTemplateId);
    }

    @Secured("ROLE_ADMIN")
    public EmailTemplate findById(int emailTemplateId) {
        return emailTemplateRepository.findOne(emailTemplateId);
    }
    @Transactional(readOnly = true)
    public EmailTemplateListVO findByNameLike(int page, int maxResults, String name) {
        Page<EmailTemplate> result = executeQueryFindByName(page, maxResults, name);

        if(shouldExecuteSameQueryInLastPage(page, result)){
            int lastPage = result.getTotalPages() - 1;
            result = executeQueryFindByName(lastPage, maxResults, name);
        }

        return buildResult(result);
    }

    private boolean shouldExecuteSameQueryInLastPage(int page, Page<EmailTemplate> result) {
        return isUserAfterOrOnLastPage(page, result) && hasDataInDataBase(result);
    }

    private Page<EmailTemplate> executeQueryFindAll(int page, int maxResults) {
        final PageRequest pageRequest = new PageRequest(page, maxResults, sortByNameASC());

        return emailTemplateRepository.findAll(pageRequest);
    }

    private Sort sortByNameASC() {
        return new Sort(Sort.Direction.ASC, "name");
    }

    private EmailTemplateListVO buildResult(Page<EmailTemplate> result) {
        return new EmailTemplateListVO(result.getTotalPages(), result.getTotalElements(), result.getContent());
    }

    private Page<EmailTemplate> executeQueryFindByName(int page, int maxResults, String name) {
        final PageRequest pageRequest = new PageRequest(page, maxResults, sortByNameASC());

        return emailTemplateRepository.findByNameLike(pageRequest, "%" + name + "%");
    }

    private boolean isUserAfterOrOnLastPage(int page, Page<EmailTemplate> result) {
        return page >= result.getTotalPages() - 1;
    }

    private boolean hasDataInDataBase(Page<EmailTemplate> result) {
        return result.getTotalElements() > 0;
    }
}
