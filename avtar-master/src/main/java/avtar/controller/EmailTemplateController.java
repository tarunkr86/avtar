package avtar.controller;

import java.util.Locale;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.MessageSource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import avtar.model.EmailCategory;
import avtar.model.EmailTemplate;
import avtar.service.DepartmentService;
import avtar.service.EmailCategoryService;
import avtar.service.EmailTemplateService;
import avtar.vo.EmailTemplateListVO;

@Controller
@RequestMapping(value = "/protected/emailTemplates")
public class EmailTemplateController {
	
	 private static final String DEFAULT_PAGE_DISPLAYED_TO_USER = "0";

	    @Autowired
	    private EmailTemplateService emailTemplateService;

	    @Autowired
		private DepartmentService departmentService;
	    

	    @Autowired
	    private EmailCategoryService emailCategoryService;
	    
	    @Autowired
	    private MessageSource messageSource;

	    @Value("15")
	    private int maxResults;

	    @RequestMapping(method = RequestMethod.GET)
	    public ModelAndView welcome() {
	        return new ModelAndView("emailTemplatesList");
	    }

	    @RequestMapping(method = RequestMethod.GET, produces = "application/json")
	    public ResponseEntity<?> listAll(@RequestParam int page, Locale locale) {
	        return createListAllResponse(page, locale);
	    }

	    @RequestMapping(value = "/{categoryId}",method = RequestMethod.POST, produces = "application/json")
	    public ResponseEntity<?> create(@PathVariable("categoryId") int categoryId,
	    		                        @ModelAttribute("emailTemplate") EmailTemplate emailTemplate,
	                                    @RequestParam(required = false) String searchFor,
	                                    @RequestParam(required = false, defaultValue = DEFAULT_PAGE_DISPLAYED_TO_USER) int page,Locale locale) {
	    	   		
	    	 EmailCategory category= emailCategoryService.findById(categoryId);		  		
			 emailTemplate.setCategory(category);
			 emailTemplateService.save(emailTemplate);      
	        if (isSearchActivated(searchFor)) {
	            return search(searchFor, page, locale, "message.create.success");
	        }

	        return createListAllResponse(page, locale, "message.create.success");
	    }

	    @RequestMapping(value = "/{categoryId}", method = RequestMethod.PUT, produces = "application/json")
	    public ResponseEntity<?> update(@PathVariable("categoryId") int categoryId,
	                                    @RequestBody EmailTemplate emailTemplate,
	                                    @RequestParam(required = false) String searchFor,
	                                    @RequestParam(required = false, defaultValue = DEFAULT_PAGE_DISPLAYED_TO_USER) int page,
	                                    Locale locale) {
	    	
	        //if (emailTemplateId != emailTemplate.getId()) {
	           // return new ResponseEntity<String>("Bad Request", HttpStatus.BAD_REQUEST);
	        //}	 
	    	 EmailCategory category= emailCategoryService.findById(categoryId);		  		
			 emailTemplate.setCategory(category);
			 emailTemplateService.save(emailTemplate);      
	        if (isSearchActivated(searchFor)) {
	            return search(searchFor, page, locale, "message.update.success");
	        }

	        return createListAllResponse(page, locale, "message.update.success");
	    }

	    @RequestMapping(value = "/{emailTemplateId}", method = RequestMethod.DELETE, produces = "application/json")
	    public ResponseEntity<?> delete(@PathVariable("emailTemplateId") int emailTemplateId,
	                                    @RequestParam(required = false) String searchFor,
	                                    @RequestParam(required = false, defaultValue = DEFAULT_PAGE_DISPLAYED_TO_USER) int page, Locale locale) {

	        try {	
	        	EmailTemplate emailTemplate= emailTemplateService.findById(emailTemplateId);
	        	emailTemplate.setCategory(null);
	        	emailTemplateService.save(emailTemplate);
	            emailTemplateService.delete(emailTemplateId);
	        } catch (AccessDeniedException e) {
	            return new ResponseEntity<Object>(HttpStatus.FORBIDDEN);
	        }

	        if (isSearchActivated(searchFor)) {
	            return search(searchFor, page, locale, "message.delete.success");
	        }

	        return createListAllResponse(page, locale, "message.delete.success");
	    }

	    @RequestMapping(value = "/{name}", method = RequestMethod.GET, produces = "application/json")
	    public ResponseEntity<?> search(@PathVariable("name") String name,
	                                    @RequestParam(required = false, defaultValue = DEFAULT_PAGE_DISPLAYED_TO_USER) int page,
	                                    Locale locale) {
	        return search(name, page, locale, null);
	    }

	    private ResponseEntity<?> search(String name, int page, Locale locale, String actionMessageKey) {
	        EmailTemplateListVO emailTemplateListVO = emailTemplateService.findByNameLike(page, maxResults, name);

	        if (!StringUtils.isEmpty(actionMessageKey)) {
	            addActionMessageToVO(emailTemplateListVO, locale, actionMessageKey, null);
	        }

	        Object[] args = {name};

	        addSearchMessageToVO(emailTemplateListVO, locale, "message.search.for.active", args);

	        return new ResponseEntity<EmailTemplateListVO>(emailTemplateListVO, HttpStatus.OK);
	    }

	    private EmailTemplateListVO listAll(int page) {
	        return emailTemplateService.findAll(page, maxResults);
	    }

	    private ResponseEntity<EmailTemplateListVO> returnListToUser(EmailTemplateListVO emailTemplateList) {
	        return new ResponseEntity<EmailTemplateListVO>(emailTemplateList, HttpStatus.OK);
	    }

	    private ResponseEntity<?> createListAllResponse(int page, Locale locale) {
	        return createListAllResponse(page, locale, null);
	    }

	    private ResponseEntity<?> createListAllResponse(int page, Locale locale, String messageKey) {
	        EmailTemplateListVO emailTemplateListVO = listAll(page);

	        addActionMessageToVO(emailTemplateListVO, locale, messageKey, null);

	        return returnListToUser(emailTemplateListVO);
	    }

	    private EmailTemplateListVO addActionMessageToVO(EmailTemplateListVO emailTemplateListVO, Locale locale, String actionMessageKey, Object[] args) {
	        if (StringUtils.isEmpty(actionMessageKey)) {
	            return emailTemplateListVO;
	        }

	        emailTemplateListVO.setActionMessage(messageSource.getMessage(actionMessageKey, args, null, locale));

	        return emailTemplateListVO;
	    }

	    private EmailTemplateListVO addSearchMessageToVO(EmailTemplateListVO emailTemplateListVO, Locale locale, String actionMessageKey, Object[] args) {
	        if (StringUtils.isEmpty(actionMessageKey)) {
	            return emailTemplateListVO;
	        }

	        emailTemplateListVO.setSearchMessage(messageSource.getMessage(actionMessageKey, args, null, locale));

	        return emailTemplateListVO;
	    }

	    private boolean isSearchActivated(String searchFor) {
	        return !StringUtils.isEmpty(searchFor);
	    }

}
