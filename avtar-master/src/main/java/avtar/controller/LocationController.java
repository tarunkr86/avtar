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

import avtar.model.Company;
import avtar.model.CompanyLocation;
import avtar.service.CompanyService;
import avtar.service.LocationService;
import avtar.vo.LocationListVO;

@Controller
@RequestMapping(value = "/protected/locations")
public class LocationController {

	private static final String DEFAULT_PAGE_DISPLAYED_TO_USER = "0";

	@Autowired
	private CompanyService companyService;
	
	@Autowired
	private LocationService locationService;

	@Autowired
	private MessageSource messageSource;

	@Value("15")
	private int maxResults;

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView welcome() {
		return new ModelAndView("locationList");
	}

	@RequestMapping(method = RequestMethod.GET, produces = "application/json")
	public ResponseEntity<?> listAll(@RequestParam int page, Locale locale) {
		return createListAllResponse(page, locale);
	}

	@RequestMapping(method = RequestMethod.POST, produces = "application/json")
	public ResponseEntity<?> create(
			@ModelAttribute("companylocation") CompanyLocation companyLocation,
			@RequestParam(required = false) String searchFor,
			@RequestParam(required = false, defaultValue = DEFAULT_PAGE_DISPLAYED_TO_USER) int page,
			Locale locale) {
		   int id=15;		   
		   Company company= companyService.findById(id);		  
		   CompanyLocation location=company.addLocation(companyLocation);
		   location.setCompany(company);		   		 
		  // companyService.save(company);
		   locationService.save(companyLocation);

		if (isSearchActivated(searchFor)) {
			return search(searchFor, page, locale, "message.create.success");
		}

		return createListAllResponse(page, locale, "message.create.success");
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.PUT, produces = "application/json")
	public ResponseEntity<?> update(
			@PathVariable("id") int locationId,
			@RequestBody CompanyLocation companyLocation,
			@RequestParam(required = false) String searchFor,
			@RequestParam(required = false, defaultValue = DEFAULT_PAGE_DISPLAYED_TO_USER) int page,Locale locale) {
						
		if (locationId != companyLocation.getId()) {
			return new ResponseEntity<String>("Bad Request",HttpStatus.BAD_REQUEST);
		}
		int id=15;		   
		   Company company= companyService.findById(id);		  
		   CompanyLocation location=company.addLocation(companyLocation);
		   location.setCompany(company);	
		  locationService.save(location);
		if (isSearchActivated(searchFor)) {
			return search(searchFor, page, locale, "message.update.success");
		}
		return createListAllResponse(page, locale, "message.update.success");
	}

	@RequestMapping(value = "/{locationId}", method = RequestMethod.DELETE, produces = "application/json")
	public ResponseEntity<?> delete(
			@PathVariable("locationId") int locationId,
			@RequestParam(required = false) String searchFor,
			@RequestParam(required = false, defaultValue = DEFAULT_PAGE_DISPLAYED_TO_USER) int page,
			Locale locale) {

		try {
			locationService.delete(locationId);
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
		LocationListVO locationListVO = locationService.findByNameLike(page,
				maxResults, name);

		if (!StringUtils.isEmpty(actionMessageKey)) {
			addActionMessageToVO(locationListVO, locale, actionMessageKey, null);
		}

		Object[] args = { name };

		addSearchMessageToVO(locationListVO, locale,
				"message.search.for.active", args);

		return new ResponseEntity<LocationListVO>(locationListVO, HttpStatus.OK);
	}

	private LocationListVO listAll(int page) {
		return locationService.findAll(page, maxResults);
	}

	private ResponseEntity<LocationListVO> returnListToUser(
			LocationListVO locationList) {
		return new ResponseEntity<LocationListVO>(locationList, HttpStatus.OK);
	}

	private ResponseEntity<?> createListAllResponse(int page, Locale locale) {
		return createListAllResponse(page, locale, null);
	}

	private ResponseEntity<?> createListAllResponse(int page, Locale locale,String messageKey) {
		LocationListVO locationListVO = listAll(page);

		addActionMessageToVO(locationListVO, locale, messageKey, null);

		return returnListToUser(locationListVO);
	}

	private LocationListVO addActionMessageToVO(LocationListVO locationListVO,
			Locale locale, String actionMessageKey, Object[] args) {
		if (StringUtils.isEmpty(actionMessageKey)) {
			return locationListVO;
		}

		locationListVO.setActionMessage(messageSource.getMessage(
				actionMessageKey, args, null, locale));

		return locationListVO;
	}

	private LocationListVO addSearchMessageToVO(LocationListVO locationListVO,
			Locale locale, String actionMessageKey, Object[] args) {
		if (StringUtils.isEmpty(actionMessageKey)) {
			return locationListVO;
		}

		locationListVO.setSearchMessage(messageSource.getMessage(
				actionMessageKey, args, null, locale));

		return locationListVO;
	}

	private boolean isSearchActivated(String searchFor) {
		return !StringUtils.isEmpty(searchFor);
	}
}

