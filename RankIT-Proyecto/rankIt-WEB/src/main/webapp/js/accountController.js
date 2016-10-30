app.controller("AccountCtrl", function(LogInSvc, SignUpSvc){
	"use strict";
	
	var thiz = this;
	
	this.userData = {
		usuario: "",
		password: ""
	};	
	
	this.loggedUser = {
		name: "",
		id: ""
	};
	
	this.isUserLogged = false;
	
	this.logInUser = function() {
		console.log(thiz.userData);
		console.log(thiz.loggedUser);
		LogInSvc.save(thiz.userData, function(userId){
			thiz.loggedUser.name = thiz.userData.usuario;
			thiz.loggedUser.id = userId.id;
			thiz.isUserLogged = true;
		});
	};
	
	this.signUpUser = function() {
		console.log(thiz.userData);
		SignUpSvc.update(thiz.userData, function(){
			thiz.logInUser();
		});
	};
	
	this.salir = function() {
		thiz.isUserLogged = false;
		thiz.loggedUser = {
			name: "",
			id: ""
		};
	};
		
});