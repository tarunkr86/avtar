<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">
<ul class="breadcrumb">
    <li><a href="#">You are here : Organization</a> <span class="divider">/</span></li>
    <li><a href="#">Company</a> <span class="divider">/</span></li>   
    </ul>
</div>
<div class="row-fluid" ng-controller="companyController">
	<div ng-class="{'text-center': displayCreateCompanyButton == false, 'none': displayCreateCompanyButton == false}">
			<br /> <a href="#addCompanyModal" role="button"
				ng-click="resetCompany();"
				title="<spring:message code='create'/>&nbsp;<spring:message code='company'/>"
				class="btn btn-inverse" data-toggle="modal"> <i
				class="icon-plus"></i> &nbsp;&nbsp;<spring:message code="create" />&nbsp;<spring:message
					code="company" />
			</a>
		</div>	
	<div>			
		<div
			ng-class="{'alert badge-inverse': displayMessageToUser == true, 'none': displayMessageToUser == false}">
			<h4 class="displayInLine">
				<p class="messageToUser displayInLine">
					<i class="icon-info-sign"></i>&nbsp;{{page.actionMessage}}
				</p>
			</h4>
		</div>

		<div
			ng-class="{'alert alert-block alert-error': state == 'error', 'none': state != 'error'}">
			<h4>
				<i class="icon-info-sign"></i>
				<spring:message code="error.generic.header" />
			</h4>
			<br />

			<p>
				<spring:message code="error.generic.text" />
			</p>
		</div>

		<div
			ng-class="{'alert alert-info': state == 'noresult', 'none': state != 'noresult'}">
			<h4>
				<i class="icon-info-sign"></i>
				<spring:message code="company.emptyData" />
			</h4>
			<br />

			<p>
				<spring:message code="company.emptyData.text" />
			</p>
		</div>

		<div id="gridContainer"
			ng-class="{'': state == 'list', 'none': state != 'list'}">
			<table class="table table-bordered table-striped">
				<thead>
					<tr>
						<th scope="col"><spring:message code="company.name" /></th>
						<th scope="col"><spring:message code="company.url" /></th>
						<th scope="col"><spring:message code="company.address1" /></th>
						<th scope="col"><spring:message code="company.address2" /></th>
						<th scope="col"><spring:message code="company.city" /></th>
						<th scope="col"><spring:message code="company.country" /></th>
						<th scope="col"><spring:message code="company.province" /></th>
						<th scope="col"><spring:message code="company.postalCode" /></th>
						<th scope="col"><spring:message code="company.fax" /></th>
						<th scope="col"><spring:message code="company.primaryPhone" /></th>
						<th scope="col"><spring:message code="company.secondaryPhone" /></th>
						<th scope="col"><spring:message code="company.mobile" /></th>
						<th scope="col"><spring:message code="company.notes" /></th>
						<th scope="col"><spring:message code="company.action" /></th>
					</tr>
				</thead>
				<tbody>
					<tr ng-repeat="company in page.source">
						<td class="tdCompanyCentered">{{company.name}}</td>
						<td class="tdCompanyCentered">{{company.url}}</td>
						<td class="tdCompanyCentered">{{company.street1}}</td>
						<td class="tdCompanyCentered">{{company.street2}}</td>
						<td class="tdCompanyCentered">{{company.city}}</td>
						<td class="tdCompanyCentered">{{company.country}}</td>
						<td class="tdCompanyCentered">{{company.province}}</td>
						<td class="tdCompanyCentered">{{company.postalCode}}</td>
						<td class="tdCompanyCentered">{{company.fax}}</td>
						<td class="tdCompanyCentered">{{company.primaryPhone}}</td>
						<td class="tdCompanyCentered">{{company.secondaryPhone}}</td>
						<td class="tdCompanyCentered">{{company.mobile}}</td>
						<td class="tdCompanyCentered">{{company.notes}}</td>
						<td class="width15">
							<div class="text-center">
								<input type="hidden" value="{{company.id}}" /> <a
									href="#updateCompanyModal" ng-click="selectedCompany(company);"
									role="button"
									title="<spring:message code="update"/>&nbsp;<spring:message code="company"/>"
									class="btn btn-inverse" data-toggle="modal"> <i
									class="icon-pencil"></i>
								</a> 
							</div>
						</td>
					</tr>
				</tbody>
			</table>			
		</div>		
		<jsp:include page="dialogs/companyDialogs.jsp" />

	</div>
</div>

<script src="<c:url value="/resources/js/pages/company.js" />"></script>