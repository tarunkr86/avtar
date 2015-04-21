<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<div id="addAgencysModal"
	class="modal hide fade in centering insertAndUpdateAgencyDialogs"
	role="dialog" aria-labelledby="addAgencysModalLabel" aria-hidden="true">
	<div class="modal-header">
		<h3 id="addAgencysModalLabel" class="displayInLine">
			<spring:message code="create" />
			&nbsp;
			<spring:message code="agency" />
		</h3>
	</div>
	<div class="modal-body">
		<form name="newAgencyForm" novalidate>
			<div class="container-fluid">
				<div class="row-fluid">
					<div class="span6">
						<fieldset>
							<div class="row-fluid">
								<label class="control-label span2"> <spring:message
										code="agencys.purpose" />:
								</label>
								<div class="span8">
									<input type="text" class="form-controlspan8" required
										ng-model="agency.purpose" name="purpose"
										placeholder="<spring:message code='agencys.purpose'/> " />
								</div>
								<label class="control-label span1"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newAgencyForm.purpose.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>
							<div class="row-fluid">
								<label class="control-label span2"> <spring:message
										code="agencys.nationality" />:
								</label>
								<div class="span8">
									<!-- <input type="text" class="form-controlspan8" required
										ng-model="agency.nationality" name="nationality"
										placeholder="<spring:message code='agencys.nationality'/> " />-->
										<select ng-options="name.id as name.name for name in nationalities " class="form-controlspan7" required
										ng-model="agency.nationalityId" name="nationalityId"  placeholder="<spring:message code='agencys.nationality'/> "><option value=''>Select</option></select>																			
								
								</div>
								<label class="control-label span1"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newAgencyForm.nationality.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>
							<div class="row-fluid">
								<label class="control-label span2"> <spring:message
										code="agencys.name" />:
								</label>
								<div class="span8">
									<input type="text" class="form-controlspan8" required
										ng-model="agency.name" name="name"
										placeholder="<spring:message code='agencys.name'/> " />
								</div>
								<label class="control-label span1"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newAgencyForm.name.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>
							<div class="row-fluid">
								<label class="control-label span2"> <spring:message
										code="agencys.email" />:
								</label>
								<div class="span8">
									<input type="text" class="form-controlspan8" required
										ng-model="agency.email" name="email"
										placeholder="<spring:message code='agencys.email'/> " />
								</div>
								<label class="control-label span1"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newAgencyForm.email.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>
							<div class="row-fluid">
								<label class="control-label span2"> <spring:message
										code="agencys.website" />:
								</label>
								<div class="span8">
									<input type="text" class="form-controlspan8" required
										ng-model="agency.website" name="website"
										placeholder="<spring:message code='agencys.website'/> " />
								</div>
								<label class="control-label span1"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newAgencyForm.website.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>
							<div class="row-fluid">
								<label class="control-label span2"> <spring:message
										code="agencys.phone" />:
								</label>
								<div class="span8">
									<input type="text" class="form-controlspan8" required
										ng-model="agency.phone" name="phone"
										placeholder="<spring:message code='agencys.phone'/> " />
								</div>
								<label class="control-label span1"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newAgencyForm.phone.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>
						</fieldset>
					</div>
					<div class="span6">
						<fieldset>
							<div class="row-fluid">
								<label class="control-label span2"> <spring:message
										code="agencys.country" />:
								</label>
								<div class="span8">
									<select ng-options="item as item  for item in countries" class="form-controlspan8" required
										ng-model="agency.country" name="country" ng-change="selectedCountry(agency.country);"placeholder="<spring:message code='agencys.country'/> "><option value=''>Select</option></select>							
							
								</div>
								<label class="control-label span1"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newAgencyForm.country.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>
							<div class="row-fluid">
								<label class="control-label span2"> <spring:message
										code="agencys.state" />:
								</label>
								<div class="span8">
									<select ng-options="item as item  for item in states" class="form-controlspan8" required
										ng-model="agency.state" name="state"
										placeholder="<spring:message code='agencys.state'/> " /><option value=''>Select</option></select>	
								</div>
								<label class="control-label span1"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newAgencyForm.state.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>
							<div class="row-fluid">
								<label class="control-label span2"> <spring:message
										code="agencys.city" />:
								</label>
								<div class="span8">
									<input type="text" class="form-controlspan8" required
										ng-model="agency.city" name="city"
										placeholder="<spring:message code='agencys.city'/> " />
								</div>
								<label class="control-label span1"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newAgencyForm.city.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>
							<div class="row-fluid">
								<label class="control-label span2"> <spring:message
										code="agencys.address1" />:
								</label>
								<div class="span8">
									<input type="text" class="form-controlspan8" required
										ng-model="agency.address1" name="address1"
										placeholder="<spring:message code='agencys.address1'/> " />
								</div>
								<label class="control-label span1"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newAgencyForm.address1.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>
							<div class="row-fluid">
								<label class="control-label span2"> <spring:message
										code="agencys.address2" />:
								</label>
								<div class="span8">
									<input type="text" class="form-controlspan8" required
										ng-model="agency.address2" name="address2"
										placeholder="<spring:message code='agencys.address2'/> " />
								</div>
								<label class="control-label span1"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newAgencyForm.address2.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>														
							<div class="row-fluid">
								<label class="control-label span2"> <spring:message
										code="agencys.zipcode" />:
								</label>
								<div class="span8">
									<input type="text" class="form-controlspan8" required
										ng-model="agency.zipcode" name="zipcode"
										placeholder="<spring:message code='agencys.zipcode'/> " />
								</div>
								<label class="control-label span1"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newAgencyForm.zipcode.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>
						</fieldset>
					</div>
				</div>
				<input type="submit" class="btn btn-inverse"
					ng-click="createAgency(newAgencyForm);"
					value='<spring:message code="create"/>' />
				<button class="btn btn-inverse" data-dismiss="modal"
					ng-click="exit('#addAgencysModal');" aria-hidden="true">
					<spring:message code="cancel" />
				</button>
			</div>
		</form>
	</div>
	<span class="alert alert-error dialogErrorMessage"
		ng-show="errorOnSubmit"> <spring:message code="request.error" />
	</span>
