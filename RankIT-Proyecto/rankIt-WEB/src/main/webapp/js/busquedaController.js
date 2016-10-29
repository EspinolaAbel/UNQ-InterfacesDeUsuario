app.controller("BusquedaCtrl", function(){
    var self = this;
    
    this.nombre;
    this.tipo;
    this.calificaciones;
    this.ranking;
   
    this.ranking = [];/*
    this.getRanking = function() {
        RankingSvc.query(self.query);
    }*/
    
    this.query = function() {
        return "{nombre:\""+this.nombre+"\", tipo:\""+this.tipo+"\", calificaciones:\""+this.calificaciones+"\", ranking:\""+this.ranking+"}";
    }
    
    alert(this.query);
});
/*
app.factory("RankingSvc", function($resource){
    return $resource('/ranking', {'id': '@id'}, {
    	'query': { method: 'GET', isArray: true}
    });
});*/