<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<div id="addEmailTemplatesModal"
	class="modal hide fade in centering insertAndUpdateEmailTemplateDialogs"
	role="dialog" aria-labelledby="addEmailTemplatesModalLabel"
	aria-hidden="true">
	<div class="modal-header">
		<h3 id="addEmailTemplatesModalLabel" class="displayInLine">
			<spring:message code="create" />
			&nbsp;
			<spring:message code="emailTemplate" />
		</h3>
		
	</div>
	<div class="modal-body">
		<form name="newEmailTemplateForm" novalidate>
			<div class="container-fluid">
			
				<div class="row-fluid">
					<div class="span12">
						<fieldset>
						<div class="row-fluid">
						
								<label class="control-label span2"> <spring:message
										code="emailTemplates.categoryId" />:
								</label>
								<div class="span8">
									<input type="text" class="form-controlspan8" required
										ng-model="emailTemplate.categoryId" name="categoryId"
										placeholder="<spring:message code='emailTemplates.categoryId'/> " />
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newEmailTemplateForm.categoryId.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>
							<div class="row-fluid">
								<label class="control-label span2"> <spring:message
										code="emailTemplates.name" />:
								</label>
								<div class="span8">
									<input type="text" class="form-controlspan8" required
										ng-model="emailTemplate.name" name="name"
										placeholder="<spring:message code='emailTemplates.name'/> " />
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newEmailTemplateForm.name.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>
							<div class="row-fluid">
								<label class="control-label span2"> <spring:message
										code="emailTemplates.subject" />:
								</label>
								<div class="span8">
									<input type="text" class="form-controlspan8" required
										ng-model="emailTemplate.subject" name="subject"
										placeholder="<spring:message code='emailTemplates.subject'/> " />
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newEmailTemplateForm.subject.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>	
							<div class="row-fluid">
								<label class="control-label span2"> <spring:message
										code="emailTemplates.message" />:
								</label>
								<div class="span8">
									<textarea class="form-controlspan8" required	ng-model="emailTemplate.message" name="message"placeholder="<spring:message code='emailTemplates.message'/> "  style="width: 100%; outline: none;"></textarea>								
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newEmailTemplateForm.message.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>								
						</fieldset>
					</div>
				</div>
				<input type="submit" class="btn btn-inverse"
					ng-click="createEmailTemplate(newEmailTemplateForm);"
					value='<spring:message code="create"/>' />
				<button class="btn btn-inverse" data-dismiss="modal"
					ng-click="exit('#addEmailTemplatesModal');" aria-hidden="true">
					<spring:message code="cancel" />
				</button>
			</div>
		</form>
	</div>
	<span class="alert alert-error dialogErrorMessage"
		ng-show="errorOnSubmit"> <spring:message code="request.error" />
	</span>
</div>