</div>

<div id="updateAgencysModal"
	class="modal hide fade in centering insertAndUpdateAgencyDialogs"
	role="dialog" aria-labelledby="updateAgencysModalLabel"
	aria-hidden="true">
	<div class="modal-header">
		<h3 id="updateAgencysModalLabel" class="displayInLine">
			<spring:message code="update" />
			&nbsp;
			<spring:message code="agency" />
		</h3>
	</div>
	<div class="modal-body">
		<form name="updateAgencyForm" novalidate>
			<input type="hidden" required ng-model="agency.id" name="id"
				value="{{agency.id}}" />

			<div class="container-fluid">
				<div class="row-fluid">
					<div class="span6">
						<fieldset>
							<div class="row-fluid">
								<label class="control-label span2"> <spring:message
										code="agencys.purpose" />:
								</label>
								<div class="span8">
									<input type="text" class="form-controlspan8" required
										ng-model="agency.purpose" name="purpose"
										placeholder="<spring:message code='agencys.purpose'/> " />
								</div>
								<label class="control-label span1"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newAgencyForm.purpose.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>
							<div class="row-fluid">
								<label class="control-label span2"> <spring:message
										code="agencys.nationality" />:
								</label>
								<div class="span8">
									<select ng-options="name.id as name.name for name in nationalities " class="form-controlspan7" required
										ng-model="agency.nationalityId" name="nationalityId"  placeholder="<spring:message code='agencys.nationality'/> "><option value=''>Select</option></select>																			
								
								</div>
								<label class="control-label span1"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newAgencyForm.nationality.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>
							<div class="row-fluid">
								<label class="control-label span2"> <spring:message
										code="agencys.name" />:
								</label>
								<div class="span8">
									<input type="text" class="form-controlspan8" required
										ng-model="agency.name" name="name"
										placeholder="<spring:message code='agencys.name'/> " />
								</div>
								<label class="control-label span1"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newAgencyForm.name.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>
							<div class="row-fluid">
								<label class="control-label span2"> <spring:message
										code="agencys.email" />:
								</label>
								<div class="span8">
									<input type="text" class="form-controlspan8" required
										ng-model="agency.email" name="email"
										placeholder="<spring:message code='agencys.email'/> " />
								</div>
								<label class="control-label span1"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newAgencyForm.email.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>
							<div class="row-fluid">
								<label class="control-label span2"> <spring:message
										code="agencys.website" />:
								</label>
								<div class="span8">
									<input type="text" class="form-controlspan8" required
										ng-model="agency.website" name="website"
										placeholder="<spring:message code='agencys.website'/> " />
								</div>
								<label class="control-label span1"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newAgencyForm.website.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>
							<div class="row-fluid">
								<label class="control-label span2"> <spring:message
										code="agencys.phone" />:
								</label>
								<div class="span8">
									<input type="text" class="form-controlspan8" required
										ng-model="agency.phone" name="phone"
										placeholder="<spring:message code='agencys.phone'/> " />
								</div>
								<label class="control-label span1"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newAgencyForm.phone.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>
						</fieldset>
					</div>
					<div class="span6">
						<fieldset>
							<div class="row-fluid">
								<label class="control-label span2"> <spring:message
										code="agencys.country" />:
								</label>
								<div class="span8">
									<select ng-options="item as item  for item in countries" class="form-controlspan8" required
										ng-model="agency.country" name="country" ng-change="selectedCountry(agency.country);"placeholder="<spring:message code='agencys.country'/> "><option value=''>Select</option></select>							
							
								</div>
								<label class="control-label span1"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newAgencyForm.country.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>
							<div class="row-fluid">
								<label class="control-label span2"> <spring:message
										code="agencys.state" />:
								</label>
								<div class="span8">
									<select ng-options="item as item  for item in states" class="form-controlspan8" required
										ng-model="agency.state" name="state"
										placeholder="<spring:message code='agencys.state'/> " /><option value=''>Select</option></select>	
								</div>
								<label class="control-label span1"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newAgencyForm.state.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>
							<div class="row-fluid">
								<label class="control-label span2"> <spring:message
										code="agencys.city" />:
								</label>
								<div class="span8">
									<input type="text" class="form-controlspan8" required
										ng-model="agency.city" name="city"
										placeholder="<spring:message code='agencys.city'/> " />
								</div>
								<label class="control-label span1"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newAgencyForm.city.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>
							<div class="row-fluid">
								<label class="control-label span2"> <spring:message
										code="agencys.address1" />:
								</label>
								<div class="span8">
									<input type="text" class="form-controlspan8" required
										ng-model="agency.address1" name="address1"
										placeholder="<spring:message code='agencys.address1'/> " />
								</div>
								<label class="control-label span1"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newAgencyForm.address1.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>
							<div class="row-fluid">
								<label class="control-label span2"> <spring:message
										code="agencys.address2" />:
								</label>
								<div class="span8">
									<input type="text" class="form-controlspan8" required
										ng-model="agency.address2" name="address2"
										placeholder="<spring:message code='agencys.address2'/> " />
								</div>
								<label class="control-label span1"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newAgencyForm.address2.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>														
							<div class="row-fluid">
								<label class="control-label span2"> <spring:message
										code="agencys.zipcode" />:
								</label>
								<div class="span8">
									<input type="text" class="form-controlspan8" required
										ng-model="agency.zipcode" name="zipcode"
										placeholder="<spring:message code='agencys.zipcode'/> " />
								</div>
								<label class="control-label span1"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newAgencyForm.zipcode.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>
						</fieldset>
					</div>
				</div>
				<input type="submit" class="btn btn-inverse"
					ng-click="updateAgency(newAgencyForm);"
					value='<spring:message code="update"/>' />
				<button class="btn btn-inverse" data-dismiss="modal"
					ng-click="exit('#updateAgencysModal');" aria-hidden="true">
					<spring:message code="cancel" />
				</button>
			</div>
		</form>
	</div>
	<span class="alert alert-error dialogErrorMessage"
		ng-show="errorOnSubmit"> <spring:message code="request.error" />
	</span>
