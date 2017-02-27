<!DOCTYPE html>
<html data-ng-app="AngularJSCopy">
<head>
<meta charset="ISO-8859-1">
<title>AngularJS Copy</title>
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.2.26/angular.min.js"></script>
<script>	
	var app = angular.module('AngularJSCopy', [])
	app.controller('ExampleController', [ '$scope', function($scope) {
		$scope.copyData = {};
		$scope.update = function(userData) {
			// 1 argument example
			$scope.copyData = angular.copy(userData);
		};
		$scope.reset = function() {
			// 2 argument example
			angular.copy($scope.copyData, $scope.userData);
			
		};
		//reset form data
		$scope.reset();
	} ]);
</script>
</head>
<body>
	<div data-ng-controller="ExampleController">
		<form novalidate class="simple-form">
			<p>Name: <input type="text" data-ng-model="userData.name" /></p>
			<p>Location: <input type="text" data-ng-model="userData.location" /></p>
			<p>Phone: <input type="text" data-ng-model="userData.phone" /></p>
			<p>E-mail: <input type="email" data-ng-model="userData.email" /></p> 
			<p>Gender: <input type="radio" data-ng-model="userData.gender" value="male" />
			male <input type="radio" data-ng-model="userData.gender" value="female" /> female</p>		
			<p><button data-ng-click="reset()">RESET</button>	
			<button data-ng-click="update(userData)">SAVE</button></p>
		</form>
		<pre>Input Data = {{userData | json}}</pre>
		<pre>Copied Data = {{copyData | json}}</pre>
	</div>
</body>
</html>