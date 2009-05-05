<%@ taglib prefix="c" 	uri="http://java.sun.com/jsp/jstl/core" %>

function selectAction(action){
	
	var url = '';
	var params = '';
	var submeter;
	
	if(action == 'incluir'){
		//var idprofissao = document.getElementById('idprofissao');
		url = '<c:url value="/casa/servico!inclui.action?"/>';
		//params='servicoDTO.profissaoDTO.id='+idprofissao.value;
		submeter = validaCamposAoIncluir();
	}else if(action == 'cadastrar'){
		url = '<c:url value="/casa/servico!cadastrar.action?"/>';
		submeter = true;
	}else if(action == 'voltar'){
		url = '<c:url value="/casa/servico!load.action?"/>';
		submeter = true;
	}else if(action == 'excluir'){
		url = '<c:url value="/casa/servico!exclui.action?"/>';
		submeter = confirm('Deseja realmente excluir o(s) selecionado(s)');
	}else{
		alert('A��o n�o encontrada.');
		submeter = false;
	}
	
	//Caso necessite de valida��o dos campos
	if(submeter == true){
		document.getElementById('form1').action = url + params;
		document.getElementById('form1').submit(); 
	}
	
}

function checkUnCheckAll(check, nameCheckBox){

	var checkBoxs = document.getElementsByName(nameCheckBox);
	if(checkBoxs != null && checkBoxs.length > 0){
		if(check.checked){
			for(i=0; i < checkBoxs.length; i++){
				checkBoxs[i].checked = true;
			}
		}else{
			for(i=0; i < checkBoxs.length; i++){
				checkBoxs[i].checked = false;
			}
		}
	}
}

function validaCamposAoIncluir(){

	return true;
}