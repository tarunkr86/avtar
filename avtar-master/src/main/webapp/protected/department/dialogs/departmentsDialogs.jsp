<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<div id="addDepartmentsModal"
	class="modal hide fade in centering insertAndUpdateDepartmentDialogs"
	role="dialog" aria-labelledby="addDepartmentsModalLabel"
	aria-hidden="true">
	<div class="modal-header">
		<h3 id="addDepartmentsModalLabel" class="displayInLine">
			<spring:message code="create" />
			&nbsp;
			<spring:message code="department" />
		</h3>
	</div>
	<div class="modal-body">
		<form name="newDepartmentForm" novalidate>
			<div class="container-fluid">
				<div class="row-fluid">
					<div class="span10">
						<fieldset>
							<div class="row-fluid">
								<label class="control-label span3"> <spring:message
										code="departments.name" />:
								</label>
								<div class="span6">
									<input type="text" class="form-control span11" required
										ng-model="department.name" name="name"
										placeholder="<spring:message code='departments.name'/> " />
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newDepartmentForm.name.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>
							<div class="row-fluid">
								<label class="control-label span3"> <spring:message
										code="departments.departmentCode" />:
								</label>
								<div class="span6">
									<input type="text" class="form-control span11" required
										ng-model="department.departmentCode" name="departmentCode"
										placeholder="<spring:message code='departments.departmentCode'/> " />
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newDepartmentForm.departmentCode.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>
							<div class="row-fluid">
								<label class="control-label span3"> <spring:message
										code="departments.abbreviation" />:
								</label>
								<div class="span6">
									<input type="text" class="form-control span11" required
										ng-model="department.abbreviation" name="abbreviation"
										placeholder="<spring:message code='departments.abbreviation'/> " />
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newDepartmentForm.abbreviation.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>
							<div class="row-fluid">
								<label class="control-label span3"> <spring:message
										code="departments.emailAddress" />:
								</label>
								<div class="span6">
									<input type="text" class="form-control span11" required
										ng-model="department.emailAddress" name="emailAddress"
										placeholder="<spring:message code='departments.emailAddress'/> " />
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newDepartmentForm.emailAddress.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>
							
						</fieldset>
					</div>					
				</div>

				<input type="submit" class="btn btn-inverse"
					ng-click="createDepartment(newDepartmentForm);"
					value='<spring:message code="create"/>' />
				<button class="btn btn-inverse" data-dismiss="modal"
					ng-click="exit('#addDepartmentsModal');" aria-hidden="true">
					<spring:message code="cancel" />
				</button>
			</div>
		</form>
	</div>
	<span class="alert alert-error dialogErrorMessage"
		ng-show="errorOnSubmit"> <spring:message code="request.error" />
	</span>
</div>

<div id="updateDepartmentsModal"
	class="modal hide fade in centering insertAndUpdateDepartmentDialogs"
	role="dialog" aria-labelledby="updateDepartmentsModalLabel"
	aria-hidden="true">
	<div class="modal-header">
		<h3 id="updateDepartmentsModalLabel" class="displayInLine">
			<spring:message code="update" />
			&nbsp;
			<spring:message code="department" />
		</h3>
	</div>
	<div class="modal-body">
		<form name="updateDepartmentForm" novalidate>
			<input type="hidden" required ng-model="department.id" name="id"
				value="{{department.id}}" />

			<div class="container-fluid">
				<div class="row-fluid">
					<div class="span10">
						<fieldset>
							<div class="row-fluid">
								<label class="control-label span3"> <spring:message
										code="departments.name" />:
								</label>
								<div class="span6">
									<input type="text" class="form-control span11" required
										ng-model="department.name" name="name"
										placeholder="<spring:message code='departments.name'/> " />
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newDepartmentForm.name.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>
							<div class="row-fluid">
								<label class="control-label span3"> <spring:message
										code="departments.departmentCode" />:
								</label>
								<div class="span6">
									<input type="text" class="form-control span11" required
										ng-model="department.departmentCode" name="departmentCode"
										placeholder="<spring:message code='departments.departmentCode'/> " />
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newDepartmentForm.code.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>
							<div class="row-fluid">
								<label class="control-label span3"> <spring:message
										code="departments.abbreviation" />:
								</label>
								<div class="span6">
									<input type="text" class="form-control span11" required
										ng-model="department.abbreviation" name="abbreviation"
										placeholder="<spring:message code='departments.abbreviation'/> " />
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newDepartmentForm.abbreviation.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>
							<div class="row-fluid">
								<label class="control-label span3"> <spring:message
										code="departments.emailAddress" />:
								</label>
								<div class="span6">
									<input type="text" class="form-control span11" required
										ng-model="department.emailAddress" name="emailAddress"
										placeholder="<spring:message code='departments.emailAddress'/> " />
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newDepartmentForm.emailAddress.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>
							
						</fieldset>
					</div>
                  
				</div>
				<input type="submit" class="btn btn-inverse"
					ng-click="updateDepartment(updateDepartmentForm);"
					value='<spring:message code="update"/>' />
				<button class="btn btn-inverse" data-dismiss="modal"
					ng-click="exit('#updateDepartmentsModal');" aria-hidden="true">
					<spring:message code="cancel" />
				</button>
			</div>
		</form>
	</div>
	<span class="alert alert-error dialogErrorMessage"
		ng-show="errorOnSubmit"> <spring:message code="request.error" />
	</span>
