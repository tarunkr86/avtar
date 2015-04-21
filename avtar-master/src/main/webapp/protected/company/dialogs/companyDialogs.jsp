<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<div id="addCompanyModal"
	class="modal hide fade in centering insertAndUpdateDialogs"
	role="dialog" aria-labelledby="addCompanyModalLabel" aria-hidden="true">
	<div class="modal-header">
		<h3 id="addCompanyModalLabel" class="displayInLine">
			<spring:message code="create" />
			&nbsp;
			<spring:message code="company" />
		</h3>
	</div>
	<div class="modal-body">
		<form name="newCompanyForm" novalidate>
			<div class="container-fluid">
				<div class="row-fluid">
					<div class="span6">
						<fieldset>
							<legend>Company Information</legend>
							<div class="row-fluid">
								<label class="control-label span2"> <spring:message
										code="company.name" />:
								</label>
								<div class="span8">
									<input type="text" class="form-control span8" required
										ng-model="company.name" name="name"
										placeholder="<spring:message code='company.name'/> " />
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newCompanyForm.name.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>
							<div class="row-fluid">
								<label class="control-label span2"> <spring:message
										code="company.url" />:
								</label>
								<div class="span8">
									<input type="text" class="form-control span8" required
										ng-model="company.url" name="url"
										placeholder="<spring:message code='company.url'/> " />
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newCompanyForm.url.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>
							<div class="row-fluid">
								<label class="control-label span2"> <spring:message
										code="company.address1" />:
								</label>
								<div class="span8">
									<input type="text" class="form-control span8" required
										ng-model="company.street1" name="street1"
										placeholder="<spring:message code='company.address1'/> " />
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newCompanyForm.street1.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>
							<div class="row-fluid">
								<label class="control-label span2"> <spring:message
										code="company.address2" />:
								</label>
								<div class="span8">
									<input type="text" class="form-control span8" required
										ng-model="company.street2" name="street2"
										placeholder="<spring:message code='company.address2'/> " />
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newCompanyForm.street2.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>
							<div class="row-fluid">
								<label class="control-label span2"> <spring:message
										code="company.city" />:
								</label>
								<div class="span8">
									<input type="text" class="form-control span8" required
										ng-model="company.city" name="city"
										placeholder="<spring:message code='company.city'/> " />
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newCompanyForm.city.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>

							<div class="row-fluid">
								<label class="control-label span2"> <spring:message
										code="company.country" />:
								</label>
								<div class="span8">
									<input type="text" class="form-control span8" required
										ng-model="company.country" name="country"
										placeholder="<spring:message code='company.country'/> " />
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newCompanyForm.country.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>

							<div class="row-fluid">
								<label class="control-label span2"> <spring:message
										code="company.province" />:
								</label>
								<div class="span8">
									<input type="text" class="form-control span8" required
										ng-model="company.province" name="province"
										placeholder="<spring:message code='company.province'/> " />
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newCompanyForm.province.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>
							<div class="row-fluid">
								<label class="control-label span2"> <spring:message
										code="company.postalCode" />:
								</label>
								<div class="span8">
									<input type="text" class="form-control span8" required
										ng-model="company.postalCode" name="postalCode"
										placeholder="<spring:message code='company.postalCode'/> " />
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newCompanyForm.postalCode.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>

						</fieldset>
					</div>
					<div class="span6">
						<fieldset>
							<legend>Company Phone</legend>
							<div class="row-fluid">
								<label class="control-label span2"> <spring:message
										code="company.primaryPhone" />:
								</label>
								<div class="span8">
									<input type="text" class="form-control span8" required
										ng-model="company.primaryPhone" name="primaryPhone"
										placeholder="<spring:message code='company.primaryPhone'/> " />
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newCompanyForm.primaryPhone.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>

							<div class="row-fluid">
								<label class="control-label span2"> <spring:message
										code="company.secondaryPhone" />:
								</label>
								<div class="span8">
									<input type="text" class="form-control span8" required
										ng-model="company.secondaryPhone" name="secondaryPhone"
										placeholder="<spring:message code='company.secondaryPhone'/> " />
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newCompanyForm.secondaryPhone.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>

							<div class="row-fluid">
								<label class="control-label span2"> <spring:message
										code="company.mobile" />:
								</label>
								<div class="span8">
									<input type="text" class="form-control span8" required
										ng-model="company.mobile" name="mobile"
										placeholder="<spring:message code='company.mobile'/> " />
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newCompanyForm.mobile.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>

							<div class="row-fluid">
								<label class="control-label span2"> <spring:message
										code="company.fax" />:
								</label>

								<div class="span8">
									<input type="text" class="form-control span8" required
										ng-model="company.fax" name="fax"
										placeholder="<spring:message code='company.fax'/> " />
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newCompanyForm.fax.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>
							<div class="row-fluid">
								<label class="control-label span2"> <spring:message
										code="company.notes" />:
								</label>
								<div class="span8">
										<textarea class="input-xlarge" required	ng-model="company.notes" name="notes"placeholder="<spring:message code='company.notes'/> "  style="width: 100%; outline: none;"></textarea>
								
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newCompanyForm.notes.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>
						</fieldset>
					</div>
				</div>
			</div>

			<input type="submit" class="btn btn-inverse"
				ng-click="createCompany(newCompanyForm);"
				value='<spring:message code="create"/>' />
			<button class="btn btn-inverse" data-dismiss="modal"
				ng-click="exit('#addCompanyModal');" aria-hidden="true">
				<spring:message code="cancel" />
			</button>
		</form>
	</div>
	<span class="alert alert-error dialogErrorMessage"
		ng-show="errorOnSubmit"> <spring:message code="request.error" />
	</span>
