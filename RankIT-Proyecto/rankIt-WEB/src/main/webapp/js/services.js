app.factory("RankingSvc", function($resource){
    return $resource("http://localhost:9000/ranking",
                    { 'nombre': '@nombre', 'tipo': '@tipo', 'calificaciones': '@calificaciones', 'ranking': '@ranking' },
					{'query': { method: 'GET', isArray: true} }
			);
});

app.factory("LogInSvc", function($resource){
	return $resource("http://localhost:9000/usuarios",
					 {'usuario': '@usuario', 'password': '@password'},
					 {'save': {method:"POST"}}
					);
});

app.factory("SignUpSvc", function($resource){
	return $resource("http://localhost:9000/usuarios",
					 {'usuario': '@usuario', 'password': '@password'},
					 {'update': {method:"PUT"}}
					);
});