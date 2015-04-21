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

import avtar.model.CompanyDepartment;
import avtar.model.User;
import avtar.service.CompanyService;
import avtar.service.DepartmentService;
import avtar.service.UserService;
import avtar.vo.UserListVO;

@Controller
@RequestMapping(value = "/protected/users")
public class UserController {

	private static final String DEFAULT_PAGE_DISPLAYED_TO_USER = "0";

	@Autowired
	private UserService userService;

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
		return new ModelAndView("usersList");
	}

	@RequestMapping(method = RequestMethod.GET, produces = "application/json")
	public ResponseEntity<?> listAll(@RequestParam int page, Locale locale) {
		return createListAllResponse(page, locale);
	}

	@RequestMapping( method = RequestMethod.POST, produces = "application/json")
	public ResponseEntity<?> create(
			
			@ModelAttribute("user") User user,
			@RequestParam int departmentId,
			@RequestParam(required = false) String searchFor,
			@RequestParam(required = false, defaultValue = DEFAULT_PAGE_DISPLAYED_TO_USER) int page,
			Locale locale) {

		if(departmentId>0){
			CompanyDepartment department = departmentService.findById(departmentId);
			user.setCompanyDepartment(department);
		}else{
			user.setCompanyDepartment(null);
		}
		userService.save(user);
		if (isSearchActivated(searchFor)) {
			return search(searchFor, page, locale, "message.create.success");
		}

		return createListAllResponse(page, locale, "message.create.success");
	}

	@RequestMapping(value = "/{userId}", method = RequestMethod.PUT, produces = "application/json")
	public ResponseEntity<?> update(
			@PathVariable("userId") int userId,
			@RequestBody User user,
			@RequestParam(required = false) String searchFor,
			@RequestParam(required = false, defaultValue = DEFAULT_PAGE_DISPLAYED_TO_USER) int page,
			Locale locale) {

		 if (userId != user.getId()) {
		     return new ResponseEntity<String>("Bad Request",
		     HttpStatus.BAD_REQUEST);
		 }
		if(user.getCompanyDepartment().getId()>0){
			CompanyDepartment department = departmentService.findById(user.getCompanyDepartment().getId());
			user.setCompanyDepartment(department);
		}else{
			user.setCompanyDepartment(null);
		}
		
		userService.save(user);
		if (isSearchActivated(searchFor)) {
			return search(searchFor, page, locale, "message.update.success");
		}

		return createListAllResponse(page, locale, "message.update.success");
	}

	@RequestMapping(value = "/{userId}", method = RequestMethod.DELETE, produces = "application/json")
	public ResponseEntity<?> delete(
			@PathVariable("userId") int userId,
			@RequestParam(required = false) String searchFor,
			@RequestParam(required = false, defaultValue = DEFAULT_PAGE_DISPLAYED_TO_USER) int page,
			Locale locale) {

		try {
			User usr = userService.findById(userId);
			usr.setCompanyDepartment(null);
			userService.save(usr);
			userService.delete(userId);
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
		UserListVO userListVO = userService.findByNameLike(page, maxResults,
				name);

		if (!StringUtils.isEmpty(actionMessageKey)) {
			addActionMessageToVO(userListVO, locale, actionMessageKey, null);
		}

		Object[] args = { name };

		addSearchMessageToVO(userListVO, locale, "message.search.for.active",
				args);

		return new ResponseEntity<UserListVO>(userListVO, HttpStatus.OK);
	}

	private UserListVO listAll(int page) {
		return userService.findAll(page, maxResults);
	}

	private ResponseEntity<UserListVO> returnListToUser(UserListVO userList) {
		return new ResponseEntity<UserListVO>(userList, HttpStatus.OK);
	}

	private ResponseEntity<?> createListAllResponse(int page, Locale locale) {
		return createListAllResponse(page, locale, null);
	}

	private ResponseEntity<?> createListAllResponse(int page, Locale locale,
			String messageKey) {
		UserListVO userListVO = listAll(page);

		addActionMessageToVO(userListVO, locale, messageKey, null);

		return returnListToUser(userListVO);
	}

	private UserListVO addActionMessageToVO(UserListVO userListVO,
			Locale locale, String actionMessageKey, Object[] args) {
		if (StringUtils.isEmpty(actionMessageKey)) {
			return userListVO;
		}

		userListVO.setActionMessage(messageSource.getMessage(actionMessageKey,
				args, null, locale));

		return userListVO;
	}

	private UserListVO addSearchMessageToVO(UserListVO userListVO,
			Locale locale, String actionMessageKey, Object[] args) {
		if (StringUtils.isEmpty(actionMessageKey)) {
			return userListVO;
		}

		userListVO.setSearchMessage(messageSource.getMessage(actionMessageKey,
				args, null, locale));

		return userListVO;
	}

	private boolean isSearchActivated(String searchFor) {
		return !StringUtils.isEmpty(searchFor);
	}
}