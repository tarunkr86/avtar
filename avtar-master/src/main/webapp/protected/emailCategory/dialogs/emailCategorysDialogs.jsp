<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<div id="addEmailCategorysModal"
	class="modal hide fade in centering insertAndUpdateEmailCategoryDialogs"
	role="dialog" aria-labelledby="addEmailCategorysModalLabel"
	aria-hidden="true">
	<div class="modal-header">
		<h3 id="addEmailCategorysModalLabel" class="displayInLine">
			<spring:message code="create" />
			&nbsp;
			<spring:message code="emailCategory" />
		</h3>
	</div>
	<div class="modal-body">
		<form name="newEmailCategoryForm" novalidate>
			<div class="container-fluid">
				<div class="row-fluid">
					<div class="span12">
						<fieldset>
						
							<div class="row-fluid">
								<label class="control-label span2"> <spring:message
										code="emailCategorys.name" />:
								</label>
								<div class="span8">
									<input type="text" class="form-controlspan8" required
										ng-model="emailCategory.name" name="name"
										placeholder="<spring:message code='emailCategorys.name'/> " />
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newEmailCategoryForm.name.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>							
						</fieldset>
					</div>
				</div>
				<input type="submit" class="btn btn-inverse"
					ng-click="createEmailCategory(newEmailCategoryForm);"
					value='<spring:message code="create"/>' />
				<button class="btn btn-inverse" data-dismiss="modal"
					ng-click="exit('#addEmailCategorysModal');" aria-hidden="true">
					<spring:message code="cancel" />
				</button>
			</div>
		</form>
	</div>
	<span class="alert alert-error dialogErrorMessage"
		ng-show="errorOnSubmit"> <spring:message code="request.error" />
	</span>
</div>

<div id="updateEmailCategorysModal"
	class="modal hide fade in centering insertAndUpdateEmailCategoryDialogs"
	role="dialog" aria-labelledby="updateEmailCategorysModalLabel"
	aria-hidden="true">
	<div class="modal-header">
		<h3 id="updateEmailCategorysModalLabel" class="displayInLine">
			<spring:message code="update" />
			&nbsp;
			<spring:message code="emailCategory" />
		</h3>
	</div>
	<div class="modal-body">
		<form name="updateEmailCategoryForm" novalidate>
			<input type="hidden" required ng-model="emailCategory.id" name="id"
				value="{{emailCategory.id}}" />

			<div class="container-fluid">
				<div class="row-fluid">
					<div class="span12">
						<fieldset>						
							<div class="row-fluid">
								<label class="control-label span2"> <spring:message
										code="emailCategorys.name" />:
								</label>
								<div class="span8">
									<input type="text" class="form-controlspan8" required
										ng-model="emailCategory.name" name="name"
										placeholder="<spring:message code='emailCategorys.name'/> " />
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newEmailCategoryForm.name.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>							
						</fieldset>
					</div>
				</div>
				<input type="submit" class="btn btn-inverse"
					ng-click="updateEmailCategory(newEmailCategoryForm);"
					value='<spring:message code="update"/>' />
				<button class="btn btn-inverse" data-dismiss="modal"
					ng-click="exit('#updateEmailCategorysModal');" aria-hidden="true">
					<spring:message code="cancel" />
				</button>
			</div>
		</form>
	</div>
	<span class="alert alert-error dialogErrorMessage"
		ng-show="errorOnSubmit"> <spring:message code="request.error" />
	</span>
</div>

<div id="deleteEmailCategorysModal" class="modal hide fade in centering"
	role="dialog" aria-labelledby="searchEmailCategorysModalLabel"
	aria-hidden="true">
	<div class="modal-header">
		<h3 id="deleteEmailCategorysModalLabel" class="displayInLine">
			<spring:message code="delete" />
			&nbsp;
			<spring:message code="emailCategory" />
		</h3>
	</div>
	<div class="modal-body">
		<form name="deleteEmailCategoryForm" novalidate>
			<p>
				<spring:message code="delete.confirm" />
				:&nbsp;{{emailCategory.name}}?
			</p>

			<input type="submit" class="btn btn-inverse"
				ng-click="deleteEmailCategory();" value='<spring:message code="delete"/>' />
			<button class="btn btn-inverse" data-dismiss="modal"
				ng-click="exit('#deleteEmailCategorysModal');" aria-hidden="true">
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

<div id="searchEmailCategorysModal" class="modal hide fade in centering"
	role="dialog" aria-labelledby="searchEmailCategorysModalLabel"
	aria-hidden="true">
	<div class="modal-header">
		<h3 id="searchEmailCategorysModalLabel" class="displayInLine">
			<spring:message code="search" />
		</h3>
	</div>
	<div class="modal-body">
		<form name="searchEmailCategoryForm" novalidate>
			<label><spring:message code="search.for" /></label>

			<div>
				<div class="input-append">
					<input type="text" autofocus required ng-model="searchFor"
						name="searchFor"
						placeholder=<spring:message code='emailCategorys.name'/> " />
				</div>
				<div class="input-append displayInLine">
					<label class="displayInLine"> <span
						class="alert alert-error"
						ng-show="displayValidationError && searchEmailCategoryForm.searchFor.$error.required">
							<spring:message code="required" />
					</span>
					</label>
				</div>
			</div>
			<input type="submit" class="btn btn-inverse"
				ng-click="searchEmailCategory(searchEmailCategoryForm, false);"
				value='<spring:message code="search"/>' />
			<button class="btn btn-inverse" data-dismiss="modal"
				ng-click="exit('#searchEmailCategorysModal');" aria-hidden="true">
				<spring:message code="cancel" />
			</button>
		</form>
	</div>
	<span class="alert alert-error dialogErrorMessage"
		ng-show="errorOnSubmit"> <spring:message code="request.error" />
	</span>
</div>
