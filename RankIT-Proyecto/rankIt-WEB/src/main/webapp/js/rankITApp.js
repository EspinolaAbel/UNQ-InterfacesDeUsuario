var app = angular.module("RankITApp", ['ngAnimate',"ngRoute","ngResource"]);

app.config(function($routeProvider){
    $routeProvider
    .when("/",{
        templateUrl: "busqueda.html"
    })
});