</div>

<div id="deleteAgencysModal" class="modal hide fade in centering"
	role="dialog" aria-labelledby="searchAgencysModalLabel"
	aria-hidden="true">
	<div class="modal-header">
		<h3 id="deleteAgencysModalLabel" class="displayInLine">
			<spring:message code="delete" />
			&nbsp;
			<spring:message code="agency" />
		</h3>
	</div>
	<div class="modal-body">
		<form name="deleteAgencyForm" novalidate>
			<p>
				<spring:message code="delete.confirm" />
				:&nbsp;{{agency.name}}?
			</p>

			<input type="submit" class="btn btn-inverse"
				ng-click="deleteAgency();" value='<spring:message code="delete"/>' />
			<button class="btn btn-inverse" data-dismiss="modal"
				ng-click="exit('#deleteAgencysModal');" aria-hidden="true">
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

<div id="searchAgencysModal" class="modal hide fade in centering"
	role="dialog" aria-labelledby="searchAgencysModalLabel"
	aria-hidden="true">
	<div class="modal-header">
		<h3 id="searchAgencysModalLabel" class="displayInLine">
			<spring:message code="search" />
		</h3>
	</div>
	<div class="modal-body">
		<form name="searchAgencyForm" novalidate>
			<label><spring:message code="search.for" /></label>

			<div>
				<div class="input-append">
					<input type="text" autofocus required ng-model="searchFor"
						name="searchFor" placeholder=<spring:message code='agencys.name'/> " />
				</div>
				<div class="input-append displayInLine">
					<label class="displayInLine"> <span
						class="alert alert-error"
						ng-show="displayValidationError && searchAgencyForm.searchFor.$error.required">
							<spring:message code="required" />
					</span>
					</label>
				</div>
			</div>
			<input type="submit" class="btn btn-inverse"
				ng-click="searchAgency(searchAgencyForm, false);"
				value='<spring:message code="search"/>' />
			<button class="btn btn-inverse" data-dismiss="modal"
				ng-click="exit('#searchAgencysModal');" aria-hidden="true">
				<spring:message code="cancel" />
			</button>
		</form>
	</div>
	<span class="alert alert-error dialogErrorMessage"
		ng-show="errorOnSubmit"> <spring:message code="request.error" />
	</span>
</div>
