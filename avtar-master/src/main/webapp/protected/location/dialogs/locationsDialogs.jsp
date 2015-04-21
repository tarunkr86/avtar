<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<div id="addLocationsModal"
	class="modal hide fade in centering insertAndUpdateLocationDialogs"
	role="dialog" aria-labelledby="addLocationsModalLabel"
	aria-hidden="true">
	<div class="modal-header">
		<h3 id="addLocationsModalLabel" class="displayInLine">
			<spring:message code="create" />
			&nbsp;
			<spring:message code="location" />
		</h3>
	</div>
	<div class="modal-body">
		<form name="newLocationForm" novalidate>
			<div class="container-fluid">
				<div class="row-fluid">
					<div class="span6">
						<fieldset>
							<div class="row-fluid">
								<label class="control-label span3"> <spring:message
										code="locations.name" />:
								</label>
								<div class="span6">
									<input type="text" class="form-control span11" required
										ng-model="location.name" name="name"
										placeholder="<spring:message code='locations.name'/> " />
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newLocationForm.name.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>
							<div class="row-fluid">
								<label class="control-label span3"> <spring:message
										code="locations.locationType" />:
								</label>
								<div class="span6">
									<input type="text" class="form-control span11" required
										ng-model="location.locationType" name="locationType"
										placeholder="<spring:message code='locations.locationType'/> " />
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newLocationForm.locationType.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>
							<div class="row-fluid">
								<label class="control-label span3"> <spring:message
										code="locations.abbreviation" />:
								</label>
								<div class="span6">
									<input type="text" class="form-control span11" required
										ng-model="location.abbreviation" name="abbreviation"
										placeholder="<spring:message code='locations.abbreviation'/> " />
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newLocationForm.abbreviation.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>
							<div class="row-fluid">
								<label class="control-label span3"> <spring:message
										code="locations.address1" />:
								</label>
								<div class="span6">
									<input type="text" class="form-control span11" required
										ng-model="location.street1" name="street1"
										placeholder="<spring:message code='locations.address1'/> " />
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newLocationForm.street1.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>
							<div class="row-fluid">
								<label class="control-label span3"> <spring:message
										code="locations.address2" />:
								</label>
								<div class="span6">
									<input type="text" class="form-control span11" required
										ng-model="location.street2" name="street2"
										placeholder="<spring:message code='locations.address2'/> " />
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newLocationForm.street2.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>


						</fieldset>
					</div>
					<div class="span6">
						<fieldset>
							<div class="row-fluid">
								<label class="control-label span3"> <spring:message
										code="locations.city" />:
								</label>
								<div class="span6">
									<input type="text" class="form-control span11" required
										ng-model="location.city" name="city"
										placeholder="<spring:message code='locations.city'/> " />
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newLocationForm.city.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>
							<div class="row-fluid">
								<label class="control-label span3"> <spring:message
										code="locations.state" />:
								</label>
								<div class="span6">
									<input type="text" class="form-control span11" required
										ng-model="location.state" name="state"
										placeholder="<spring:message code='locations.state'/> " />
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newLocationForm.state.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>
							<div class="row-fluid">
								<label class="control-label span3"> <spring:message
										code="locations.country" />:
								</label>
								<div class="span6">
									<input type="text" class="form-control span11" required
										ng-model="location.country" name="country"
										placeholder="<spring:message code='locations.country'/> " />
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newLocationForm.country.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>

							<div class="row-fluid">
								<label class="control-label span3"> <spring:message
										code="locations.postalCode" />:
								</label>
								<div class="span6">
									<input type="text" class="form-control span11" required
										ng-model="location.postalCode" name="postalCode"
										placeholder="<spring:message code='locations.postalCode'/> " />
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newLocationForm.postalCode.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>
						</fieldset>
					</div>
				</div>

				<input type="submit" class="btn btn-inverse"
					ng-click="createLocation(newLocationForm);"
					value='<spring:message code="create"/>' />
				<button class="btn btn-inverse" data-dismiss="modal"
					ng-click="exit('#addLocationsModal');" aria-hidden="true">
					<spring:message code="cancel" />
				</button>
			</div>
		</form>
	</div>
	<span class="alert alert-error dialogErrorMessage"
		ng-show="errorOnSubmit"> <spring:message code="request.error" />
	</span>
</div>

