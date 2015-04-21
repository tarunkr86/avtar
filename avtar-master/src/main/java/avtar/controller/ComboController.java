package avtar.controller;

import java.util.Locale;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.MessageSource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import avtar.service.CompanyService;
import avtar.service.DepartmentService;
import avtar.service.LocationService;
import avtar.service.PositionService;
import avtar.service.UserService;
import avtar.vo.DepartmentListVO;

@Controller
@RequestMapping(value = "/protected/combos")
public class ComboController {
	
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

	@Value("1000")
	private int maxResults;

	@RequestMapping(value = "/department-combo", method = RequestMethod.GET, produces = "application/json")
	public ResponseEntity<?> listAllDepartment(@RequestParam int page,	Locale locale) {

		   return createListAllResponseDepartment(page, locale);
	}

	private ResponseEntity<?> createListAllResponseDepartment(int page, Locale locale) {
		return createListAllResponseDepartment(page, locale, null);
	}

	private ResponseEntity<?> createListAllResponseDepartment(int page, Locale locale,String messageKey) {
		
		DepartmentListVO departmentListVO = listAllDepartment(page);
		addActionMessageToVODepartment(departmentListVO, locale, messageKey, null);
		return returnListToUserDepartment(departmentListVO);
	}

	private DepartmentListVO addActionMessageToVODepartment(DepartmentListVO departmentListVO, Locale locale,String actionMessageKey, Object[] args) {
		if (StringUtils.isEmpty(actionMessageKey)) {
			return departmentListVO;
		}
		departmentListVO.setActionMessage(messageSource.getMessage(	actionMessageKey, args, null, locale));
		return departmentListVO;
	}

	private DepartmentListVO listAllDepartment(int page) {
		return departmentService.findAll(page, maxResults);
	}

	private ResponseEntity<DepartmentListVO> returnListToUserDepartment(DepartmentListVO departmentList) {
		return new ResponseEntity<DepartmentListVO>(departmentList,	HttpStatus.OK);
	}
	/************************************next combo write here ***********************************/
}
