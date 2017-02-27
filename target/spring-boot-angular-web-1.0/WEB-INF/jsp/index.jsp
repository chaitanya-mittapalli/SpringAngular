<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html data-ng-app="serviceModule">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Angular JS POST Spring MVC</title>
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.2.26/angular.min.js"></script>
<script type="text/javascript">
	var serviceModule = angular.module('serviceModule', []);
	serviceModule.controller("AngularJSPostController", function($scope, $http) {
			$scope.variable = "AngularJS POST Spring MVC Example:";	
			var dataObj = {
					"name" : "Java Honk",
					"location" : "NY",
					"phone" : "123456789"
			};
			var response = $http.post('PostService', dataObj);
			response.success(function(data, status, headers, config) {
				$scope.responseData = data;
			});
			response.error(function(data, status, headers, config) {
				alert( "Exception details: " + JSON.stringify({data: data}));
			});		
	});	
</script>
</head>
<body data-ng-controller="AngularJSPostController"> 
	<div>
		<h4>{{variable}}</h4>
		<b>You had sent below data through post:</b>
		<p>Response:  {{responseData}}</p>		
	</div>
</body>
</html>