</div>

<div id="updateCompanyModal"
	class="modal hide fade in centering insertAndUpdateDialogs"
	role="dialog" aria-labelledby="updateCompanyModalLabel"
	aria-hidden="true">
	<div class="modal-header">
		<h3 id="updateCompanyModalLabel" class="displayInLine">
			<spring:message code="update" />
			&nbsp;
			<spring:message code="company" />
		</h3>
	</div>
	<div class="modal-body">
		<form name="updateCompanyForm" novalidate>
			<input type="hidden" required ng-model="company.id" name="id"
				value="{{company.id}}" />

			<div class="container-fluid">
				<div class="row-fluid">
					<div class="span6">
						<fieldset>
							<legend>Company Information</legend>
							<div class="row-fluid">
								<label class="control-label span2"> <spring:message
										code="company.name" />:
								</label>
								<div class="span8">
									<input type="text" class="form-control span8" required
										ng-model="company.name" name="name"
										placeholder="<spring:message code='company.name'/> " />
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newCompanyForm.name.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>
							<div class="row-fluid">
								<label class="control-label span2"> <spring:message
										code="company.url" />:
								</label>
								<div class="span8">
									<input type="text" class="form-control span8" required
										ng-model="company.url" name="url"
										placeholder="<spring:message code='company.url'/> " />
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newCompanyForm.url.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>
							<div class="row-fluid">
								<label class="control-label span2"> <spring:message
										code="company.address1" />:
								</label>
								<div class="span8">
									<input type="text" class="form-control span8" required
										ng-model="company.street1" name="street1"
										placeholder="<spring:message code='company.address1'/> " />
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newCompanyForm.stree1.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>
							<div class="row-fluid">
								<label class="control-label span2"> <spring:message
										code="company.address2" />:
								</label>
								<div class="span8">
									<input type="text" class="form-control span8" required
										ng-model="company.street2" name="street2"
										placeholder="<spring:message code='company.address2'/> " />
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newCompanyForm.street2.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>
							<div class="row-fluid">
								<label class="control-label span2"> <spring:message
										code="company.city" />:
								</label>
								<div class="span8">
									<input type="text" class="form-control span8" required
										ng-model="company.city" name="city"
										placeholder="<spring:message code='company.city'/> " />
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newCompanyForm.city.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>

							<div class="row-fluid">
								<label class="control-label span2"> <spring:message
										code="company.country" />:
								</label>
								<div class="span8">
									<input type="text" class="form-control span8" required
										ng-model="company.country" name="country"
										placeholder="<spring:message code='company.country'/> " />
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newCompanyForm.country.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>

							<div class="row-fluid">
								<label class="control-label span2"> <spring:message
										code="company.province" />:
								</label>
								<div class="span8">
									<input type="text" class="form-control span8" required
										ng-model="company.province" name="province"
										placeholder="<spring:message code='company.province'/> " />
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newCompanyForm.province.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>
							<div class="row-fluid">
								<label class="control-label span2"> <spring:message
										code="company.postalCode" />:
								</label>
								<div class="span8">
									<input type="text" class="form-control span8" required
										ng-model="company.postalCode" name="postalCode"
										placeholder="<spring:message code='company.postalCode'/> " />
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newCompanyForm.postalCode.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>

						</fieldset>
					</div>
					<div class="span6">
						<fieldset>
							<legend>Company Phone</legend>
							<div class="row-fluid">
								<label class="control-label span2"> <spring:message
										code="company.primaryPhone" />:
								</label>
								<div class="span8">
									<input type="text" class="form-control span8" required
										ng-model="company.primaryPhone" name="primaryPhone"
										placeholder="<spring:message code='company.primaryPhone'/> " />
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newCompanyForm.primaryPhone.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>

							<div class="row-fluid">
								<label class="control-label span2"> <spring:message
										code="company.secondaryPhone" />
								</label>
								<div class="span8">
									<input type="text" class="form-control span8" required
										ng-model="company.secondaryPhone" name="secondaryPhone"
										placeholder="<spring:message code='company.secondaryPhone'/> " />
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newCompanyForm.secondaryPhone.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>

							<div class="row-fluid">
								<label class="control-label span2"> <spring:message
										code="company.mobile" />:
								</label>
								<div class="span8">
									<input type="text" class="form-control span8" required
										ng-model="company.mobile" name="mobile"
										placeholder="<spring:message code='company.mobile'/> " />
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newCompanyForm.mobile.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>

							<div class="row-fluid">
								<label class="control-label span2"> <spring:message
										code="company.fax" />:
								</label>

								<div class="span8">
									<input type="text" class="form-control span8" required
										ng-model="company.fax" name="fax"
										placeholder="<spring:message code='company.fax'/> " />
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newCompanyForm.fax.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>
							<div class="row-fluid">
								<label class="control-label span2"> <spring:message
										code="company.notes" />:
								</label>
								<div class="span8">
									<textarea class="input-xlarge" required	ng-model="company.notes" name="notes"placeholder="<spring:message code='company.notes'/> "  style="width: 100%; outline: none;"></textarea>
								
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newCompanyForm.notes.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>
						</fieldset>
					</div>
				</div>
			</div>

			<input type="submit" class="btn btn-inverse"
				ng-click="updateCompany(updateCompanyForm);"
				value='<spring:message code="update"/>' />
			<button class="btn btn-inverse" data-dismiss="modal"
				ng-click="exit('#updateCompanyModal');" aria-hidden="true">
				<spring:message code="cancel" />
			</button>
	</div>
	</form>
