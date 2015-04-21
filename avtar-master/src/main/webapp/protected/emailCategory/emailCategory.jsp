<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container">
	<ul class="breadcrumb">
		<li><a href="#">You are here : Templates</a> <span
			class="divider">/</span></li>
		<li><a href="#">Email Category</a> <span class="divider">/</span></li>
	</ul>
</div>

<div class="row-fluid" ng-controller="emailCategorysController">
	<div class="span10">
		<h4>
			<!--  <div ng-class="{'text-center': displayCreateEmailCategoryButton == false, 'none': displayCreateEmailCategoryButton == false}">
            <br/>-->
			<a href="#addEmailCategorysModal" role="button"
				ng-click="resetEmailCategory();"
				title="<spring:message code='create'/>&nbsp;<spring:message code='emailCategory'/>"
				class="btn btn-inverse" data-toggle="modal"> <i
				class=" icon-plus-sign"></i> &nbsp;&nbsp;<spring:message code="create" />&nbsp;<spring:message
					code="emailCategory" />
			</a>
			<!--   </div>-->
		</h4>
	</div>
	<div class="span2">
		<h4>
			<p class="text-center">
				<spring:message code='emailCategorys.header' />
				&nbsp; <a href="#searchEmailCategorysModal"
					id="emailCategorysHeaderButton" role="button"
					ng-class="{'': displaySearchButton == true, 'none': displaySearchButton == false}"
					title="<spring:message code="search"/>&nbsp;<spring:message code="emailCategory"/>"
					class="btn btn-inverse" data-toggle="modal"> <i
					class="icon-search"></i>
				</a>
			</p>
		</h4>
	</div>
</div>


<div class="row-fluid" ng-controller="emailCategorysController">

	<div>
		<div id="loadingModal" class="modal hide fade in centering"
			role="dialog" aria-labelledby="deleteEmailCategorysModalLabel"
			aria-hidden="true">
			<div id="divLoadingIcon" class="text-center">
				<div class="progress progress-striped active">
					<div class="bar" style="width: 100%;"></div>
				</div>
			</div>
		</div>

		<div
			ng-class="{'alert badge-inverse': displaySearchMessage == true, 'none': displaySearchMessage == false}">
			<h4>
				<p class="messageToUser">
					<i class="icon-info-sign"></i>&nbsp;{{page.searchMessage}}
				</p>
			</h4>
			<a href="#" role="button" ng-click="resetSearch();"
				ng-class="{'': displaySearchMessage == true, 'none': displaySearchMessage == false}"
				title="<spring:message code='search.reset'/>"
				class="btn btn-inverse" data-toggle="modal"> <i
				class="icon-remove"></i> <spring:message code="search.reset" />
			</a>
		</div>

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
				<spring:message code="emailCategorys.emptyData" />
			</h4>
			<br />

			<p>
				<spring:message code="emailCategorys.emptyData.text" />
			</p>
		</div>

		<div id="gridContainer"
			ng-class="{'': state == 'list', 'none': state != 'list'}">
			<table class="table table-bordered table-striped">
				<thead>
					<tr>
						<th scope="col"><spring:message code="emailCategorys.name" /></th>																		
						<th scope="col"><spring:message	code="emailCategorys.action" /></th>
					</tr>
				</thead>
				<tbody>
					<tr ng-repeat="emailCategory in page.source">
                        
						<td class="tdEmailCategorysCentered">{{emailCategory.name}}</td>																														
						<td class="width15">
							<div class="text-center">
								<input type="hidden" value="{{emailCategory.id}}" /> <a
									href="#updateEmailCategorysModal"
									ng-click="selectedEmailCategory(emailCategory);" role="button"
									title="<spring:message code="update"/>&nbsp;<spring:message code="emailCategory"/>"
									class="btn btn-inverse" data-toggle="modal"> <i
									class="icon-edit"></i>
								</a>
								 <a href="#deleteEmailCategorysModal"
                               ng-click="selectedEmailCategory(emailCategory);"
                               role="button"
                               title="<spring:message code="delete"/>&nbsp;<spring:message code="emailCategory"/>"
                               class="btn btn-inverse" data-toggle="modal">
                                <i class="icon-minus"></i>
                            </a>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
			<div class="raw-fluid">
				<div class="span8">
					<div class="text-left">
						<button href="#" class="btn btn-inverse"
							ng-class="{'btn-inverse': page.currentPage != 0, 'disabled': page.currentPage == 0}"
							ng-disabled="page.currentPage == 0" ng-click="changePage(0)"
							title='<spring:message code="pagination.first"/>'>
							<spring:message code="pagination.first" />
						</button>
						<button href="#" class="btn btn-inverse"
							ng-class="{'btn-inverse': page.currentPage != 0, 'disabled': page.currentPage == 0}"
							ng-disabled="page.currentPage == 0" class="btn btn-inverse"
							ng-click="changePage(page.currentPage - 1)"
							title='<spring:message code="pagination.back"/>'>&lt;</button>
						<span>{{page.currentPage + 1}} <spring:message
								code="pagination.of" /> {{page.pagesCount}}
						</span>
						<button href="#" class="btn btn-inverse"
							ng-class="{'btn-inverse': page.pagesCount - 1 != page.currentPage, 'disabled': page.pagesCount - 1 == page.currentPage}"
							ng-click="changePage(page.currentPage + 1)"
							ng-disabled="page.pagesCount - 1 == page.currentPage"
							title='<spring:message code="pagination.next"/>'>&gt;</button>
						<button href="#" class="btn btn-inverse"
							ng-class="{'btn-inverse': page.pagesCount - 1 != page.currentPage, 'disabled': page.pagesCount - 1 == page.currentPage}"
							ng-disabled="page.pagesCount - 1 == page.currentPage"
							ng-click="changePage(page.pagesCount - 1)"
							title='<spring:message code="pagination.last"/>'>
							<spring:message code="pagination.last" />
						</button>
					</div>
				</div>
				<div class="span4">
					<h5>
						<div ng-class="{'': state == 'list', 'none': state != 'list'}">
							<p class="text-center">
								<spring:message code="message.total.records.found" />
								:&nbsp;{{page.totalEmailCategorys}}
							</p>
						</div>
					</h5>
				</div>
			</div>
		</div>
		<jsp:include page="dialogs/emailCategorysDialogs.jsp" />

	</div>
</div>

<script src="<c:url value="/resources/js/pages/emailCategorys.js" />"></script>