</div>

<div id="deleteDepartmentsModal" class="modal hide fade in centering"
	role="dialog" aria-labelledby="searchDepartmentsModalLabel"
	aria-hidden="true">
	<div class="modal-header">
		<h3 id="deleteDepartmentsModalLabel" class="displayInLine">
			<spring:message code="delete" />
			&nbsp;
			<spring:message code="department" />
		</h3>
	</div>
	<div class="modal-body">
		<form name="deleteDepartmentForm" novalidate>
			<p>
				<spring:message code="delete.confirm" />
				:&nbsp;{{department.name}}?
			</p>

			<input type="submit" class="btn btn-inverse"
				ng-click="deleteDepartment();" value='<spring:message code="delete"/>' />
			<button class="btn btn-inverse" data-dismiss="modal"
				ng-click="exit('#deleteDepartmentsModal');" aria-hidden="true">
				<spring:message code="cancel" />
			</button>
		</form>
	</div>
	<span class="alert alert-error dialogErrorMessage"
		ng-show="errorOnSubmit"> <spring:message code="request.error" />
	</span> <span class="alert alert-error dialogErrorMessage"
		ng-show="errorIllegalAccess"> <spring:message
			code="request.illegal.access" />
	</span>
</div>

<div id="searchDepartmentsModal" class="modal hide fade in centering"
	role="dialog" aria-labelledby="searchDepartmentsModalLabel"
	aria-hidden="true">
	<div class="modal-header">
		<h3 id="searchDepartmentsModalLabel" class="displayInLine">
			<spring:message code="search" />
		</h3>
	</div>
	<div class="modal-body">
		<form name="searchDepartmentForm" novalidate>
			<label><spring:message code="search.for" /></label>

			<div>
				<div class="input-append">
					<input type="text" autofocus required ng-model="searchFor"
						name="searchFor"
						placeholder="<spring:message code='department'/>&nbsp;<spring:message code='departments.name'/> " />
				</div>
				<div class="input-append displayInLine">
					<label class="displayInLine"> <span
						class="alert alert-error"
						ng-show="displayValidationError && searchDepartmentForm.searchFor.$error.required">
							<spring:message code="required" />
					</span>
					</label>
				</div>
			</div>
			<input type="submit" class="btn btn-inverse"
				ng-click="searchDepartment(searchDepartmentForm, false);"
				value='<spring:message code="search"/>' />
			<button class="btn btn-inverse" data-dismiss="modal"
				ng-click="exit('#searchDepartmentsModal');" aria-hidden="true">
				<spring:message code="cancel" />
			</button>
		</form>
	</div>
	<span class="alert alert-error dialogErrorMessage"
		ng-show="errorOnSubmit"> <spring:message code="request.error" />
	</span>
</div>
