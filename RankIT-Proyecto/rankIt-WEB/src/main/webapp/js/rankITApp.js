var app = angular.module("RankITApp", ["ngRoute","ngResource"]);

app.config(function($routeProvider){
    $routeProvider
    .when("/",{
        templateUrl: "busqueda.html"
    })
});