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

import avtar.model.Agency;
import avtar.model.Company;
import avtar.model.Nationality;
import avtar.service.CompanyService;
import avtar.service.DepartmentService;
import avtar.service.AgencyService;
import avtar.service.NationalityService;
import avtar.vo.AgencyListVO;

@Controller
@RequestMapping(value = "/protected/agencys")
public class AgencyController {
	
	 private static final String DEFAULT_PAGE_DISPLAYED_TO_USER = "0";

	    @Autowired
	    private AgencyService agencyService;

	    @Autowired
		private DepartmentService departmentService;
	    
	    @Autowired
	    private MessageSource messageSource;

	    @Autowired
		private CompanyService companyService;
	    
	    @Autowired
		private NationalityService nationalityService;
		
	    
	    @Value("15")
	    private int maxResults;

	    @RequestMapping(method = RequestMethod.GET)
	    public ModelAndView welcome() {
	        return new ModelAndView("agencysList");
	    }

	    @RequestMapping(method = RequestMethod.GET, produces = "application/json")
	    public ResponseEntity<?> listAll(@RequestParam int page, Locale locale) {
	        return createListAllResponse(page, locale);
	    }

	    @RequestMapping(method = RequestMethod.POST, produces = "application/json")
	    public ResponseEntity<?> create(
	    		                        @ModelAttribute("agency") Agency agency,
	    		                        @RequestParam int nationalityId,
	                                    @RequestParam(required = false) String searchFor,
	                                    @RequestParam(required = false, defaultValue = DEFAULT_PAGE_DISPLAYED_TO_USER) int page,
	                                    Locale locale) {
	    	   int id=15;		   
			   Company company= companyService.findById(id);
			   Nationality nationality=nationalityService.findById(nationalityId);
			   agency.setCompany(company);
			   agency.setNationality(nationality);
			   agencyService.save(agency);      
	        if (isSearchActivated(searchFor)) {
	            return search(searchFor, page, locale, "message.create.success");
	        }

	        return createListAllResponse(page, locale, "message.create.success");
	    }

	    @RequestMapping(value = "/{agencyId}", method = RequestMethod.PUT, produces = "application/json")
	    public ResponseEntity<?> update(@PathVariable("agencyId") int agencyId,
	                                    @RequestBody Agency agency,
	                                    @RequestParam int country,
	                                    @RequestParam int nationality,
	                                    @RequestParam(required = false) String searchFor,
	                                    @RequestParam(required = false, defaultValue = DEFAULT_PAGE_DISPLAYED_TO_USER) int page,
	                                    Locale locale) {
           System.out.println("Country id is:================="+country);
			 int id=15;		   
			 Company company= companyService.findById(id);
			 Nationality nation=nationalityService.findById(nationality);
			 agency.setCompany(company);
			 agency.setNationality(nation);
	        if (agencyId != agency.getId()) {
	            return new ResponseEntity<String>("Bad Request", HttpStatus.BAD_REQUEST);
	        }	          		   			  		   		 		 
			   agencyService.save(agency);      
	        if (isSearchActivated(searchFor)) {
	            return search(searchFor, page, locale, "message.update.success");
	        }

	        return createListAllResponse(page, locale, "message.update.success");
	    }

	    @RequestMapping(value = "/{agencyId}", method = RequestMethod.DELETE, produces = "application/json")
	    public ResponseEntity<?> delete(@PathVariable("agencyId") int agencyId,
	                                    @RequestParam(required = false) String searchFor,
	                                    @RequestParam(required = false, defaultValue = DEFAULT_PAGE_DISPLAYED_TO_USER) int page, Locale locale) {

	        try {	        		        	
	            agencyService.delete(agencyId);
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
	        AgencyListVO agencyListVO = agencyService.findByNameLike(page, maxResults, name);

	        if (!StringUtils.isEmpty(actionMessageKey)) {
	            addActionMessageToVO(agencyListVO, locale, actionMessageKey, null);
	        }

	        Object[] args = {name};

	        addSearchMessageToVO(agencyListVO, locale, "message.search.for.active", args);

	        return new ResponseEntity<AgencyListVO>(agencyListVO, HttpStatus.OK);
	    }

	    private AgencyListVO listAll(int page) {
	        return agencyService.findAll(page, maxResults);
	    }

	    private ResponseEntity<AgencyListVO> returnListToUser(AgencyListVO agencyList) {
	        return new ResponseEntity<AgencyListVO>(agencyList, HttpStatus.OK);
	    }

	    private ResponseEntity<?> createListAllResponse(int page, Locale locale) {
	        return createListAllResponse(page, locale, null);
	    }

	    private ResponseEntity<?> createListAllResponse(int page, Locale locale, String messageKey) {
	        AgencyListVO agencyListVO = listAll(page);

	        addActionMessageToVO(agencyListVO, locale, messageKey, null);

	        return returnListToUser(agencyListVO);
	    }

	    private AgencyListVO addActionMessageToVO(AgencyListVO agencyListVO, Locale locale, String actionMessageKey, Object[] args) {
	        if (StringUtils.isEmpty(actionMessageKey)) {
	            return agencyListVO;
	        }

	        agencyListVO.setActionMessage(messageSource.getMessage(actionMessageKey, args, null, locale));

	        return agencyListVO;
	    }

	    private AgencyListVO addSearchMessageToVO(AgencyListVO agencyListVO, Locale locale, String actionMessageKey, Object[] args) {
	        if (StringUtils.isEmpty(actionMessageKey)) {
	            return agencyListVO;
	        }

	        agencyListVO.setSearchMessage(messageSource.getMessage(actionMessageKey, args, null, locale));

	        return agencyListVO;
	    }

	    private boolean isSearchActivated(String searchFor) {
	        return !StringUtils.isEmpty(searchFor);
	    }

}
