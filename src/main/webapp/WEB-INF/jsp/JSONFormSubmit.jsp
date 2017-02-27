<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html data-ng-app="formSubmit">
<head>
<meta charset="ISO-8859-1">
<title>Pass JSON Array AngularJS Spring MVC Controller</title>
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.3.8/angular.min.js"></script>
<script type="text/javascript">
	var app = angular.module('formSubmit', []);
	app.controller('FormSubmitController',[ '$scope', '$http', function($scope, $http) 
		{		
			$scope.list = [];
			$scope.headerText = 'Pass Below JSON Array using AngularJS Spring MVC Controller';
			$scope.formData = [{
				"name" : "Java Honk1",
				"location" : "NY",
				"phone" : "123456"	
			},{
				"name" : "Java Honk2",
				"location" : "NY2",
				"phone" : "123456789"		
			}];
			$scope.submit = function() {
				var response = $http.post('PostFormDataJSONArray', $scope.formData);
				response.success(function(data, status, headers, config) {
					$scope.list.push(data);
				});
				response.error(function(data, status, headers, config) {
					alert( "Exception details: " + JSON.stringify({data: data}));
				});
				$scope.list = [];
			};
		}]);
</script>
</head>
<body>
	<form data-ng-submit="submit()" data-ng-controller="FormSubmitController">
		<h3>{{headerText}}</h3>
		{{formData}}<br><br>		
		<input type="submit" id="submit" value="Submit " /><br>	
		<h4>You submitted below data through post:</h4>
		 <pre>Data ={{list}}</pre>
	</form>
</body>
</html>