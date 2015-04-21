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
import avtar.model.Nationality;

import avtar.service.AgencyService;
import avtar.service.NationalityService;
import avtar.service.DepartmentService;
import avtar.service.LocationService;
import avtar.service.UserService;
import avtar.vo.NationalityListVO;

@Controller
@RequestMapping(value = "/protected/nationalitys")
public class NationalityController {
	
	private static final String DEFAULT_PAGE_DISPLAYED_TO_USER = "0";

	@Autowired
	private NationalityService nationalityService;
	
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

	@Value("1000")
	private int maxResults;

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView welcome() {
		return new ModelAndView("nationalityList");
	}

	@RequestMapping(method = RequestMethod.GET, produces = "application/json")
	public ResponseEntity<?> listAll(@RequestParam int page, Locale locale) {
		return createListAllResponse(page, locale);
	}

	

	private NationalityListVO listAll(int page) {
		return nationalityService.findAll(page, maxResults);
	}

	private ResponseEntity<NationalityListVO> returnListToUser(
			NationalityListVO nationalityList) {
		return new ResponseEntity<NationalityListVO>(nationalityList, HttpStatus.OK);
	}

	private ResponseEntity<?> createListAllResponse(int page, Locale locale) {
		return createListAllResponse(page, locale, null);
	}

	private ResponseEntity<?> createListAllResponse(int page, Locale locale,String messageKey) {
		NationalityListVO nationalityListVO = listAll(page);

		addActionMessageToVO(nationalityListVO, locale, messageKey, null);

		return returnListToUser(nationalityListVO);
	}

	private NationalityListVO addActionMessageToVO(NationalityListVO nationalityListVO,
			Locale locale, String actionMessageKey, Object[] args) {
		if (StringUtils.isEmpty(actionMessageKey)) {
			return nationalityListVO;
		}

		nationalityListVO.setActionMessage(messageSource.getMessage(
				actionMessageKey, args, null, locale));

		return nationalityListVO;
	}

	private NationalityListVO addSearchMessageToVO(NationalityListVO nationalityListVO,
			Locale locale, String actionMessageKey, Object[] args) {
		if (StringUtils.isEmpty(actionMessageKey)) {
			return nationalityListVO;
		}

		nationalityListVO.setSearchMessage(messageSource.getMessage(
				actionMessageKey, args, null, locale));

		return nationalityListVO;
	}

	private boolean isSearchActivated(String searchFor) {
		return !StringUtils.isEmpty(searchFor);
	}

}
