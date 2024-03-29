<%@ taglib prefix="c" 	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
function selectAction(action){
	
	var url = '';
	var params = '';
	var submeter;
	
	if(action == 'incluir'){
		url = '<c:url value="/casa/cliente!inclui.action?"/>';
		submeter = validaCamposAoIncluir();
	}else if(action == 'direcionaLogin'){
		url = '<c:url value="/casa/login!load.action?"/>';
		submeter = true;
	}else if(action == 'pesquisar'){
		var cpf = document.getElementById('cpf');
		var funcao = document.getElementById('funcao');
		if(funcao.value == 'cliente'){
			url = '<c:url value="/casa/cliente!pesquisar.action?"/>';	
			params='clienteDTO.cpf='+cpf.value;
			params+='&telaConsulta=false';
			params+='&clienteDTO.perfil.id=3';
		}
		else if(funcao.value == 'servico'){
			url = '<c:url value="/casa/solicitacao!load.action?"/>';	
			params='solicitacaoDTO.cliente.cpf='+cpf.value;	
			params+='&telaConsulta=false';
		}
		else if(funcao.value == 'boleto'){
			url = '<c:url value="/casa/solicitacao!consultarFaturaBasica.action?"/>';	
			params='solicitacaoDTO.cliente.cpf='+cpf.value;	
			params+='&telaConsulta=false';
		}
		else if(funcao.value == 'historico'){
			url = '<c:url value="/casa/historico!historicoListar.action?"/>';	
			params='historicoDTO.solicitacao.cliente.cpf='+cpf.value;	
			params+='&telaConsulta=false';
		}		
		submeter = true;
	}else if(action == 'voltar'){				
		url = '<c:url value="/casa/cliente!pesquisar.action?"/>';
		params='funcao=cliente';
		params+='&telaConsulta=true';	
		params+='&clienteDTO.perfil.id=3';	
		params+='&naoPesquisar=true';		
		submeter = true;
	}else if(action == 'voltarCliente'){
		//var cpf = document.getElementById('cpf');			
		url = '<c:url value="/casa/cliente!consultaParaCliente.action?"/>';
		params='telaConsulta=false';
		params+='&clienteDTO.perfil.id=3';	
		submeter = true;
	}else if(action == 'altera'){
		var nasc = document.getElementById('nasc');
		url = '<c:url value="/casa/cliente!altera.action?"/>';
		params+='&clienteDTO.nasc='+nasc.value;
		submeter = validaCamposAoIncluir();
	}else if(action == 'alterar'){
	
		//var cpf = document.getElementById('cpf');			
		url = '<c:url value="/casa/cliente!consultaParaCliente.action?"/>';
		params='telaConsulta=true';			
				
		submeter = true;
	}else if(action == 'exclui'){
		url = '<c:url value="/casa/cliente!exclui.action?"/>';
		
		//parent.window.frames["NOMEDOFRAME"].location.href
		if(confirm('Deseja apagar a conta?')){
			submeter = true;
			top.document.location='<c:url value="login!logout.action?"/>';
		}
		else
			submeter = false;
	}else{
		alert('A��o n�o encontrada.');
		submeter = false;
	}
	document.getElementById('login');
	//Caso necessite de valida��o dos campos
	if(submeter == true){
		document.getElementById('form1').action = url + params;
		document.getElementById('form1').submit(); 
	}
	
}

function loadMascara(){
	jQuery('#rg').numeric();
	jQuery('#rg').mask('9.999.999');
  	//jQuery('#cpf').numeric();
	jQuery('#cpf').mask('999.999.999-99');
	//document.getElementById('cpf').value = '';
	jQuery('#cep').numeric();
	jQuery('#cep').mask('99999-999');
	jQuery('#telefone').mask('(99) 9999-9999');
	jQuery('#celular').mask('(99) 9999-9999');
	jQuery('#nasc').mask('99/99/9999');
	
	var naoPesquisar = document.getElementById('naoPesquisar').value;
	
	if (naoPesquisar == 'true'){
		alert("Cliente n�o encontrado no sistema.");
	}
}