<div id="updateLocationsModal"
	class="modal hide fade in centering insertAndUpdateLocationDialogs"
	role="dialog" aria-labelledby="updateLocationsModalLabel"
	aria-hidden="true">
	<div class="modal-header">
		<h3 id="updateLocationsModalLabel" class="displayInLine">
			<spring:message code="update" />
			&nbsp;
			<spring:message code="location" />
		</h3>
	</div>
	<div class="modal-body">
		<form name="updateLocationForm" novalidate>
			<input type="hidden" required ng-model="location.id" name="id"
				value="{{location.id}}" />

			<div class="container-fluid">
				<div class="row-fluid">
					<div class="span6">
						<fieldset>
							
							<div class="row-fluid">
								<label class="control-label span3"> <spring:message
										code="locations.name" />:
								</label>
								<div class="span6">
									<input type="text" class="form-control span11" required
										ng-model="location.name" name="name"
										placeholder="<spring:message code='locations.name'/> " />
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newLocationForm.name.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>
							<div class="row-fluid">
								<label class="control-label span3"> <spring:message
										code="locations.locationType" />:
								</label>
								<div class="span6">
									<input type="text" class="form-control span11" required
										ng-model="location.locationType" name="locationType"
										placeholder="<spring:message code='locations.locationType'/> " />
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newLocationForm.locationType.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>
							<div class="row-fluid">
								<label class="control-label span3"> <spring:message
										code="locations.abbreviation" />:
								</label>
								<div class="span6">
									<input type="text" class="form-control span11" required
										ng-model="location.abbreviation" name="abbreviation"
										placeholder="<spring:message code='locations.abbreviation'/> " />
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newLocationForm.abbreviation.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>
							<div class="row-fluid">
								<label class="control-label span3"> <spring:message
										code="locations.address1" />:
								</label>
								<div class="span6">
									<input type="text" class="form-control span11" required
										ng-model="location.street1" name="street1"
										placeholder="<spring:message code='locations.address1'/> " />
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newLocationForm.street1.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>
							<div class="row-fluid">
								<label class="control-label span3"> <spring:message
										code="locations.address2" />:
								</label>
								<div class="span6">
									<input type="text" class="form-control span11" required
										ng-model="location.street2" name="street2"
										placeholder="<spring:message code='locations.address2'/> " />
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newLocationForm.street2.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>													
						</fieldset>
					</div>
                   <div class="span6">
						<fieldset>
							<div class="row-fluid">
								<label class="control-label span3"> <spring:message
										code="locations.city" />:
								</label>
								<div class="span6">
									<input type="text" class="form-control span11" required
										ng-model="location.city" name="city"
										placeholder="<spring:message code='locations.city'/> " />
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newLocationForm.city.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>
							<div class="row-fluid">
								<label class="control-label span3"> <spring:message
										code="locations.state" />:
								</label>
								<div class="span6">
									<input type="text" class="form-control span11" required
										ng-model="location.state" name="state"
										placeholder="<spring:message code='locations.state'/> " />
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newLocationForm.state.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>
							<div class="row-fluid">
								<label class="control-label span3"> <spring:message
										code="locations.country" />:
								</label>
								<div class="span6">
									<input type="text" class="form-control span11" required
										ng-model="location.country" name="country"
										placeholder="<spring:message code='locations.country'/> " />
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newLocationForm.country.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>

							<div class="row-fluid">
								<label class="control-label span3"> <spring:message
										code="locations.postalCode" />:
								</label>
								<div class="span6">
									<input type="text" class="form-control span11" required
										ng-model="location.postalCode" name="postalCode"
										placeholder="<spring:message code='locations.postalCode'/> " />
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newLocationForm.postalCode.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>
						</fieldset>
					</div>
				</div>
				<input type="submit" class="btn btn-inverse"
					ng-click="updateLocation(updateLocationForm);"
					value='<spring:message code="update"/>' />
				<button class="btn btn-inverse" data-dismiss="modal"
					ng-click="exit('#updateLocationsModal');" aria-hidden="true">
					<spring:message code="cancel" />
				</button>
			</div>
		</form>
	</div>
	<span class="alert alert-error dialogErrorMessage"
		ng-show="errorOnSubmit"> <spring:message code="request.error" />
	</span>
</div>

<div id="deleteLocationsModal" class="modal hide fade in centering"
	role="dialog" aria-labelledby="searchLocationsModalLabel"
	aria-hidden="true">
	<div class="modal-header">
		<h3 id="deleteLocationsModalLabel" class="displayInLine">
			<spring:message code="delete" />
			&nbsp;
			<spring:message code="location" />
		</h3>
	</div>
	<div class="modal-body">
		<form name="deleteLocationForm" novalidate>
			<p>
				<spring:message code="delete.confirm" />
				:&nbsp;{{location.name}}?
			</p>

			<input type="submit" class="btn btn-inverse"
				ng-click="deleteLocation();" value='<spring:message code="delete"/>' />
			<button class="btn btn-inverse" data-dismiss="modal"
				ng-click="exit('#deleteLocationsModal');" aria-hidden="true">
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

<div id="searchLocationsModal" class="modal hide fade in centering"
	role="dialog" aria-labelledby="searchLocationsModalLabel"
	aria-hidden="true">
	<div class="modal-header">
		<h3 id="searchLocationsModalLabel" class="displayInLine">
			<spring:message code="search" />
		</h3>
	</div>
	<div class="modal-body">
		<form name="searchLocationForm" novalidate>
			<label><spring:message code="search.for" /></label>

			<div>
				<div class="input-append">
					<input type="text" autofocus required ng-model="searchFor"
						name="searchFor"
						placeholder="<spring:message code='location'/>&nbsp;<spring:message code='locations.name'/> " />
				</div>
				<div class="input-append displayInLine">
					<label class="displayInLine"> <span
						class="alert alert-error"
						ng-show="displayValidationError && searchLocationForm.searchFor.$error.required">
							<spring:message code="required" />
					</span>
					</label>
				</div>
			</div>
			<input type="submit" class="btn btn-inverse"
				ng-click="searchLocation(searchLocationForm, false);"
				value='<spring:message code="search"/>' />
			<button class="btn btn-inverse" data-dismiss="modal"
				ng-click="exit('#searchLocationsModal');" aria-hidden="true">
				<spring:message code="cancel" />
			</button>
		</form>
	</div>
	<span class="alert alert-error dialogErrorMessage"
		ng-show="errorOnSubmit"> <spring:message code="request.error" />
	</span>
</div>
