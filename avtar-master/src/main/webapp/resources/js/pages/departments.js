function departmentsController($scope, $http) {
	
    $scope.pageToGet = 0;
    $scope.state = 'busy';
    $scope.lastAction = '';
    $scope.url = "/avtar/protected/departments/";
    $scope.errorOnSubmit = false;
    $scope.errorIllegalAccess = false;
    $scope.displayMessageToUser = false;
    $scope.displayValidationError = false;
    $scope.displaySearchMessage = false;
    $scope.displaySearchButton = false;
    $scope.displayCreateDepartmentButton = false;
    $scope.department = {};
    $scope.searchFor = "";
    $scope.getDepartmentList = function () {
        var url = $scope.url;
        $scope.lastAction = 'list';
        $scope.startDialogAjaxRequest();
        var config = {params: {page: $scope.pageToGet}};
        $http.get(url, config)
            .success(function (data) {
            	//alert(data.departments[0].companyLocations[0]); 
            	//alert(data.totalDepartments);
                $scope.finishAjaxCallOnSuccess(data, null, false);
            })
            .error(function () {
                $scope.state = 'error';
                $scope.displayCreateDepartmentButton = false;
            });
    };
    
    $scope.populateTable = function (data) {
//var range=[];
        if (data.pagesCount > 0) {
            $scope.state = 'list';
            $scope.page = {source: data.departments, currentPage: $scope.pageToGet, pagesCount: data.pagesCount, totalDepartments : data.totalDepartments};
            /*for(var i=0; i< data.totalDepartments;i++){            	
            	  var Location= data.departments[i].companyLocations[i].name;
            	  range.push(Location);
            	  $scope.Range = range;
            	}*/
            
            if($scope.page.pagesCount <= $scope.page.currentPage){
                $scope.pageToGet = $scope.page.pagesCount - 1;
                $scope.page.currentPage = $scope.page.pagesCount - 1;
            }

            $scope.displayCreateDepartmentButton = true;
            $scope.displaySearchButton = true;
        } else {
            $scope.state = 'noresult';
            $scope.displayCreateDepartmentButton = true;

            if(!$scope.searchFor){
                $scope.displaySearchButton = false;
            }
        }

        if (data.actionMessage || data.searchMessage) {
            $scope.displayMessageToUser = $scope.lastAction != 'search';

            $scope.page.actionMessage = data.actionMessage;
            $scope.page.searchMessage = data.searchMessage;
        } else {
            $scope.displayMessageToUser = false;
        }
    };

    $scope.changePage = function (page) {
        $scope.pageToGet = page;

        if($scope.searchFor){
            $scope.searchDepartment($scope.searchFor, true);
        } else{
            $scope.getDepartmentList();
        }
    };

    $scope.exit = function (modalId) {
        $(modalId).modal('hide');

        $scope.department = {};
        $scope.errorOnSubmit = false;
        $scope.errorIllegalAccess = false;
        $scope.displayValidationError = false;
    };

    $scope.finishAjaxCallOnSuccess = function (data, modalId, isPagination) {
        $scope.populateTable(data);
        $("#loadingModal").modal('hide');

        if(!isPagination){
            if(modalId){
                $scope.exit(modalId);
            }
        }

        $scope.lastAction = '';
    };

    $scope.startDialogAjaxRequest = function () {
        $scope.displayValidationError = false;
        $("#loadingModal").modal('show');
        $scope.previousState = $scope.state;
        $scope.state = 'busy';
    };

    $scope.handleErrorInDialogs = function (status) {
        $("#loadingModal").modal('hide');
        $scope.state = $scope.previousState;

        // illegal access
        if(status == 403){
            $scope.errorIllegalAccess = true;
            return;
        }

        $scope.errorOnSubmit = true;
        $scope.lastAction = '';
    };

    $scope.addSearchParametersIfNeeded = function(config, isPagination) {
        if(!config.params){
            config.params = {};
        }

        config.params.page = $scope.pageToGet;

        if($scope.searchFor){
            config.params.searchFor = $scope.searchFor;
        }
    };

    $scope.resetDepartment = function(){
        $scope.department = {};
    };

    $scope.createDepartment = function (newDepartmentForm) {
        if (!newDepartmentForm.$valid) {
            $scope.displayValidationError = true;
            return;
        }

        $scope.lastAction = 'create';

        var url = $scope.url;

        var config = {headers: {'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'}};

        $scope.addSearchParametersIfNeeded(config, false);

        $scope.startDialogAjaxRequest();

        $http.post(url, $.param($scope.department), config)
            .success(function (data) {
            	
                $scope.finishAjaxCallOnSuccess(data, "#addDepartmentsModal", false);
            })
            .error(function(data, status, headers, config) {
                $scope.handleErrorInDialogs(status);
            });
    };

    $scope.selectedDepartment = function (department) {
    	
        var selectedDepartment = angular.copy(department);
        $scope.department = selectedDepartment;
    };

    $scope.updateDepartment = function (updateDepartmentForm) {
        if (!updateDepartmentForm.$valid) {
            $scope.displayValidationError = true;
            return;
        }

        $scope.lastAction = 'update';

        var url = $scope.url + $scope.department.id;

        $scope.startDialogAjaxRequest();

        var config = {};

        $scope.addSearchParametersIfNeeded(config, false);

        $http.put(url, $scope.department, config)
            .success(function (data) {
                $scope.finishAjaxCallOnSuccess(data, "#updateDepartmentsModal", false);
            })
            .error(function(data, status, headers, config) {
                $scope.handleErrorInDialogs(status);
            });
    };

    $scope.searchDepartment = function (searchDepartmentForm, isPagination) {
    	
        if (!($scope.searchFor) && (!searchDepartmentForm.$valid)) {
            $scope.displayValidationError = true;
            return;
        }

        $scope.lastAction = 'search';

        var url = $scope.url +  $scope.searchFor;

        $scope.startDialogAjaxRequest();

        var config = {};

        if($scope.searchFor){
            $scope.addSearchParametersIfNeeded(config, isPagination);
        }

        $http.get(url, config)
            .success(function (data) {
                $scope.finishAjaxCallOnSuccess(data, "#searchDepartmentsModal", isPagination);
                $scope.displaySearchMessage = true;
            })
            .error(function(data, status, headers, config) {
                $scope.handleErrorInDialogs(status);
            });
    };

    $scope.deleteDepartment = function () {
        $scope.lastAction = 'delete';

        var url = $scope.url + $scope.department.id;

        $scope.startDialogAjaxRequest();

        var params = {searchFor: $scope.searchFor, page: $scope.pageToGet};

        $http({
            method: 'DELETE',
            url: url,
            params: params
        }).success(function (data) {
                $scope.resetDepartment();
                $scope.finishAjaxCallOnSuccess(data, "#deleteDepartmentsModal", false);
            }).error(function(data, status, headers, config) {
                $scope.handleErrorInDialogs(status);
            });
    };

    $scope.resetSearch = function(){
        $scope.searchFor = "";
        $scope.pageToGet = 0;
        $scope.getDepartmentList();
        $scope.displaySearchMessage = false;
    };

    $scope.getDepartmentList();
}
