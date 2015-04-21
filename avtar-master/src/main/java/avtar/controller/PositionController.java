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
import avtar.model.Position;
import avtar.service.DepartmentService;
import avtar.service.PositionService;
import avtar.vo.PositionListVO;

@Controller
@RequestMapping(value = "/protected/positions")
public class PositionController {

    private static final String DEFAULT_PAGE_DISPLAYED_TO_USER = "0";

    @Autowired
    private PositionService positionService;

    @Autowired
	private DepartmentService departmentService;
    
    @Autowired
    private MessageSource messageSource;

    @Value("15")
    private int maxResults;

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView welcome() {
        return new ModelAndView("positionsList");
    }

    @RequestMapping(method = RequestMethod.GET, produces = "application/json")
    public ResponseEntity<?> listAll(@RequestParam int page, Locale locale) {
        return createListAllResponse(page, locale);
    }

    @RequestMapping(value = "/{departmentId}",method = RequestMethod.POST, produces = "application/json")
    public ResponseEntity<?> create(@PathVariable("departmentId") int departmentId,
    		                        @ModelAttribute("position") Position position,
                                    @RequestParam(required = false) String searchFor,
                                    @RequestParam(required = false, defaultValue = DEFAULT_PAGE_DISPLAYED_TO_USER) int page,
                                    Locale locale) {
    	   		   
		   CompanyDepartment department= departmentService.findById(departmentId);		  		
		   position.setDepartment(department);		   		 		 
		   positionService.save(position);      
        if (isSearchActivated(searchFor)) {
            return search(searchFor, page, locale, "message.create.success");
        }

        return createListAllResponse(page, locale, "message.create.success");
    }

    @RequestMapping(value = "/{departmentId}", method = RequestMethod.PUT, produces = "application/json")
    public ResponseEntity<?> update(@PathVariable("departmentId") int departmentId,
                                    @RequestBody Position position,
                                    @RequestParam(required = false) String searchFor,
                                    @RequestParam(required = false, defaultValue = DEFAULT_PAGE_DISPLAYED_TO_USER) int page,
                                    Locale locale) {
    	
       // if (positionId != position.getId()) {
           // return new ResponseEntity<String>("Bad Request", HttpStatus.BAD_REQUEST);
        //}
          		   
		   CompanyDepartment department= departmentService.findById(departmentId);		  		 
		   position.setDepartment(department);		   		 		 
		   positionService.save(position);      
        if (isSearchActivated(searchFor)) {
            return search(searchFor, page, locale, "message.update.success");
        }

        return createListAllResponse(page, locale, "message.update.success");
    }

    @RequestMapping(value = "/{positionId}", method = RequestMethod.DELETE, produces = "application/json")
    public ResponseEntity<?> delete(@PathVariable("positionId") int positionId,
                                    @RequestParam(required = false) String searchFor,
                                    @RequestParam(required = false, defaultValue = DEFAULT_PAGE_DISPLAYED_TO_USER) int page, Locale locale) {

        try {
        	Position pos=positionService.findById(positionId);
        	pos.setDepartment(null);
        	positionService.save(pos);
            positionService.delete(positionId);
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
        PositionListVO positionListVO = positionService.findByNameLike(page, maxResults, name);

        if (!StringUtils.isEmpty(actionMessageKey)) {
            addActionMessageToVO(positionListVO, locale, actionMessageKey, null);
        }

        Object[] args = {name};

        addSearchMessageToVO(positionListVO, locale, "message.search.for.active", args);

        return new ResponseEntity<PositionListVO>(positionListVO, HttpStatus.OK);
    }

    private PositionListVO listAll(int page) {
        return positionService.findAll(page, maxResults);
    }

    private ResponseEntity<PositionListVO> returnListToUser(PositionListVO positionList) {
        return new ResponseEntity<PositionListVO>(positionList, HttpStatus.OK);
    }

    private ResponseEntity<?> createListAllResponse(int page, Locale locale) {
        return createListAllResponse(page, locale, null);
    }

    private ResponseEntity<?> createListAllResponse(int page, Locale locale, String messageKey) {
        PositionListVO positionListVO = listAll(page);

        addActionMessageToVO(positionListVO, locale, messageKey, null);

        return returnListToUser(positionListVO);
    }

    private PositionListVO addActionMessageToVO(PositionListVO positionListVO, Locale locale, String actionMessageKey, Object[] args) {
        if (StringUtils.isEmpty(actionMessageKey)) {
            return positionListVO;
        }

        positionListVO.setActionMessage(messageSource.getMessage(actionMessageKey, args, null, locale));

        return positionListVO;
    }

    private PositionListVO addSearchMessageToVO(PositionListVO positionListVO, Locale locale, String actionMessageKey, Object[] args) {
        if (StringUtils.isEmpty(actionMessageKey)) {
            return positionListVO;
        }

        positionListVO.setSearchMessage(messageSource.getMessage(actionMessageKey, args, null, locale));

        return positionListVO;
    }

    private boolean isSearchActivated(String searchFor) {
        return !StringUtils.isEmpty(searchFor);
    }
}