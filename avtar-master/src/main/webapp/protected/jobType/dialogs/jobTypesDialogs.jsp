<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<div id="addJobTypesModal"
	class="modal hide fade in centering insertAndUpdateJobTypeDialogs"
	role="dialog" aria-labelledby="addJobTypesModalLabel"
	aria-hidden="true">
	<div class="modal-header">
		<h3 id="addJobTypesModalLabel" class="displayInLine">
			<spring:message code="create" />
			&nbsp;
			<spring:message code="jobType" />
		</h3>
	</div>
	<div class="modal-body">
		<form name="newJobTypeForm" novalidate>
			<div class="container-fluid">
				<div class="row-fluid">
					<div class="span12">
						<fieldset>						
							<div class="row-fluid">
								<label class="control-label span2"> <spring:message
										code="jobTypes.name" />:
								</label>
								<div class="span8">
									<input type="text" class="form-controlspan8" required
										ng-model="jobType.name" name="name"
										placeholder="<spring:message code='jobTypes.name'/> " />
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newJobTypeForm.name.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>																																								
						</fieldset>
					</div>					
				</div>
				<input type="submit" class="btn btn-inverse"
					ng-click="createJobType(newJobTypeForm);"
					value='<spring:message code="create"/>' />
				<button class="btn btn-inverse" data-dismiss="modal"
					ng-click="exit('#addJobTypesModal');" aria-hidden="true">
					<spring:message code="cancel" />
				</button>
			</div>
		</form>
	</div>
	<span class="alert alert-error dialogErrorMessage"
		ng-show="errorOnSubmit"> <spring:message code="request.error" />
	</span>
</div>

<div id="updateJobTypesModal"
	class="modal hide fade in centering insertAndUpdateJobTypeDialogs"
	role="dialog" aria-labelledby="updateJobTypesModalLabel"
	aria-hidden="true">
	<div class="modal-header">
		<h3 id="updateJobTypesModalLabel" class="displayInLine">
			<spring:message code="update" />
			&nbsp;
			<spring:message code="jobType" />
		</h3>
	</div>
	<div class="modal-body">
		<form name="updateJobTypeForm" novalidate>
			<input type="hidden" required ng-model="jobType.id" name="id"
				value="{{jobType.id}}" />

			<div class="container-fluid">
				<div class="row-fluid">
					<div class="span12">
						<fieldset>						
							<div class="row-fluid">
								<label class="control-label span2"> <spring:message
										code="jobTypes.name" />:
								</label>
								<div class="span8">
									<input type="text" class="form-controlspan8" required
										ng-model="jobType.name" name="name"
										placeholder="<spring:message code='jobTypes.name'/> " />
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newJobTypeForm.name.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>
																																							
						</fieldset>
					</div>
					
				</div>
				<input type="submit" class="btn btn-inverse"
					ng-click="updateJobType(newJobTypeForm);"
					value='<spring:message code="update"/>' />
				<button class="btn btn-inverse" data-dismiss="modal"
					ng-click="exit('#updateJobTypesModal');" aria-hidden="true">
					<spring:message code="cancel" />
				</button>
			</div>
		</form>
	</div>
	<span class="alert alert-error dialogErrorMessage"
		ng-show="errorOnSubmit"> <spring:message code="request.error" />
	</span>
</div>

<div id="deleteJobTypesModal" class="modal hide fade in centering"
	role="dialog" aria-labelledby="searchJobTypesModalLabel"
	aria-hidden="true">
	<div class="modal-header">
		<h3 id="deleteJobTypesModalLabel" class="displayInLine">
			<spring:message code="delete" />
			&nbsp;
			<spring:message code="jobType" />
		</h3>
	</div>
	<div class="modal-body">
		<form name="deleteJobTypeForm" novalidate>
			<p>
				<spring:message code="delete.confirm" />
				:&nbsp;{{jobType.name}}?
			</p>

			<input type="submit" class="btn btn-inverse"
				ng-click="deleteJobType();" value='<spring:message code="delete"/>' />
			<button class="btn btn-inverse" data-dismiss="modal"
				ng-click="exit('#deleteJobTypesModal');" aria-hidden="true">
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

<div id="searchJobTypesModal" class="modal hide fade in centering"
	role="dialog" aria-labelledby="searchJobTypesModalLabel"
	aria-hidden="true">
	<div class="modal-header">
		<h3 id="searchJobTypesModalLabel" class="displayInLine">
			<spring:message code="search" />
		</h3>
	</div>
	<div class="modal-body">
		<form name="searchJobTypeForm" novalidate>
			<label><spring:message code="search.for" /></label>

			<div>
				<div class="input-append">
					<input type="text" autofocus required ng-model="searchFor"
						name="searchFor"
						placeholder="<spring:message code='jobType'/>&nbsp;<spring:message code='jobTypes.name'/> " />
				</div>
				<div class="input-append displayInLine">
					<label class="displayInLine"> <span
						class="alert alert-error"
						ng-show="displayValidationError && searchJobTypeForm.searchFor.$error.required">
							<spring:message code="required" />
					</span>
					</label>
				</div>
			</div>
			<input type="submit" class="btn btn-inverse"
				ng-click="searchJobType(searchJobTypeForm, false);"
				value='<spring:message code="search"/>' />
			<button class="btn btn-inverse" data-dismiss="modal"
				ng-click="exit('#searchJobTypesModal');" aria-hidden="true">
				<spring:message code="cancel" />
			</button>
		</form>
	</div>
	<span class="alert alert-error dialogErrorMessage"
		ng-show="errorOnSubmit"> <spring:message code="request.error" />
	</span>
</div>