function validaCamposAoIncluir(){
	var nome = document.getElementById('nome');
	var cpf = document.getElementById('cpf');
	var cep = document.getElementById('cep');
	var endereco = document.getElementById('endereco');
	var telefone = document.getElementById('telefone');
	var rg = document.getElementById('rg');
	
	var cidade = document.getElementById('cidade');
	var uf = document.getElementById('uf');
	var celular = document.getElementById('celular');
	var nasc = document.getElementById('nasc');
	var email = document.getElementById('email');
	var usuario = document.getElementById('usuario');
	var senha = document.getElementById('senha');
	var senhaRepita = document.getElementById('senhaRepita');
	
	if(nome.value == ''){
		alert('O campo Nome � obrigat�rio.');
		nome.focus();
		return false;
	}
	if(cpf.value == '' || cpf.value=='999.999.999-99'){
		alert('O campo CPF � obrigat�rio.');
		cpf.focus();
		return false;
	}
	if(cep.value == ''){
		alert('O campo CEP � obrigat�rio.');
		cep.focus();
		return false;
	}
	if(!valida_cep('cep')){
		alert('CEP inv�lido. Digite novamente');
		cep.focus();
		return false;
	}
	if(endereco.value == ''){
		alert('O campo Endere�o � obrigat�rio.');
		endereco.focus();
		return false;
	}
	if(telefone.value == ''){
		alert('O campo Telefone � obrigat�rio.');
		telefone.focus();
		return false;
	}
	if(rg.value == ''){
		alert('O campo RG � obrigat�rio.');
		rg.focus();
		return false;
	}
	if(cidade.value == ''){
		alert('O campo Cidade � obrigat�rio.');
		cidade.focus();
		return false;
	}
	if(uf.value == ''){
		alert('O campo UF � obrigat�rio.');
		uf.focus();
		return false;
	}
	if(celular.value == ''){
		alert('O campo Celular � obrigat�rio.');
		celular.focus();
		return false;
	}
	if(nasc.value == ''){
		alert('O campo Nascimento � obrigat�rio.');
		nasc.focus();
		return false;
	}
	if(!check_date(nasc.value)){
		return false;
	}
	if(email.value == ''){
		alert('O campo Email � obrigat�rio.');
		email.focus();
		return false;
	}else if (!checkMail(email.value)){
		alert('E-mail inv�lido. Digite novamente.');
		email.focus();
		return false;
	}
	
	if(usuario.value == ''){
		alert('O campo Usuario � obrigat�rio.');
		usuario.focus();
		return false;
	}
	if(senha.value == ''){
		alert('O campo Senha � obrigat�rio.');
		senha.focus();
		return false;
	}
	if(senhaRepita.value != senha.value){
		alert('Senha n�o confere.');
		senhaRepita.focus();
		return false;
	}
	return true;
}

function checkMail(mail){
    var er = new RegExp(/^[A-Za-z0-9_\-\.]+@[A-Za-z0-9_\-\.]{2,}\.[A-Za-z0-9]{2,}(\.[A-Za-z0-9])?/);
    if(typeof(mail) == "string"){
        if(er.test(mail)){ return true; }
    }else if(typeof(mail) == "object"){
        if(er.test(mail.value)){
                    return true;
                }
    }else{
        return false;
        }
}
function disableAll(){
	var arrayInput = document.getElementsByTagName('input');
	var arrayTextarea = document.getElementsByTagName('textarea');	
	for (i = 0; i < arrayInput.length; i++) {
		if(arrayInput[i].type=='radio' || arrayInput[i].type=='text' || arrayInput[i].type=='password')
    		arrayInput[i].disabled = true;    	    	
  	}
  	for(i = 0; i < arrayTextarea.length; i++){
  		arrayTextarea[i].disabled=true;
  	}
  	var uf = document.getElementById('uf').disabled=true;
}

function loadWin(){
	
	var alterado = document.getElementById('alterado');
	
	if(!alterado.value){
		
		disableAll();
	}

}

