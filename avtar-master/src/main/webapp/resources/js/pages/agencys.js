function agencysController($scope, $http) {
	
	$scope.countries = ["Afghanistan","Albania","Algeria","Andorra","Angola","Antigua and Barbuda","Argentina","Armenia",
	                    "Australia","Austria","Azerbaijan","Bahamas","Bahrain","INDIA","INDONESIA","USA","JAPAN"];  
	$scope.states=[];  
    $scope.pageToGet = 0;
    $scope.state = 'busy';
    $scope.lastAction = '';
    $scope.url = "/avtar/protected/agencys/";
    $scope.errorOnSubmit = false;
    $scope.errorIllegalAccess = false;
    $scope.displayMessageToUser = false;
    $scope.displayValidationError = false;
    $scope.displaySearchMessage = false;
    $scope.displaySearchButton = false;
    $scope.displayCreateAgencyButton = false;

    $scope.agency = {};
    $scope.searchFor = "";
    $scope.country="1";
    $scope.getAgencyList = function () {
        var url = $scope.url;
        $scope.lastAction = 'list';
        $scope.startDialogAjaxRequest();
        var config = {params: {page: $scope.pageToGet}};
        $http.get(url, config)
            .success(function (data) {
            	
                $scope.finishAjaxCallOnSuccess(data, null, false);
            })
            .error(function () {
                $scope.state = 'error';
                $scope.displayCreateAgencyButton = false;
            });
    };

    var saveData = [];
    $scope.nationalities = [];
    $scope.nationalityUrl = "/avtar/protected/nationalitys/";
    $scope.getNationalityList = function () {
        var url = $scope.nationalityUrl;       
        var config = {params: {page: $scope.pageToGet}};
        $http.get(url, config)
            .success(function (data) {            	
            	saveData = data.nationalitys;             	
                for (var j=0; j<saveData.length; j++) {               	
                  $scope.nationalities.push(
                		  {name: saveData[j].name, id: saveData[j].id}
                		  );
                }               
            })
            .error(function () {
                $scope.state = 'error';               
            });
    };
    
    $scope.populateTable = function (data) {
        if (data.pagesCount > 0) {
            $scope.state = 'list';
            $scope.page = {source: data.agencys, currentPage: $scope.pageToGet, pagesCount: data.pagesCount, totalAgencys : data.totalAgencys};
            if($scope.page.pagesCount <= $scope.page.currentPage){
                $scope.pageToGet = $scope.page.pagesCount - 1;
                $scope.page.currentPage = $scope.page.pagesCount - 1;
            }

            $scope.displayCreateAgencyButton = true;
            $scope.displaySearchButton = true;
        } else {
            $scope.state = 'noresult';
            $scope.displayCreateAgencyButton = true;

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
            $scope.searchAgency($scope.searchFor, true);
        } else{
            $scope.getAgencyList();
        }
    };

    $scope.exit = function (modalId) {
        $(modalId).modal('hide');

        $scope.agency = {};
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

    $scope.resetAgency = function(){
        $scope.agency = {};
    };

    $scope.createAgency = function (newAgencyForm) {
        if (!newAgencyForm.$valid) {
            $scope.displayValidationError = true;
            return;
        }

        $scope.lastAction = 'create';
        var url = $scope.url;
        var config = {params: {country: $scope.agency.nationalityId},headers: {'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'}};
        $scope.addSearchParametersIfNeeded(config, false);
        $scope.startDialogAjaxRequest();
        $http.post(url, $.param($scope.agency), config)
            .success(function (data) {
                $scope.finishAjaxCallOnSuccess(data, "#addAgencysModal", false);
            })
            .error(function(data, status, headers, config) {
                $scope.handleErrorInDialogs(status);
            });
    };

    $scope.selectedAgency = function (agency) {
        var selectedAgency = angular.copy(agency);
        $scope.agency = selectedAgency;
        //right now find states name by passing parameter country id in state table
        $scope.states=["Delhi","Up"];      	
    };   

    $scope.selectedCountry = function (country) {
        var selectedCountry = angular.copy(country);
        $scope.country = selectedCountry;
        $scope.states=[];//now put all states
        $scope.states=["Delhi","Up"];     		  
       
    };
    $scope.updateAgency = function (updateAgencyForm) {
        if (!updateAgencyForm.$valid) {
            $scope.displayValidationError = true;
            return;
        }

        $scope.lastAction = 'update';
        var url = $scope.url + $scope.agency.id ;
        $scope.startDialogAjaxRequest();
       // var config = {};
        var config = {params: {country: $scope.country,nationality:$scope.agency.nationalityId}};
        $scope.addSearchParametersIfNeeded(config, false);   
        $http.put(url, $scope.agency, config)
            .success(function (data) {
                $scope.finishAjaxCallOnSuccess(data, "#updateAgencysModal", false);
            })
            .error(function(data, status, headers, config) {
                $scope.handleErrorInDialogs(status);
            });
    };

    $scope.searchAgency = function (searchAgencyForm, isPagination) {
        if (!($scope.searchFor) && (!searchAgencyForm.$valid)) {
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
                $scope.finishAjaxCallOnSuccess(data, "#searchAgencysModal", isPagination);
                $scope.displaySearchMessage = true;
            })
            .error(function(data, status, headers, config) {
                $scope.handleErrorInDialogs(status);
            });
    };

    $scope.deleteAgency = function () {
        $scope.lastAction = 'delete';
        var url = $scope.url + $scope.agency.id;
        $scope.startDialogAjaxRequest();
        var params = {searchFor: $scope.searchFor, page: $scope.pageToGet};
        $http({
            method: 'DELETE',
            url: url,
            params: params
        }).success(function (data) {
                $scope.resetAgency();
                $scope.finishAjaxCallOnSuccess(data, "#deleteAgencysModal", false);
            }).error(function(data, status, headers, config) {
                $scope.handleErrorInDialogs(status);
            });
    };

    $scope.resetSearch = function(){
        $scope.searchFor = "";
        $scope.pageToGet = 0;
        $scope.getAgencyList();
        $scope.displaySearchMessage = false;
    };

    $scope.getAgencyList();
    $scope.getNationalityList();
}
