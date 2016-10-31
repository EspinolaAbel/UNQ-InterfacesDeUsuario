app.controller("AccountCtrl", function($timeout, LogInSvc, SignUpSvc){
	"use strict";
	
	var self = this;
	
	this.userData = function(){
        var u = $("#input-usuario").val();
        var p = $("#input-password").val();
		return {usuario: u,	password: p };
	};	
	
	this.loggedUser = emptyAccount();
    function emptyAccount() {
        return { name: '', id: ''};
    };
	
	this.isUserLogged = false;
	
	this.logInUser = function() {
		console.log(self.userData());
		console.log(self.loggedUser);
		LogInSvc.save(self.userData(), function(userId){
			self.loggedUser.name = self.userData().usuario;
			self.loggedUser.id = userId.id;
			self.isUserLogged = true;
		}, self.errorHandler);//<-- OJO, no estoy llamando a la función, sino que le estoy pasando el bloque de la función.
	};
	
	this.signUpUser = function() {
		console.log(self.userData());
		SignUpSvc.update(self.userData(), function(){
			self.logInUser();
            self.notificarMensaje("El usuario ha sido registrado exitosamente!")
		}, self.errorHandler);
	};
	
	this.salir = function() {
		self.isUserLogged = false;
        $("#input-usuario").val("");
        $("#input-password").val("");
        self.loggedUser = emptyAccount();
		console.log(self.loggedUser);
	};
	
    /*Cuando se produce un error en el request se responde con un objeto que contiene
    en su variable 'data' el json retornado por mi servicio.*/
    this.errorHandler = function(error) {
        self.notificarError(error.data);
    };
    
    this.msgs = [];
    this.notificarMensaje = function(mensaje) {
        self.msgs.push(mensaje);
        self.notificar(self.msgs);
    };

    this.errors = [];
    this.notificarError = function(mensaje) {
        self.errors.push(mensaje.error);
        self.notificar(this.errors);
    };

    this.notificar = function(mensajes) {
        $timeout(function() {
            while (mensajes.length > 0) mensajes.pop();
        }, 4000);
    }
});