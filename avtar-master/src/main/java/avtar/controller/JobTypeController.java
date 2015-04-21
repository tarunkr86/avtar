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

import avtar.model.JobType;
import avtar.service.CompanyService;
import avtar.service.DepartmentService;
import avtar.service.JobTypeService;
import avtar.vo.JobTypeListVO;

@Controller
@RequestMapping(value = "/protected/jobTypes")
public class JobTypeController {
	
	private static final String DEFAULT_PAGE_DISPLAYED_TO_USER = "0";

	@Autowired
	private JobTypeService jobTypeService;

	@Autowired
	private DepartmentService departmentService;

	@Autowired
	private CompanyService companyService;

	@Autowired
	private MessageSource messageSource;

	@Value("15")
	private int maxResults;

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView welcome() {
		return new ModelAndView("jobTypesList");
	}

	@RequestMapping(method = RequestMethod.GET, produces = "application/json")
	public ResponseEntity<?> listAll(@RequestParam int page, Locale locale) {
		return createListAllResponse(page, locale);
	}

	@RequestMapping( method = RequestMethod.POST, produces = "application/json")
	public ResponseEntity<?> create(
			
			@ModelAttribute("jobType") JobType jobType,
			@RequestParam(required = false) String searchFor,
			@RequestParam(required = false, defaultValue = DEFAULT_PAGE_DISPLAYED_TO_USER) int page,
			Locale locale) {		
		jobTypeService.save(jobType);
		if (isSearchActivated(searchFor)) {
			return search(searchFor, page, locale, "message.create.success");
		}

		return createListAllResponse(page, locale, "message.create.success");
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.PUT, produces = "application/json")
	public ResponseEntity<?> update(
			@PathVariable("id") int jobTypeId,
			@RequestBody JobType jobType,
			@RequestParam(required = false) String searchFor,
			@RequestParam(required = false, defaultValue = DEFAULT_PAGE_DISPLAYED_TO_USER) int page,
			Locale locale) {

		 if (jobTypeId != jobType.getId()) {
		 return new ResponseEntity<String>("Bad Request",
		 HttpStatus.BAD_REQUEST);
		 }		
		jobTypeService.save(jobType);
		if (isSearchActivated(searchFor)) {
			return search(searchFor, page, locale, "message.update.success");
		}

		return createListAllResponse(page, locale, "message.update.success");
	}

	@RequestMapping(value = "/{jobTypeId}", method = RequestMethod.DELETE, produces = "application/json")
	public ResponseEntity<?> delete(
			@PathVariable("jobTypeId") int jobTypeId,
			@RequestParam(required = false) String searchFor,
			@RequestParam(required = false, defaultValue = DEFAULT_PAGE_DISPLAYED_TO_USER) int page,
			Locale locale) {

		try {			
			jobTypeService.delete(jobTypeId);
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
		JobTypeListVO jobTypeListVO = jobTypeService.findByNameLike(page, maxResults,
				name);

		if (!StringUtils.isEmpty(actionMessageKey)) {
			addActionMessageToVO(jobTypeListVO, locale, actionMessageKey, null);
		}

		Object[] args = { name };

		addSearchMessageToVO(jobTypeListVO, locale, "message.search.for.active",
				args);

		return new ResponseEntity<JobTypeListVO>(jobTypeListVO, HttpStatus.OK);
	}

	private JobTypeListVO listAll(int page) {
		return jobTypeService.findAll(page, maxResults);
	}

	private ResponseEntity<JobTypeListVO> returnListToJobType(JobTypeListVO jobTypeList) {
		return new ResponseEntity<JobTypeListVO>(jobTypeList, HttpStatus.OK);
	}

	private ResponseEntity<?> createListAllResponse(int page, Locale locale) {
		return createListAllResponse(page, locale, null);
	}

	private ResponseEntity<?> createListAllResponse(int page, Locale locale,
			String messageKey) {
		JobTypeListVO jobTypeListVO = listAll(page);

		addActionMessageToVO(jobTypeListVO, locale, messageKey, null);

		return returnListToJobType(jobTypeListVO);
	}

	private JobTypeListVO addActionMessageToVO(JobTypeListVO jobTypeListVO,
			Locale locale, String actionMessageKey, Object[] args) {
		if (StringUtils.isEmpty(actionMessageKey)) {
			return jobTypeListVO;
		}

		jobTypeListVO.setActionMessage(messageSource.getMessage(actionMessageKey,
				args, null, locale));

		return jobTypeListVO;
	}

	private JobTypeListVO addSearchMessageToVO(JobTypeListVO jobTypeListVO,
			Locale locale, String actionMessageKey, Object[] args) {
		if (StringUtils.isEmpty(actionMessageKey)) {
			return jobTypeListVO;
		}

		jobTypeListVO.setSearchMessage(messageSource.getMessage(actionMessageKey,
				args, null, locale));

		return jobTypeListVO;
	}

	private boolean isSearchActivated(String searchFor) {
		return !StringUtils.isEmpty(searchFor);
	}
}
