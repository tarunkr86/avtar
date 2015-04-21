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
import avtar.service.DepartmentService;
import avtar.service.EmailCategoryService;
import avtar.vo.EmailCategoryListVO;

@Controller
@RequestMapping(value = "/protected/emailCategorys")
public class EmailCategoryController {

	 private static final String DEFAULT_PAGE_DISPLAYED_TO_USER = "0";

	    @Autowired
	    private EmailCategoryService emailCategoryService;

	    @Autowired
		private DepartmentService departmentService;
	    
	    @Autowired
	    private MessageSource messageSource;

	    @Value("15")
	    private int maxResults;

	    @RequestMapping(method = RequestMethod.GET)
	    public ModelAndView welcome() {
	        return new ModelAndView("emailCategorysList");
	    }

	    @RequestMapping(method = RequestMethod.GET, produces = "application/json")
	    public ResponseEntity<?> listAll(@RequestParam int page, Locale locale) {
	        return createListAllResponse(page, locale);
	    }

	    @RequestMapping(method = RequestMethod.POST, produces = "application/json")
	    public ResponseEntity<?> create(
	    		                        @ModelAttribute("emailCategory") EmailCategory emailCategory,
	                                    @RequestParam(required = false) String searchFor,
	                                    @RequestParam(required = false, defaultValue = DEFAULT_PAGE_DISPLAYED_TO_USER) int page,
	                                    Locale locale) {
	    	   		   			   	   		 		 
			   emailCategoryService.save(emailCategory);      
	        if (isSearchActivated(searchFor)) {
	            return search(searchFor, page, locale, "message.create.success");
	        }

	        return createListAllResponse(page, locale, "message.create.success");
	    }

	    @RequestMapping(value = "/{emailCategoryId}", method = RequestMethod.PUT, produces = "application/json")
	    public ResponseEntity<?> update(@PathVariable("emailCategoryId") int emailCategoryId,
	                                    @RequestBody EmailCategory emailCategory,
	                                    @RequestParam(required = false) String searchFor,
	                                    @RequestParam(required = false, defaultValue = DEFAULT_PAGE_DISPLAYED_TO_USER) int page,
	                                    Locale locale) {
	    	
	        if (emailCategoryId != emailCategory.getId()) {
	            return new ResponseEntity<String>("Bad Request", HttpStatus.BAD_REQUEST);
	        }	          		   			  		   		 		 
			   emailCategoryService.save(emailCategory);      
	        if (isSearchActivated(searchFor)) {
	            return search(searchFor, page, locale, "message.update.success");
	        }

	        return createListAllResponse(page, locale, "message.update.success");
	    }

	    @RequestMapping(value = "/{emailCategoryId}", method = RequestMethod.DELETE, produces = "application/json")
	    public ResponseEntity<?> delete(@PathVariable("emailCategoryId") int emailCategoryId,
	                                    @RequestParam(required = false) String searchFor,
	                                    @RequestParam(required = false, defaultValue = DEFAULT_PAGE_DISPLAYED_TO_USER) int page, Locale locale) {

	        try {	        		        	
	            emailCategoryService.delete(emailCategoryId);
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
	        EmailCategoryListVO emailCategoryListVO = emailCategoryService.findByNameLike(page, maxResults, name);

	        if (!StringUtils.isEmpty(actionMessageKey)) {
	            addActionMessageToVO(emailCategoryListVO, locale, actionMessageKey, null);
	        }

	        Object[] args = {name};

	        addSearchMessageToVO(emailCategoryListVO, locale, "message.search.for.active", args);

	        return new ResponseEntity<EmailCategoryListVO>(emailCategoryListVO, HttpStatus.OK);
	    }

	    private EmailCategoryListVO listAll(int page) {
	        return emailCategoryService.findAll(page, maxResults);
	    }

	    private ResponseEntity<EmailCategoryListVO> returnListToUser(EmailCategoryListVO emailCategoryList) {
	        return new ResponseEntity<EmailCategoryListVO>(emailCategoryList, HttpStatus.OK);
	    }

	    private ResponseEntity<?> createListAllResponse(int page, Locale locale) {
	        return createListAllResponse(page, locale, null);
	    }

	    private ResponseEntity<?> createListAllResponse(int page, Locale locale, String messageKey) {
	        EmailCategoryListVO emailCategoryListVO = listAll(page);

	        addActionMessageToVO(emailCategoryListVO, locale, messageKey, null);

	        return returnListToUser(emailCategoryListVO);
	    }

	    private EmailCategoryListVO addActionMessageToVO(EmailCategoryListVO emailCategoryListVO, Locale locale, String actionMessageKey, Object[] args) {
	        if (StringUtils.isEmpty(actionMessageKey)) {
	            return emailCategoryListVO;
	        }

	        emailCategoryListVO.setActionMessage(messageSource.getMessage(actionMessageKey, args, null, locale));

	        return emailCategoryListVO;
	    }

	    private EmailCategoryListVO addSearchMessageToVO(EmailCategoryListVO emailCategoryListVO, Locale locale, String actionMessageKey, Object[] args) {
	        if (StringUtils.isEmpty(actionMessageKey)) {
	            return emailCategoryListVO;
	        }

	        emailCategoryListVO.setSearchMessage(messageSource.getMessage(actionMessageKey, args, null, locale));

	        return emailCategoryListVO;
	    }

	    private boolean isSearchActivated(String searchFor) {
	        return !StringUtils.isEmpty(searchFor);
	    }
}