<div id="updateEmailTemplatesModal"
	class="modal hide fade in centering insertAndUpdateEmailTemplateDialogs"
	role="dialog" aria-labelledby="updateEmailTemplatesModalLabel"
	aria-hidden="true">
	<div class="modal-header">
		<h3 id="updateEmailTemplatesModalLabel" class="displayInLine">
			<spring:message code="update" />
			&nbsp;
			<spring:message code="emailTemplate" />
		</h3>
	</div>
	<div class="modal-body">
		<form name="updateEmailTemplateForm" novalidate>
			<input type="hidden" required ng-model="emailTemplate.id" name="id"
				value="{{emailTemplate.id}}" />

			<div class="container-fluid">
				<div class="row-fluid">
					<div class="span12">
						<fieldset>	
						<div class="row-fluid">
						
								<label class="control-label span2"> <spring:message
										code="emailTemplates.categoryId" />:
								</label>
								<div class="span8">
									<input type="text" class="form-controlspan8" required
										ng-model="emailTemplate.categoryId" name="category"
										placeholder="<spring:message code='emailTemplates.categoryId'/> " />
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newPositionForm.categoryId.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>					
							<div class="row-fluid">
								<label class="control-label span2"> <spring:message
										code="emailTemplates.name" />:
								</label>
								<div class="span8">
									<input type="text" class="form-controlspan8" required
										ng-model="emailTemplate.name" name="name"
										placeholder="<spring:message code='emailTemplates.name'/> " />
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newEmailTemplateForm.name.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>
							<div class="row-fluid">
								<label class="control-label span2"> <spring:message
										code="emailTemplates.subject" />:
								</label>
								<div class="span8">
									<input type="text" class="form-controlspan8" required
										ng-model="emailTemplate.subject" name="subject"
										placeholder="<spring:message code='emailTemplates.subject'/> " />
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newEmailTemplateForm.subject.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>	
							<div class="row-fluid">
								<label class="control-label span2"> <spring:message
										code="emailTemplates.message" />:
								</label>
								<div class="span8">
										<textarea class="form-controlspan8" required	ng-model="emailTemplate.message" name="message"placeholder="<spring:message code='emailTemplates.message'/> "  style="width: 100%; outline: none;"></textarea>								
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newEmailTemplateForm.message.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>											
						</fieldset>
					</div>
				</div>
				<input type="submit" class="btn btn-inverse"
					ng-click="updateEmailTemplate(newEmailTemplateForm);"
					value='<spring:message code="update"/>' />
				<button class="btn btn-inverse" data-dismiss="modal"
					ng-click="exit('#updateEmailTemplatesModal');" aria-hidden="true">
					<spring:message code="cancel" />
				</button>
			</div>
		</form>
	</div>
	<span class="alert alert-error dialogErrorMessage"
		ng-show="errorOnSubmit"> <spring:message code="request.error" />
	</span>
</div>

<div id="deleteEmailTemplatesModal" class="modal hide fade in centering"
	role="dialog" aria-labelledby="searchEmailTemplatesModalLabel"
	aria-hidden="true">
	<div class="modal-header">
		<h3 id="deleteEmailTemplatesModalLabel" class="displayInLine">
			<spring:message code="delete" />
			&nbsp;
			<spring:message code="emailTemplate" />
		</h3>
	</div>
	<div class="modal-body">
		<form name="deleteEmailTemplateForm" novalidate>
			<p>
				<spring:message code="delete.confirm" />
				:&nbsp;{{emailTemplate.name}}?
			</p>

			<input type="submit" class="btn btn-inverse"
				ng-click="deleteEmailTemplate();" value='<spring:message code="delete"/>' />
			<button class="btn btn-inverse" data-dismiss="modal"
				ng-click="exit('#deleteEmailTemplatesModal');" aria-hidden="true">
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

<div id="searchEmailTemplatesModal" class="modal hide fade in centering"
	role="dialog" aria-labelledby="searchEmailTemplatesModalLabel"
	aria-hidden="true">
	<div class="modal-header">
		<h3 id="searchEmailTemplatesModalLabel" class="displayInLine">
			<spring:message code="search" />
		</h3>
	</div>
	<div class="modal-body">
		<form name="searchEmailTemplateForm" novalidate>
			<label><spring:message code="search.for" /></label>

			<div>
				<div class="input-append">
					<input type="text" autofocus required ng-model="searchFor"
						name="searchFor"
						placeholder=<spring:message code='emailTemplates.name'/> " />
				</div>
				<div class="input-append displayInLine">
					<label class="displayInLine"> <span
						class="alert alert-error"
						ng-show="displayValidationError && searchEmailTemplateForm.searchFor.$error.required">
							<spring:message code="required" />
					</span>
					</label>
				</div>
			</div>
			<input type="submit" class="btn btn-inverse"
				ng-click="searchEmailTemplate(searchEmailTemplateForm, false);"
				value='<spring:message code="search"/>' />
			<button class="btn btn-inverse" data-dismiss="modal"
				ng-click="exit('#searchEmailTemplatesModal');" aria-hidden="true">
				<spring:message code="cancel" />
			</button>
		</form>
	</div>
	<span class="alert alert-error dialogErrorMessage"
		ng-show="errorOnSubmit"> <spring:message code="request.error" />
	</span>
</div>
