<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<div id="addUsersModal"
	class="modal hide fade in centering insertAndUpdateUserDialogs"
	role="dialog" aria-labelledby="addUsersModalLabel" aria-hidden="true">
	<div class="modal-header">
		<h3 id="addUsersModalLabel" class="displayInLine">
			<spring:message code="create" />
			&nbsp;
			<spring:message code="user" />
		</h3>
	</div>
	<div class="modal-body">
		<form name="newUserForm" novalidate>
			<div class="container-fluid">
				<div class="row-fluid">
					<div class="span6">
						<fieldset>
							<legend>Basic Information</legend>
							<div class="row-fluid" >
								<label class="control-label span3"> <spring:message
										code="users.prefix" />:
								</label>
								<div class="span7">									
									<select ng-options="item as item  for item in prefixs" class="form-controlspan7" required
										ng-model="user.prefix" name="prefix" placeholder="<spring:message code='users.prefix'/> "><option value=''>Select</option></select>							
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newUserForm.prefix.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>
							<div class="row-fluid">
								<label class="control-label span3"> <spring:message
										code="users.name" />:
								</label>
								<div class="span7">
									<input type="text" class="form-controlspan7" required
										ng-model="user.name" 
										placeholder="<spring:message code='users.name'/> " />
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newUserForm.name.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>
							<div class="row-fluid">
								<label class="control-label span3"> <spring:message
										code="users.phone" />:
								</label>
								<div class="span7">
									<input type="text" class="form-controlspan7" required
										ng-model="user.phone" name="phone"
										placeholder="<spring:message code='users.phone'/> " />
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newUserForm.phone.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>

							<div class="row-fluid">
								<label class="control-label span3"> <spring:message
										code="users.title" />:
								</label>
								<div class="span7">
									<select  ng-options="item as item  for item in titles" class="form-controlspan7" required
										ng-model="user.title" name="title" placeholder="<spring:message code='users.title'/> "><option value=''>Select</option></select>
							
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newUserForm.title.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>
							<div class="row-fluid">
								<label class="control-label span3"> <spring:message
										code="users.departmentId" />:
								</label>
								<div class="span7">
									<!-- <input type="text" class="form-controlspan7" required
										ng-model="user.departmentId" name="departmentId"
										placeholder="<spring:message code='users.departmentId'/> " />-->
										<select ng-options="name.id as name.name for name in departments " class="form-controlspan7" required
										ng-model="user.departmentId" name="departmentId"  placeholder="<spring:message code='users.departmentId'/> "><option value=''>Select</option></select>																			
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newUserForm.departmentId.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>
						</fieldset>
					</div>
					<div class="span6">
						<fieldset>
							<legend>Security Information</legend>
							<div class="row-fluid">
								<label class="control-label span3"> <spring:message
										code="users.email" />:
								</label>
								<div class="span7">
									<input type="text" class="form-controlspan7" required
										ng-model="user.email" name="email"
										placeholder="<spring:message code='users.email'/> " />
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newUserForm.email.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>
							<div class="row-fluid">
								<label class="control-label span3"> <spring:message
										code="users.assignableRecruiter" />:
								</label>
								<div class="span1">
									<input type="checkbox" class="form-controlspan1" required
										ng-model="user.assignableRecruiter" name="assignableRecruiter" ng-true-value="true" ng-false-value="false"
										placeholder="<spring:message code='users.assignableRecruiter'/> " />
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newUserForm.assignableRecruiter.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>
							<div class="row-fluid">
								<label class="control-label span3"> <spring:message
										code="users.enabled" />:
								</label>
								<div class="span1">
									<input type="checkbox" class="form-controlspan1" required
										ng-model="user.enabled" name="enabled" ng-true-value="true" ng-false-value="false"
										placeholder="<spring:message code='users.enabled'/> " />
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newUserForm.enabled.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>
							<div class="row-fluid">
								<label class="control-label span3"> <spring:message
										code="users.role" />:
								</label>
								<div class="span7">
									<!--  <input type="text" class="form-controlspan7" required
										ng-model="user.role" name="role"
										placeholder="<spring:message code='users.role'/> " />-->
										<select ng-options="item as item  for item in roles" class="form-controlspan7" required
										ng-model="user.role" name="role" placeholder="<spring:message code='users.role'/> "><option value=''>Select</option></select>													
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newUserForm.role.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>
							<div class="row-fluid">
								<label class="control-label span3"> <spring:message
										code="users.password" />:
								</label>
								<div class="span7">
									<input type="password" class="form-controlspan7" required
										ng-model="user.password" name="password"
										placeholder="<spring:message code='users.password'/> " />
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newUserForm.password.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>
						</fieldset>
					</div>
				</div>
				<input type="submit" class="btn btn-inverse"
					ng-click="createUser(newUserForm);"
					value='<spring:message code="create"/>' />
				<button class="btn btn-inverse" data-dismiss="modal"
					ng-click="exit('#addUsersModal');" aria-hidden="true">
					<spring:message code="cancel" />
				</button>
			</div>
		</form>
	</div>
	<span class="alert alert-error dialogErrorMessage"
		ng-show="errorOnSubmit"> <spring:message code="request.error" />
	</span>