</div>
<span class="alert alert-error dialogErrorMessage"
	ng-show="errorOnSubmit"> <spring:message code="request.error" />
</span>
</div>

<div id="deleteCompanyModal" class="modal hide fade in centering"
	role="dialog" aria-labelledby="searchCompanyModalLabel"
	aria-hidden="true">
	<div class="modal-header">
		<h3 id="deleteCompanyModalLabel" class="displayInLine">
			<spring:message code="delete" />
			&nbsp;
			<spring:message code="company" />
		</h3>
	</div>
	<div class="modal-body">
		<form name="deleteCompanyForm" novalidate>
			<p>
				<spring:message code="delete.confirm" />
				:&nbsp;{{company.name}}?
			</p>

			<input type="submit" class="btn btn-inverse"
				ng-click="deleteCompany();" value='<spring:message code="delete"/>' />
			<button class="btn btn-inverse" data-dismiss="modal"
				ng-click="exit('#deleteCompanyModal');" aria-hidden="true">
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

<div id="searchCompanyModal" class="modal hide fade in centering"
	role="dialog" aria-labelledby="searchCompanyModalLabel"
	aria-hidden="true">
	<div class="modal-header">
		<h3 id="searchCompanyModalLabel" class="displayInLine">
			<spring:message code="search" />
		</h3>
	</div>
	<div class="modal-body">
		<form name="searchCompanyForm" novalidate>
			<label><spring:message code="search.for" /></label>

			<div>
				<div class="input-append">
					<input type="text" autofocus required ng-model="searchFor"
						name="searchFor"
						placeholder="<spring:message code='company'/>&nbsp;<spring:message code='company.name'/> " />
				</div>
				<div class="input-append displayInLine">
					<label class="displayInLine"> <span
						class="alert alert-error"
						ng-show="displayValidationError && searchCompanyForm.searchFor.$error.required">
							<spring:message code="required" />
					</span>
					</label>
				</div>
			</div>
			<input type="submit" class="btn btn-inverse"
				ng-click="searchCompany(searchCompanyForm, false);"
				value='<spring:message code="search"/>' />
			<button class="btn btn-inverse" data-dismiss="modal"
				ng-click="exit('#searchCompanyModal');" aria-hidden="true">
				<spring:message code="cancel" />
			</button>
		</form>
	</div>
	<span class="alert alert-error dialogErrorMessage"
		ng-show="errorOnSubmit"> <spring:message code="request.error" />
	</span>
</div>
