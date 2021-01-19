
(function(){
	'use strict';

	angular.module('uaf',["ngStorage","ngRoute"])
	.config(function($routeProvider) {
	    $routeProvider
	    .when("/", {
	        templateUrl : "view/blanco.html"
	    }).when("/@NewProject", {
	        templateUrl : "view/nuevoproyecto.html"
	    });
	})
	.directive('ngEnter', function () {
	    return function (scope, element, attrs) {
	        element.bind("keydown keypress", function (event) {
	            if(event.which === 13) {
	                scope.$apply(function (){
	                    scope.$eval(attrs.ngEnter);
	                });
	 
	                event.preventDefault();
	            }
	        });
	    };
	})
	.controller("uafCtr",function($scope,$rootScope,$http,$localStorage,$location){
		$scope.UrlWS = "http://localhost:8888";
		$scope.Menu= [
			//{'label':'Dashboard','icon':'fa fa-tachometer','url':''},
			{'label':'NUEVO PROYECTO','icon':'fa fa-tasks','estado':'active open hover','url':'@NewProject'},
			
		]
		
		$location.url('/@NewProject');
		$scope.ClickUrl = function(e){
			//console.log(e.url);
			$location.url('/'+e.url);
			$("#btn_cel").click();
			//console.log($location.url());
			//console.log($scope.Menu.length);
			var cant = $scope.Menu.length -1;
			for(var i=0; i<= cant;i++){
				$scope.Menu[i].estado = "";
			}
			e.estado = "active open hover";
		}
		$scope.Data = function(){
			$http.post('/rest/api/DataInicial/Contrators', {
		        data: {'data':'service'}
		    }).success(function(response){
		    	$scope.Contractors = JSON.parse(response);
		    }).error(function(){
			})

			$http.post('/rest/api/DataInicial/Departments', {
		        data: {'data':'service'}
		    }).success(function(response){
		    	$scope.Departments = JSON.parse(response);
		    }).error(function(){
			})

			$http.post('/rest/api/DataInicial/CostCenter', {
		        data: {'data':'service'}
		    }).success(function(response){
		    	$scope.CostCenter = JSON.parse(response);
		    }).error(function(){
			})
			$http.post('/rest/api/crud/OTS', {
		        data: {'data':'service'}
		    }).success(function(response){
		    	$scope.Ots = JSON.parse(response);
		    	//console.log($scope.Ots);
		    }).error(function(){
			})
		}
		$scope.SaveProject = function(e){
			console.log(e);
			var f = $('#date-timepicker1').val()
			console.log(f.toLocaleString());
			if(e === undefined || e === ""){
				swal("MENSAJE DE ALERTA", "ANTES DE GUARDAR DEBERA LLENAR LOS CAMPOS SOLICITADOS ", "warning");
			}else if($('#date-timepicker1').val() === undefined || $('#date-timepicker1').val() === ""){
				swal("MENSAJE DE ALERTA", "SELECCIONE UNA FECHA DE INICIO DEL PROYECTO ", "warning");
			}else if($('#date-timepicker2').val() === undefined || $('#date-timepicker2').val() === ""){
				swal("MENSAJE DE ALERTA", "SELECCIONE UNA FECHA DE FIN DEL PROYECTO ", "warning");
			}else if(e.Dep === undefined || e.Dep === ""){
				swal("MENSAJE DE ALERTA", "SELECCIONE UN DEPARTAMENTO DEL PROYECTO ", "warning");
			}else if(e.Des === undefined || e.Des === ""){
				swal("MENSAJE DE ALERTA", "AGREGUE UNA BREVE DESCRIPCION PARA EL PROYECTO ", "warning");
			}else if(e.Cod === undefined || e.Cod === ""){
				swal("MENSAJE DE ALERTA", "AGREGUE EL CODIGO DEL PROYECTO ", "warning");
			}else if(e.Con === undefined || e.Con === ""){
				swal("MENSAJE DE ALERTA", "SELECCIONE UN CONTRATISTA PARA EL PROYECTO ", "warning");
			}else if(e.precioT === undefined || e.precioT === ""){
				swal("MENSAJE DE ALERTA", "AGREGUE EL PRECIO DEL TRABAJO ", "warning");
			}else if(e.precioM === undefined || e.precioM === ""){
				swal("MENSAJE DE ALERTA", "AGREGUE EL PRECIO DEL MATERIAL ", "warning");
			}else{
				
				e.finicio = $('#date-timepicker1').val();
				e.ffin = $('#date-timepicker2').val();
				$http({
				    method: 'POST',
				    url: '/rest/api/crud/InsertProject',
				    params: {
				      data: e
				    }
				});
				
				
				var titulo = "BUEN TRABAJO";
			   	var msg = "SU PROYECTO A SIDO REGISTRADO EXITOSAMENTE";
			   	var tipo = "success";
				TraerOTS(titulo,msg,tipo)
				document.getElementById("miForm1").reset();
				document.getElementById("miForm2").reset();
				
			}
			
		}
		$scope.modificar = function(e){
			//console.log(e);
			$("#modificar" + e).addClass("modificar");
		}
		$scope.Update = function(e){
			console.log(e);
			$http({
			    method: 'POST',
			    url: '/rest/api/crud/UpdateProject',
			    params: {
			      data: e
			    }
			});
				
				var titulo = "BUEN TRABAJO";
			   	var msg = "DATOS ACTUALIZADOS CON EXITO";
			   	var tipo = "success";
				TraerOTS(titulo,msg,tipo)
				
		}
		$scope.Delete =function(e){
			swal("DESEA ELIMIANR EL PROYECTO SELECCIONADO "+e.PROJECT_CODE, {
				  buttons: {
				    
				    Eliminar: {
				      text: "Eliminar Proyecto",
				      value: "eliminar",
				    },
				    cancel: "Cancelar!",
				  },
				}) 
			.then((value) => {
				  switch (value) {
				 
				   case "eliminar":
					   $http({
						    method: 'POST',
						    url: '/rest/api/crud/DeleteProject',
						    params: {
						      data: e
						    }
						});
					  
					   	var titulo = "PROYECTO ELIMINADO!";
					   	var msg = "EL PROYECTO CON EL CODIGO "+e.PROJECT_CODE+ ", FUE ELIMINADO CON EXITO";
					   	var tipo = "success";
						TraerOTS(titulo,msg,tipo)
					    
				    break;

				    
				  }
				});
		}
		function TraerOTS(titulo,msg,tipo)
		{
			function OTS() {
			 	$http.post('/rest/api/crud/OTS', {
			        data: {'data':'service'}
			    }).success(function(response){
			    	$scope.Ots = JSON.parse(response);
			    	console.log($scope.Ots);
			    	swal(titulo, msg, tipo);
			    }).error(function(){
				})
			}
			setTimeout(OTS,1000);
		}		
	})
})();




