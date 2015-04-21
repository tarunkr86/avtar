function LocationController($scope, $location) {

	if ($location.$$absUrl.lastIndexOf('/contacts') > 0) {
		$scope.activeURL = 'contacts';
	} else if ($location.$$absUrl.lastIndexOf('/company') > 0) {
		$scope.activeURL = 'company';
	} else if ($location.$$absUrl.lastIndexOf('/locations') > 0) {
		$scope.activeURL = 'locations';
	} else if ($location.$$absUrl.lastIndexOf('/departments') > 0) {
		$scope.activeURL = 'departments';
	} else if ($location.$$absUrl.lastIndexOf('/positions') > 0) {
		$scope.activeURL = 'positions';
	} else if ($location.$$absUrl.lastIndexOf('/emailCategorys') > 0) {
		$scope.activeURL = 'emailCategorys';
	} else if ($location.$$absUrl.lastIndexOf('/emailTemplates') > 0) {
		$scope.activeURL = 'emailTemplates';
	} else if ($location.$$absUrl.lastIndexOf('/users') > 0) {
		$scope.activeURL = 'users';
	} else if ($location.$$absUrl.lastIndexOf('/agencys') > 0) {
		$scope.activeURL = 'agencys';
	} else if ($location.$$absUrl.lastIndexOf('/jobTypes') > 0) {
		$scope.activeURL = 'jobTypes';
	} else {
		$scope.activeURL = 'home';
	}
}