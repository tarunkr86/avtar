<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<div id="addPositionsModal"
	class="modal hide fade in centering insertAndUpdatePositionDialogs"
	role="dialog" aria-labelledby="addPositionsModalLabel"
	aria-hidden="true">
	<div class="modal-header">
		<h3 id="addPositionsModalLabel" class="displayInLine">
			<spring:message code="create" />
			&nbsp;
			<spring:message code="position" />
		</h3>
	</div>
	<div class="modal-body">
		<form name="newPositionForm" novalidate>
			<div class="container-fluid">
				<div class="row-fluid">
					<div class="span12">
						<fieldset>
						<div class="row-fluid">
						
								<label class="control-label span3"> <spring:message
										code="positions.departmentId" />:
								</label>
								<div class="span7">
									<input type="text" class="form-controlspan7" required
										ng-model="position.departmentId" name="departmentId"
										placeholder="<spring:message code='positions.departmentId'/> " />
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newPositionForm.departmentId.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>
							<div class="row-fluid">
								<label class="control-label span3"> <spring:message
										code="positions.name" />:
								</label>
								<div class="span7">
									<input type="text" class="form-controlspan7" required
										ng-model="position.name" name="name"
										placeholder="<spring:message code='positions.name'/> " />
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newPositionForm.name.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>
							<div class="row-fluid">
								<label class="control-label span3"> <spring:message
										code="positions.template" />:
								</label>
								<div class="span7">
									<textarea class="form-controlspan7" required	ng-model="position.template" name="template"placeholder="<spring:message code='positions.template'/> "  style="width: 100%; outline: none;"></textarea>								
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newPositionForm.template.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>
						</fieldset>
					</div>
				</div>
				<input type="submit" class="btn btn-inverse"
					ng-click="createPosition(newPositionForm);"
					value='<spring:message code="create"/>' />
				<button class="btn btn-inverse" data-dismiss="modal"
					ng-click="exit('#addPositionsModal');" aria-hidden="true">
					<spring:message code="cancel" />
				</button>
			</div>
		</form>
	</div>
	<span class="alert alert-error dialogErrorMessage"
		ng-show="errorOnSubmit"> <spring:message code="request.error" />
	</span>
</div>

<div id="updatePositionsModal"
	class="modal hide fade in centering insertAndUpdatePositionDialogs"
	role="dialog" aria-labelledby="updatePositionsModalLabel"
	aria-hidden="true">
	<div class="modal-header">
		<h3 id="updatePositionsModalLabel" class="displayInLine">
			<spring:message code="update" />
			&nbsp;
			<spring:message code="position" />
		</h3>
	</div>
	<div class="modal-body">
		<form name="updatePositionForm" novalidate>
			<input type="hidden" required ng-model="position.id" name="id"
				value="{{position.id}}" />

			<div class="container-fluid">
				<div class="row-fluid">
					<div class="span12">
						<fieldset>
						<div class="row-fluid">
								<label class="control-label span3"> <spring:message
										code="positions.departmentId" />:
								</label>
								<div class="span7">
									<input type="text" class="form-controlspan7" required
										ng-model="position.departmentId" name="departmentId"
										placeholder="<spring:message code='positions.departmentId'/> " />
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newPositionForm.departmentId.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>
							<div class="row-fluid">
								<label class="control-label span3"> <spring:message
										code="positions.name" />:
								</label>
								<div class="span7">
									<input type="text" class="form-controlspan7" required
										ng-model="position.name" name="name"
										placeholder="<spring:message code='positions.name'/> " />
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newPositionForm.name.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>
							<div class="row-fluid">
								<label class="control-label span3"> <spring:message
										code="positions.template" />:
								</label>
								<div class="span7">									
										<textarea class="form-controlspan7" required	ng-model="position.template" name="template"placeholder="<spring:message code='positions.template'/> "  style="width: 100%; outline: none;"></textarea>								
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newPositionForm.template.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>
						</fieldset>
					</div>
				</div>
				<input type="submit" class="btn btn-inverse"
					ng-click="updatePosition(newPositionForm);"
					value='<spring:message code="update"/>' />
				<button class="btn btn-inverse" data-dismiss="modal"
					ng-click="exit('#updatePositionsModal');" aria-hidden="true">
					<spring:message code="cancel" />
				</button>
			</div>
		</form>
	</div>
	<span class="alert alert-error dialogErrorMessage"
		ng-show="errorOnSubmit"> <spring:message code="request.error" />
	</span>
</div>

<div id="deletePositionsModal" class="modal hide fade in centering"
	role="dialog" aria-labelledby="searchPositionsModalLabel"
	aria-hidden="true">
	<div class="modal-header">
		<h3 id="deletePositionsModalLabel" class="displayInLine">
			<spring:message code="delete" />
			&nbsp;
			<spring:message code="position" />
		</h3>
	</div>
	<div class="modal-body">
		<form name="deletePositionForm" novalidate>
			<p>
				<spring:message code="delete.confirm" />
				:&nbsp;{{position.name}}?
			</p>

			<input type="submit" class="btn btn-inverse"
				ng-click="deletePosition();" value='<spring:message code="delete"/>' />
			<button class="btn btn-inverse" data-dismiss="modal"
				ng-click="exit('#deletePositionsModal');" aria-hidden="true">
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

<div id="searchPositionsModal" class="modal hide fade in centering"
	role="dialog" aria-labelledby="searchPositionsModalLabel"
	aria-hidden="true">
	<div class="modal-header">
		<h3 id="searchPositionsModalLabel" class="displayInLine">
			<spring:message code="search" />
		</h3>
	</div>
	<div class="modal-body">
		<form name="searchPositionForm" novalidate>
			<label><spring:message code="search.for" /></label>

			<div>
				<div class="input-append">
					<input type="text" autofocus required ng-model="searchFor"
						name="searchFor"
						placeholder="<spring:message code='position'/>&nbsp;<spring:message code='positions.name'/> " />
				</div>
				<div class="input-append displayInLine">
					<label class="displayInLine"> <span
						class="alert alert-error"
						ng-show="displayValidationError && searchPositionForm.searchFor.$error.required">
							<spring:message code="required" />
					</span>
					</label>
				</div>
			</div>
			<input type="submit" class="btn btn-inverse"
				ng-click="searchPosition(searchPositionForm, false);"
				value='<spring:message code="search"/>' />
			<button class="btn btn-inverse" data-dismiss="modal"
				ng-click="exit('#searchPositionsModal');" aria-hidden="true">
				<spring:message code="cancel" />
			</button>
		</form>
	</div>
	<span class="alert alert-error dialogErrorMessage"
		ng-show="errorOnSubmit"> <spring:message code="request.error" />
	</span>
</div>
