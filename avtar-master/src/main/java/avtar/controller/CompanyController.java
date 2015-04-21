package avtar.controller;

import java.util.HashSet;
import java.util.Locale;
import java.util.Set;

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
import avtar.model.CompanyDepartment;
import avtar.model.CompanyLocation;
import avtar.service.AgencyService;
import avtar.service.CompanyService;
import avtar.service.DepartmentService;
import avtar.service.LocationService;
import avtar.service.UserService;
import avtar.vo.CompanyListVO;

@Controller
@RequestMapping(value = "/protected/company")
public class CompanyController {

	private static final String DEFAULT_PAGE_DISPLAYED_TO_USER = "0";

	@Autowired
	private CompanyService companyService;
	
	@Autowired
	private LocationService locationService;
	
	@Autowired
	private DepartmentService departmentService;

	 @Autowired
	 private UserService userService;
	
	 @Autowired
	 private AgencyService agencyService;
	 
	@Autowired
	private MessageSource messageSource;

	@Value("5")
	private int maxResults;

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView welcome() {
		return new ModelAndView("companyList");
	}

	@RequestMapping(method = RequestMethod.GET, produces = "application/json")
	public ResponseEntity<?> listAll(@RequestParam int page, Locale locale) {
		return createListAllResponse(page, locale);
	}

	@RequestMapping(method = RequestMethod.POST, produces = "application/json")
	public ResponseEntity<?> create(
			@ModelAttribute("company") Company company,
			@RequestParam(required = false) String searchFor,
			@RequestParam(required = false, defaultValue = DEFAULT_PAGE_DISPLAYED_TO_USER) int page,
			Locale locale) {
		  
		    companyService.save(company);

		if (isSearchActivated(searchFor)) {
			return search(searchFor, page, locale, "message.create.success");
		}

		return createListAllResponse(page, locale, "message.create.success");
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.PUT, produces = "application/json")
	public ResponseEntity<?> update(
			@PathVariable("id") int companyId,
			@RequestBody Company company,
			@RequestParam(required = false) String searchFor,
			@RequestParam(required = false, defaultValue = DEFAULT_PAGE_DISPLAYED_TO_USER) int page,Locale locale) {
						
		if (companyId != company.getId()) {
			return new ResponseEntity<String>("Bad Request",HttpStatus.BAD_REQUEST);
		}
		
		   Set<CompanyLocation> locationSet = new HashSet<CompanyLocation>();
		   Iterable<CompanyLocation> companyLocation=locationService.findAll();
		   for(CompanyLocation companyLoc: companyLocation){
			   locationSet.add(companyLoc);
		   }
		   company.setLocations(locationSet);
		   
		   Set<CompanyDepartment> departmentSet = new HashSet<CompanyDepartment>();
		   Iterable<CompanyDepartment> companyDepartment=departmentService.findAll();
		   for(CompanyDepartment companyDept: companyDepartment){
			   departmentSet.add(companyDept);
		   }		  
		   company.setDepartments(departmentSet);
		   
		   Set<Agency> agencySet = new HashSet<Agency>();
		   Iterable<Agency> agency=agencyService.findAll();
		   for(Agency companyAgency: agency){
			   agencySet.add(companyAgency);
		   }		  
		   company.setAgencys(agencySet);		   
		   companyService.save(company);
		if (isSearchActivated(searchFor)) {
			return search(searchFor, page, locale, "message.update.success");
		}
		return createListAllResponse(page, locale, "message.update.success");
	}

	@RequestMapping(value = "/{companyId}", method = RequestMethod.DELETE, produces = "application/json")
	public ResponseEntity<?> delete(
			@PathVariable("companyId") int companyId,
			@RequestParam(required = false) String searchFor,
			@RequestParam(required = false, defaultValue = DEFAULT_PAGE_DISPLAYED_TO_USER) int page,
			Locale locale) {

		try {
			companyService.delete(companyId);
		} catch (AccessDeniedException e) {
			return new ResponseEntity<Object>(HttpStatus.FORBIDDEN);
		}

		if (isSearchActivated(searchFor)) {
			return search(searchFor, page, locale, "message.delete.success");
		}

		return createListAllResponse(page, locale, "message.delete.success");
	}

	@RequestMapping(value = "/{name}", method = RequestMethod.GET, produces = "application/json")
	public ResponseEntity<?> search(
			@PathVariable("name") String name,
			@RequestParam(required = false, defaultValue = DEFAULT_PAGE_DISPLAYED_TO_USER) int page,
			Locale locale) {
		return search(name, page, locale, null);
	}

	private ResponseEntity<?> search(String name, int page, Locale locale,
			String actionMessageKey) {
		CompanyListVO companyListVO = companyService.findByNameLike(page,
				maxResults, name);

		if (!StringUtils.isEmpty(actionMessageKey)) {
			addActionMessageToVO(companyListVO, locale, actionMessageKey, null);
		}

		Object[] args = { name };

		addSearchMessageToVO(companyListVO, locale,
				"message.search.for.active", args);

		return new ResponseEntity<CompanyListVO>(companyListVO, HttpStatus.OK);
	}

	private CompanyListVO listAll(int page) {
		return companyService.findAll(page, maxResults);
	}

	private ResponseEntity<CompanyListVO> returnListToUser(
			CompanyListVO companyList) {
		return new ResponseEntity<CompanyListVO>(companyList, HttpStatus.OK);
	}

	private ResponseEntity<?> createListAllResponse(int page, Locale locale) {
		return createListAllResponse(page, locale, null);
	}

	private ResponseEntity<?> createListAllResponse(int page, Locale locale,String messageKey) {
		CompanyListVO companyListVO = listAll(page);

		addActionMessageToVO(companyListVO, locale, messageKey, null);

		return returnListToUser(companyListVO);
	}

	private CompanyListVO addActionMessageToVO(CompanyListVO companyListVO,
			Locale locale, String actionMessageKey, Object[] args) {
		if (StringUtils.isEmpty(actionMessageKey)) {
			return companyListVO;
		}

		companyListVO.setActionMessage(messageSource.getMessage(
				actionMessageKey, args, null, locale));

		return companyListVO;
	}

	private CompanyListVO addSearchMessageToVO(CompanyListVO companyListVO,
			Locale locale, String actionMessageKey, Object[] args) {
		if (StringUtils.isEmpty(actionMessageKey)) {
			return companyListVO;
		}

		companyListVO.setSearchMessage(messageSource.getMessage(
				actionMessageKey, args, null, locale));

		return companyListVO;
	}

	private boolean isSearchActivated(String searchFor) {
		return !StringUtils.isEmpty(searchFor);
	}
}
