
app.controller("BusquedaCtrl", function(RankingSvc, $scope){
	'use strict';
    var self = this;
    
    this.nombre = "";
    this.tipo = "";
    this.calificaciones = "";
    this.ranking = "";
   
    $scope.lsRanking = [];
    this.getRanking = function() {
		console.log(self.rankingQuery());
		$scope.lsRanking = RankingSvc.query(self.rankingQuery());
		console.log($scope.lsRanking);
    }
    
    //var query = function() { - me muestra la función como si fuera un string.
    this.rankingQuery = function() {
        var json = "{nombre: \""+this.nombre+"\", tipo: \""+this.tipo+"\", calificaciones: \""+this.calificaciones+"\", ranking: \""+this.ranking+"\"}";
    	return  json;
	}
});


app.factory("RankingSvc", function($resource){
    return $resource("http://localhost:9000/ranking/:nombre/:tipo/:calificaciones/:ranking",
                    { 'nombre': '@nombre', 'tipo': '@tipo', 'calificaciones': '@calificaciones', 'ranking': '@ranking' },
					{'query': { method: 'GET', isArray: true} }
			);
});