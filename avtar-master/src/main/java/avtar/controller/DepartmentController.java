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

import avtar.model.Company;
import avtar.model.CompanyDepartment;
import avtar.model.CompanyLocation;
import avtar.model.Position;
import avtar.model.User;
import avtar.service.CompanyService;
import avtar.service.DepartmentService;
import avtar.service.LocationService;
import avtar.service.PositionService;
import avtar.service.UserService;
import avtar.vo.DepartmentListVO;

@Controller
@RequestMapping(value = "/protected/departments")
public class DepartmentController {

	private static final String DEFAULT_PAGE_DISPLAYED_TO_USER = "0";

	@Autowired
	private CompanyService companyService;
	
	@Autowired
	private LocationService locationService;
	
	@Autowired
	private DepartmentService departmentService;

	 @Autowired
	 private PositionService positionService;
	
	 @Autowired
	 private UserService userService;
	 
	@Autowired
	private MessageSource messageSource;

	@Value("15")
	private int maxResults;

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView welcome() {
		return new ModelAndView("departmentList");
	}

	@RequestMapping(method = RequestMethod.GET, produces = "application/json")
	public ResponseEntity<?> listAll(@RequestParam int page, Locale locale) {
		return createListAllResponse(page, locale);
	}


	@RequestMapping(method = RequestMethod.POST, produces = "application/json")
	public ResponseEntity<?> create(
			@ModelAttribute("companydepartment") CompanyDepartment companyDepartment,
			@RequestParam(required = false) String searchFor,
			@RequestParam(required = false, defaultValue = DEFAULT_PAGE_DISPLAYED_TO_USER) int page,
			Locale locale) {
		   int id=15;		   
		   Company company= companyService.findById(id);
		   Set<CompanyLocation> locationSet = new HashSet<CompanyLocation>();
		   Iterable<CompanyLocation> companyLocation=locationService.findAll();
		   for(CompanyLocation companyLoc: companyLocation){
			   locationSet.add(companyLoc);
		   }
		   //CompanyDepartment department=company.addDepartment(companyDepartment);
		   companyDepartment.setCompanyLocations( locationSet);
		   companyDepartment.setCompany(company);		   		 
		  // companyService.save(company);
		   departmentService.save(companyDepartment);

		if (isSearchActivated(searchFor)) {
			return search(searchFor, page, locale, "message.create.success");
		}

		return createListAllResponse(page, locale, "message.create.success");
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.PUT, produces = "application/json")
	public ResponseEntity<?> update(
			@PathVariable("id") int departmentId,
			@RequestBody CompanyDepartment companyDepartment,
			@RequestParam(required = false) String searchFor,
			@RequestParam(required = false, defaultValue = DEFAULT_PAGE_DISPLAYED_TO_USER) int page,Locale locale) {
						
		if (departmentId != companyDepartment.getId()) {
			return new ResponseEntity<String>("Bad Request",HttpStatus.BAD_REQUEST);
		}
		 int id=15;		   
		   Company company= companyService.findById(id);
		   Set<CompanyLocation> locationSet = new HashSet<CompanyLocation>();
		   Iterable<CompanyLocation> companyLocation=locationService.findAll();
		   for(CompanyLocation companyLoc: companyLocation){
			   locationSet.add(companyLoc);
		   }
		  
		   Set<Position> positionSet = new HashSet<Position>();
		   Iterable<Position> companyPosition=positionService.findAll();
		   for(Position companyPos: companyPosition){
			   positionSet.add(companyPos);
		   }
		
		   Set<User> userSet = new HashSet<User>();
		   Iterable<User> companyUser=userService.findByDepartmentId(departmentId);
		   for(User companyUsr: companyUser){
			   userSet.add(companyUsr);
		   }
		   
		   companyDepartment.setCompanyLocations( locationSet);
		   companyDepartment.setCompany(company);
		   companyDepartment.setPositions(positionSet);
		   companyDepartment.setUsers(userSet);
		   departmentService.save(companyDepartment);		 
		  
		if (isSearchActivated(searchFor)) {
			return search(searchFor, page, locale, "message.update.success");
		}
		return createListAllResponse(page, locale, "message.update.success");
	}

	@RequestMapping(value = "/{departmentId}", method = RequestMethod.DELETE, produces = "application/json")
	public ResponseEntity<?> delete(
			@PathVariable("departmentId") int departmentId,
			@RequestParam(required = false) String searchFor,
			@RequestParam(required = false, defaultValue = DEFAULT_PAGE_DISPLAYED_TO_USER) int page,
			Locale locale) {

		try {
			departmentService.delete(departmentId);
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
		DepartmentListVO departmentListVO = departmentService.findByNameLike(page,
				maxResults, name);

		if (!StringUtils.isEmpty(actionMessageKey)) {
			addActionMessageToVO(departmentListVO, locale, actionMessageKey, null);
		}

		Object[] args = { name };

		addSearchMessageToVO(departmentListVO, locale,
				"message.search.for.active", args);

		return new ResponseEntity<DepartmentListVO>(departmentListVO, HttpStatus.OK);
	}

	private DepartmentListVO listAll(int page) {
		return departmentService.findAll(page, maxResults);
	}

	private ResponseEntity<DepartmentListVO> returnListToUser(DepartmentListVO departmentList) {
		return new ResponseEntity<DepartmentListVO>(departmentList, HttpStatus.OK);
	}

	private ResponseEntity<?> createListAllResponse(int page, Locale locale) {
		return createListAllResponse(page, locale, null);
	}

	private ResponseEntity<?> createListAllResponse(int page, Locale locale,String messageKey) {
		DepartmentListVO departmentListVO = listAll(page);

		addActionMessageToVO(departmentListVO, locale, messageKey, null);

		return returnListToUser(departmentListVO);
	}

	private DepartmentListVO addActionMessageToVO(DepartmentListVO departmentListVO,
			Locale locale, String actionMessageKey, Object[] args) {
		if (StringUtils.isEmpty(actionMessageKey)) {
			return departmentListVO;
		}

		departmentListVO.setActionMessage(messageSource.getMessage(
				actionMessageKey, args, null, locale));

		return departmentListVO;
	}

	private DepartmentListVO addSearchMessageToVO(DepartmentListVO departmentListVO,
			Locale locale, String actionMessageKey, Object[] args) {
		if (StringUtils.isEmpty(actionMessageKey)) {
			return departmentListVO;
		}

		departmentListVO.setSearchMessage(messageSource.getMessage(
				actionMessageKey, args, null, locale));

		return departmentListVO;
	}

	private boolean isSearchActivated(String searchFor) {
		return !StringUtils.isEmpty(searchFor);
	}
}

