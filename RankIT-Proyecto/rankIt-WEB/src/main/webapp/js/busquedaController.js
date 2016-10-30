
app.controller("BusquedaCtrl", function(RankingSvc, $scope){
	'use strict'; //Al parecer este string es más que un string. Trae algunos features de un framework. Una caracteristica de este string este que mejora los mensajes de error para que sean más descriptivos.
    var thiz = this;
    
	var rankingQuery = new Object();
    rankingQuery.nombre = "";
    rankingQuery.tipo = "";
    rankingQuery.calificaciones = "";
    rankingQuery.ranking = "";
   
    this.lsRanking = [];
    this.getRanking = function() {
		console.log(thiz.rankingQuery);
		RankingSvc.query(thiz.rankingQuery, function(data){
			thiz.lsRanking = data;
		});
    }
    
    this.getRanking();
});