</div>

<div id="updateUsersModal"
	class="modal hide fade in centering insertAndUpdateUserDialogs"
	role="dialog" aria-labelledby="updateUsersModalLabel"
	aria-hidden="true">
	<div class="modal-header">
		<h3 id="updateUsersModalLabel" class="displayInLine">
			<spring:message code="update" />
			&nbsp;
			<spring:message code="user" />
		</h3>
	</div>
	<div class="modal-body">
		<form name="updateUserForm" novalidate>
			<input type="hidden" required ng-model="user.id" name="id"
				value="{{user.id}}" />

			<div class="container-fluid">
				<div class="row-fluid">
					<div class="span6">
						<fieldset>
							<legend>Basic Information</legend>
							<div class="row-fluid">
								<label class="control-label span3"> <spring:message
										code="users.prefix" />:
								</label>
								<div class="span7">									
									<select ng-options="item as item  for item in prefixs" class="form-controlspan7" required
										ng-model="user.prefix" name="prefix" placeholder="<spring:message code='users.prefix'/> "><option value=''>Select</option></select>
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newUserForm.prefix.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>
							<div class="row-fluid">
								<label class="control-label span3"> <spring:message
										code="users.name" />:
								</label>
								<div class="span7">
									<input type="text" class="form-controlspan7" required
										ng-model="user.name" name="name"
										placeholder="<spring:message code='users.name'/> " />
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newUserForm.name.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>
							<div class="row-fluid">
								<label class="control-label span3"> <spring:message
										code="users.phone" />:
								</label>
								<div class="span7">
									<input type="text" class="form-controlspan7" required
										ng-model="user.phone" name="phone"
										placeholder="<spring:message code='users.phone'/> " />
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newUserForm.phone.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>

							<div class="row-fluid">
								<label class="control-label span3"> <spring:message
										code="users.title" />:
								</label>
								<div class="span7">
									<select ng-options="item as item  for item in titles" class="form-controlspan7" required
										ng-model="user.title" name="title" placeholder="<spring:message code='users.title'/> "><option value=''>Select</option></select>							
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newUserForm.title.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>
							<div class="row-fluid">
								<label class="control-label span3"> <spring:message
										code="users.departmentId" />:
								</label>
								<div  class="span7">
									<!-- <input type="text" class="form-controlspan7" required
										ng-model="user.departmentId" name="departmentId"
										placeholder="<spring:message code='users.departmentId'/> " />-->
										<select  ng-options="name.id as name.name for name in departments" class="form-controlspan7" required  
										ng-model="user.companyDepartment.id" name="departmentId" placeholder="<spring:message code='users.departmentId'/> "><option value=''>Select</option></select>																			
								</div>          
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newUserForm.departmentId.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>
						</fieldset>
					</div>
					<div class="span6">
						<fieldset>
							<legend>Security Information</legend>
							<div class="row-fluid">
								<label class="control-label span3"> <spring:message
										code="users.email" />:
								</label>
								<div class="span7">
									<input type="emai" class="form-controlspan7" required
										ng-model="user.email" 
										placeholder="<spring:message code='users.email'/> " />
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newUserForm.email.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>
							<div class="row-fluid">
								<label class="control-label span3"> <spring:message
										code="users.assignableRecruiter" />:
								</label>
								<div class="span1">
									<input type="checkbox" class="form-controlspan1" required
										ng-model="user.assignableRecruiter" name="assignableRecruiter" ng-true-value="true" ng-false-value="false"
										placeholder="<spring:message code='users.assignableRecruiter'/> " />
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newUserForm.assignableRecruiter.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>
							<div class="row-fluid">
								<label class="control-label span3"> <spring:message
										code="users.enabled" />:
								</label>
								<div class="span1">
									<input type="checkbox" class="form-controlspan1" required
										ng-model="user.enabled" name="enabled" ng-true-value="true" ng-false-value="false"
										placeholder="<spring:message code='users.enabled'/> " />
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newUserForm.enabled.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>
							<div class="row-fluid">
								<label class="control-label span3"> <spring:message
										code="users.role" />:
								</label>
								<div class="span7">
									<!--  <input type="text" class="form-controlspan7" required
										ng-model="user.role" name="role"
										placeholder="<spring:message code='users.role'/> " />-->
										<select ng-options="item as item  for item in roles" class="form-controlspan7" required
										ng-model="user.role" name="role" placeholder="<spring:message code='users.role'/> "><option value=''>Select</option></select>													
								
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newUserForm.role.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>
							<div class="row-fluid">
								<label class="control-label span3"> <spring:message
										code="users.password" />:
								</label>
								<div class="span7">
									<input type="password" class="form-controlspan7" required
										ng-model="user.password" name="password"
										placeholder="<spring:message code='users.password'/> " />
								</div>
								<label class="control-label span2"> <span
									class="alert alert-error"
									ng-show="displayValidationError && newUserForm.password.$error.required">
										<spring:message code="required" />
								</span>
								</label>
							</div>
						</fieldset>
					</div>
				</div>
				<input type="submit" class="btn btn-inverse"
					ng-click="updateUser(newUserForm);"
					value='<spring:message code="update"/>' />
				<button class="btn btn-inverse" data-dismiss="modal"
					ng-click="exit('#updateUsersModal');" aria-hidden="true">
					<spring:message code="cancel" />
				</button>
			</div>
		</form>
	</div>
	<span class="alert alert-error dialogErrorMessage"
		ng-show="errorOnSubmit"> <spring:message code="request.error" />
	</span>
