var app = angular.module("RankITApp", ["ngRoute"]);

app.config(function($routeProvider){
    $routeProvider
    .when("/",{
        templateUrl: "busqueda.html"
    })
});