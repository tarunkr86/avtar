<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="masthead">
    <h4 class="muted">
        <spring:message code='Administration'/>
    </h4>

    <div class="navbar">
        <div class="navbar-inner">
            <div class="container">
            
                <ul class="nav" ng-controller="LocationController">
                  <!--   <li ng-class="{'active': activeURL == 'home', '': activeURL != 'home'}" >
                        <a href="<c:url value="/"/>" title='<spring:message code="header.home"/>' ><p><spring:message code="header.home"/></p></a>
                    </li>-->
                 <!--    <li ng-class="{'gray': activeURL == 'contacts', '': activeURL != 'contacts'}"><a title='<spring:message code="header.contacts"/>' href="<c:url value='/protected/contacts'/>"><p><spring:message code="header.contacts"/></p></a></li>
              -->  <li class="dropdown" >
              
                        <a href="#" data-toggle="dropdown" class="dropdown-toggle">Organization <b class="caret"></b></a>
                        <ul class="dropdown-menu" ng-controller="LocationController">
                            <li ng-class="{'gray': activeURL == 'company', '': activeURL != 'company'}"><a title='<spring:message code="header.company"/>' href="<c:url value='/protected/company'/>"><p><spring:message code="header.company"/></p></a></li>            
                            <li class="divider"></li>
                            <li ng-class="{'gray': activeURL == 'locations', '': activeURL != 'locations'}"><a title='<spring:message code="header.locations"/>' href="<c:url value='/protected/locations'/>"><p><spring:message code="header.locations"/></p></a></li>                                     
                            <li class="divider"></li>
                            <li ng-class="{'gray': activeURL == 'departments', '': activeURL != 'departments'}"><a title='<spring:message code="header.departments"/>' href="<c:url value='/protected/departments'/>"><p><spring:message code="header.departments"/></p></a></li>                                     
                         
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" data-toggle="dropdown" class="dropdown-toggle">Templates <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li ng-class="{'gray': activeURL == 'positions', '': activeURL != 'positions'}"><a title='<spring:message code="header.positions"/>' href="<c:url value='/protected/positions'/>"><p><spring:message code="header.positions"/></p></a></li>              
                            <li class="divider"></li>
                            <li ng-class="{'gray': activeURL == 'emailCategorys', '': activeURL != 'emailCategorys'}"><a title='<spring:message code="header.emailCategorys"/>' href="<c:url value='/protected/emailCategorys'/>"><p><spring:message code="header.emailCategorys"/></p></a></li>              
                             <li class="divider"></li>
                            <li ng-class="{'gray': activeURL == 'emailTemplates', '': activeURL != 'emailTemplates'}"><a title='<spring:message code="header.emailTemplates"/>' href="<c:url value='/protected/emailTemplates'/>"><p><spring:message code="header.emailTemplates"/></p></a></li>                                                                                         
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" data-toggle="dropdown" class="dropdown-toggle">User Manager <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                             <li ng-class="{'gray': activeURL == 'users', '': activeURL != 'users'}"><a title='<spring:message code="header.users"/>' href="<c:url value='/protected/users'/>"><p><spring:message code="header.users"/></p></a></li>                                                             
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" data-toggle="dropdown" class="dropdown-toggle">Agency Setup <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                             <li ng-class="{'gray': activeURL == 'agencys', '': activeURL != 'agencys'}"><a title='<spring:message code="header.agencys"/>' href="<c:url value='/protected/agencys'/>"><p><spring:message code="header.agencys"/></p></a></li>                                                                 
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" data-toggle="dropdown" class="dropdown-toggle">Job Types <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li ng-class="{'gray': activeURL == 'jobTypes', '': activeURL != 'jobTypes'}"><a title='<spring:message code="header.jobTypes"/>' href="<c:url value='/protected/jobTypes'/>"><p><spring:message code="header.jobTypes"/></p></a></li>                                                                                                         
                        </ul>
                    </li>
                </ul>
                <ul class="nav pull-right">
                    <li><a href="<c:url value='/logout' />" title='<spring:message code="header.logout"/>'><p class="displayInLine"><spring:message code="header.logout"/>&nbsp;:${user.name}</p></a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