</div>

<div id="deleteUsersModal" class="modal hide fade in centering"
	role="dialog" aria-labelledby="searchUsersModalLabel"
	aria-hidden="true">
	<div class="modal-header">
		<h3 id="deleteUsersModalLabel" class="displayInLine">
			<spring:message code="delete" />
			&nbsp;
			<spring:message code="user" />
		</h3>
	</div>
	<div class="modal-body">
		<form name="deleteUserForm" novalidate>
			<p>
				<spring:message code="delete.confirm" />
				:&nbsp;{{user.name}}?
			</p>

			<input type="submit" class="btn btn-inverse" ng-click="deleteUser();"
				value='<spring:message code="delete"/>' />
			<button class="btn btn-inverse" data-dismiss="modal"
				ng-click="exit('#deleteUsersModal');" aria-hidden="true">
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

<div id="searchUsersModal" class="modal hide fade in centering"
	role="dialog" aria-labelledby="searchUsersModalLabel"
	aria-hidden="true">
	<div class="modal-header">
		<h3 id="searchUsersModalLabel" class="displayInLine">
			<spring:message code="search" />
		</h3>
	</div>
	<div class="modal-body">
		<form name="searchUserForm" novalidate>
			<label><spring:message code="search.for" /></label>

			<div>
				<div class="input-append">
					<input type="text" autofocus required ng-model="searchFor"
						name="searchFor"
						placeholder="<spring:message code='user'/>&nbsp;<spring:message code='users.name'/> " />
				</div>
				<div class="input-append displayInLine">
					<label class="displayInLine"> <span
						class="alert alert-error"
						ng-show="displayValidationError && searchUserForm.searchFor.$error.required">
							<spring:message code="required" />
					</span>
					</label>
				</div>
			</div>
			<input type="submit" class="btn btn-inverse"
				ng-click="searchUser(searchUserForm, false);"
				value='<spring:message code="search"/>' />
			<button class="btn btn-inverse" data-dismiss="modal"
				ng-click="exit('#searchUsersModal');" aria-hidden="true">
				<spring:message code="cancel" />
			</button>
		</form>
	</div>
	<span class="alert alert-error dialogErrorMessage"
		ng-show="errorOnSubmit"> <spring:message code="request.error" />
	</span>
</div>
