'use strict';
angular.module('slatwalladmin')
.directive('swForm', 
[
	'formService',
	function(formService){
		return {
			restrict: 'E',
			transclude:true,
			scope:{
				object:"=",
				parentForm:"@",
				parentObject:"=",
				context:"@"
			},
			template:'<ng-form><sw-form-registrar ng-transclude></sw-form-registrar></ng-form>',
			replace:true,
			link: function(scope, element,attrs){
			}
		};
	}
]);
	