//fun��o que valida o cep de acorodo com o estado selecionado, � feito um loop e de acorodo com o indice do estado � verificado
//a express�o regular correspondente ao cep no indice
function valida_cep(Ncampo)
{
	var er;
	var cep = document.getElementById(Ncampo).value;
	var uf=new Array('AM','SP','RJ','MS','MG','MT','AC','AL','AP','CE','DF','ES','GO','MA','PA','PE','PI','PR','RN','RO','RR','RS','SC','SE','TO','BA');
	var ers=new Array(/^[6][9][0-8][0-9]{2}-[0-9]{3}$/,/^([1][0-9]{3}|[01][0-9]{4})-[0-9]{3}$/,/^[2][0-8][0-9]{3}-[0-9]{3}$/,
	/^[2][0-8][0-9]{3}-[0-9]{3}$/,/^[2][0-8][0-9]{3}-[0-9]{3}$/,/^[7][8][8][0-9]{2}-[0-9]{3}$/,/^[6][9]{2}[0-9]{2}-[0-9]{3}$/,
	/^[5][7][0-9]{3}-[0-9]{3}$/,/^[6][89][9][0-9]{2}-[0-9]{3}$/,/^[6][0-3][0-9]{3}-[0-9]{3}$/,/^[7][0-3][0-6][0-9]{2}-[0-9]{3}$/,
	/^[2][9][0-9]{3}-[0-9]{3}$/,/^[7][3-6][7-9][0-9]{2}-[0-9]{3}$/,/^[6][5][0-9]{3}-[0-9]{3}$/,/^[6][6-8][0-8][0-9]{2}-[0-9]{3}$/,
	/^[5][0-6][0-9]{2}-[0-9]{3}$/,/^[6][4][0-9]{3}-[0-9]{3}$/,/^[8][0-7][0-9]{3}-[0-9]{3}$/,/^[5][9][0-9]{3}-[0-9]{3}$/,
	/^[7][8][9][0-9]{2}-[0-9]{3}$/,/^[6][9][3][0-9]{2}-[0-9]{3}$/,/^[9][0-9]{4}-[0-9]{3}$/,/^[8][89][0-9]{3}-[0-9]{3}$/,
	/^[4][9][0-9]{3}-[0-9]{3}$/,/^[7][7][0-9]{3}-[0-9]{3}$/,/^[4][0-8][0-9]{3}-[0-9]{3}$/);
	
		
		//document.getElementById('resposta'+Ncampo).innerHTML="";
			
	/*if(document.getElementById('uf').value=="0")//selecione...
	{
		document.getElementById('resposta'+Ncampo).innerHTML="selecione o estado";
		return false;
	}*/
	if(document.getElementById('uf').value=="0" && document.getElementById('cep').value!="")
	{
		//document.getElementById(Ncampo).style.background="red";
		alert("selecione o estado antes de informar o CEP");
		//document.getElementById(Ncampo).innerHTML ="selecione o estado antes de informar o CEP";
		return false;
	}
	
	var indexSelect = document.getElementById("uf").selectedIndex;
	var valueSelected = document.form1.uf.options[indexSelect].text;
	
	for(i=0;i < uf.length;i++)
	{	
			if(uf[i]==valueSelected)
			{	
				if(cep!="")
				{	
					er=ers[i];
					if(!er.test(cep))
					{	
						return erro(Ncampo);						
					}		
					else
					{	
						return ok(Ncampo);					
					}
				}
				

		 }	document.getElementById(Ncampo).style.background="#FFFFFF";
			//document.getElementById('resposta'+Ncampo).innerHTML="";
	}
		
}

//fun��o que retorna o erro na div correspondente ao campo, uando a vlaida��o falha
function erro(Ncampo)
{
	//if(Ncampo=="nome")
	//resposta="nome deve ter no minimo 3 caracteres";
	if(Ncampo=="cpf")
	resposta="n�mero de CPF inv�lido";
	
	/*document.getElementById('resposta'+Ncampo).innerHTML="nome deve ter no minimo 3 caracteres";
	//document.getElementById(Ncampo).style.background="red";
	//document.getElementById(Ncampo).focus();
	return false;
	}*/
	//document.getElementById(Ncampo).style.background="red";
	//document.getElementById('resposta'+Ncampo).innerHTML="informe " + Ncampo;
	//document.getElementById(Ncampo).focus();
	return false;
}
//fun��o que formata o campo se a valida��o estiver ok
function ok(Ncampo)
{
	//document.getElementById(Ncampo).style.background="#98EE84";
	//document.getElementById('resposta'+Ncampo).innerHTML="";
	return true;
}

function check_date(date) {
   var err = 0
   string = date
   var valid = "0123456789/"
   var ok = "yes";
   var temp;
   for (var i=0; i< string.length; i++) {
     temp = "" + string.substring(i, i+1);
     if (valid.indexOf(temp) == "-1") err = 1;
   }
   if (string.length != 10) err=1
   b = string.substring(3, 5)		// month
   c = string.substring(2, 3)		// '/'
   d = string.substring(0, 2)		// day 
   e = string.substring(5, 6)		// '/'
   f = string.substring(6, 10)	// year
   if (b<1 || b>12) err = 1
   if (c != '/') err = 1
   if (d<1 || d>31) err = 1
   if (e != '/') err = 1
   if (f<1809 || f>2009) err = 1
   if (b==4 || b==6 || b==9 || b==11){
     if (d==31) err=1
   }
   if (b==2){
     var g=parseInt(f/4)
     if (isNaN(g)) {
         err=1 
     }
     if (d>29) err=1
     if (d==29 && ((f/4)!=parseInt(f/4))) err=1
   }
   if (err==1) {
   	alert("Data inv�lida");
    return false;
   }
   else {
   	//alert("Data correta");
    return true;
   }
}