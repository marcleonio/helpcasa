<%@ taglib prefix="c" 	uri="http://java.sun.com/jsp/jstl/core" %>

function selectAction(action){
	
	var url = '';
	var params = '';
	var submeter;
	
	if(action == 'listar'){
		url = '<c:url value="/casa/profissional!consultarAgenda.action?"/>';
		params='profissionalDTO.listar=true';
		submeter = true;
	}
	
	//Caso necessite de valida��o dos campos
	if(submeter == true){
		document.getElementById('form1').action = url + params;
		document.getElementById('form1').submit(); 
	}
	
}

function loadMascara(){  	
	jQuery('#data').mask('99/99/9999');
}