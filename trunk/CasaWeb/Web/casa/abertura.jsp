<%@ taglib prefix="s" uri="/struts-tags" %>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<s:form>
<h2>Menu de A��es do Sistema SIGSD</h2><hr/>
<s:head theme="ajax"/>
<div id="wrap">
			
			<h1>Seja bem vindo,&nbsp;<c:out value="${pessoaSessao.perfil.descricao}"/>&nbsp;<c:out value="${pessoaSessao.nome}"/></h1>
			
			
			<div class="barra_botoes" align="left">				
				<input align="left" name="incluir" type="button" value="Logout"
				onClick="location.href='login!logout.action?'" class="voltar">
			</div>
			
			<br>
			
		<!-- ajusta abertura conforme o perfil -->
			<s:if test="${pessoaSessao.perfil.descricao eq 'Cliente'}">
				<div id="nav">
					<a href="#" title="divname0">Perfil</a>
					<a href="#" title="divname7">Gerar Boletos</a>
					<a href="#" title="divname8">Solicitar Servi�os</a>
					<a href="#" title="divname9">Consultar Hist�rico de Servi�os</a>
					
	
					<div class="clear"></div>
				</div><!-- fim div nav -->
				
				<div id="divname0" class="hiddencontent" >				
					<IFRAME name="palco" src='cliente!consultaParaCliente.action' frameBorder="no" width="100%" height="100%" scrolling="auto" allowtransparency="true"></IFRAME>
				</div>
			</s:if>
			<s:elseif test="${pessoaSessao.perfil.descricao eq 'Profissional'}">
				<div id="nav">
					<a href="#" title="divname1">Agenda</a>
									
					<div class="clear"></div>
				</div><!-- fim div nav -->
				
				<div id="divname1" class="hiddencontent">			
					<IFRAME name="palco" src='profissional!load.action' frameBorder="no" width="100%" height="100%" scrolling="auto" allowtransparency="true"></IFRAME>	
				</div>
			</s:elseif>
			<s:elseif test="${pessoaSessao.perfil.descricao eq 'Atendente'}">
				<div id="nav">
					<a href="#" title="divname2">Consultar Cliente</a>				
					<a href="#" title="divname7">Gerar Boletos</a>
					<a href="#" title="divname8">Solicitar Servi�os</a>
					<a href="#" title="divname9">Consultar Hist�rico de Servi�os</a>
											
				
					<div class="clear"></div>
				</div><!-- fim div nav -->
			
			</s:elseif>
			<s:elseif test="${pessoaSessao.perfil.descricao eq 'Administrador'}">
				<div id="nav">
					<a href="#" title="divname2">Consultar Cliente</a>
					<a href="#" title="divname3">Funcion�rios</a>
					<a href="#" title="divname4">Profiss�es</a>
					<a href="#" title="divname5">Servi�os</a>
					<a href="#" title="divname6">Relat�rios</a>
					<a href="#" title="divname7">Gerar Boletos</a>
					<a href="#" title="divname8">Solicitar Servi�os</a>
					<a href="#" title="divname9">Consultar Hist�rico de Servi�os</a>
					
					<div class="clear"></div>
				</div>	<!-- fim div nav -->
				
				<div id="divname3" class="hiddencontent">		
					<IFRAME name="palco" src='funcionario!load.action' frameBorder="no" width="100%" height="100%" scrolling="auto" allowtransparency="true"></IFRAME>
				</div>		
			 
				<div id="divname4" class="hiddencontent">		
					<IFRAME name="palco" src='profissao!load.action' frameBorder="no" width="100%" height="100%" scrolling="auto" allowtransparency="true"></IFRAME>
				</div>
			
				<div id="divname5" class="hiddencontent">				
					<IFRAME name="palco" src='servico!servicosListar.action' frameBorder="no" width="100%" height="100%" scrolling="auto" allowtransparency="true"></IFRAME>
				</div>
			
				<div id="divname6" class="hiddencontent">				
					<IFRAME name="palco" src='relatorio!load.action' frameBorder="no" width="100%" height="100%" scrolling="auto" allowtransparency="true"></IFRAME>
				</div>
			</s:elseif>
			<s:else>
				<div id="nav"><a href="#" title="erro">N�o logado</a><div class="clear"></div>
				</div>
			</s:else>
			<!--	
			######################################################################################################
			 
			-->
			<div id="erro" class="hiddencontent" ></div>
			<!--
			<s:div id="divname0" href='cliente!consultaParaCliente.action' cssClass="hiddencontent" theme="ajax"></s:div>
			
			<s:div id="divname1" href='profissional!load.action' cssClass="hiddencontent" theme="ajax"></s:div>
		 	
			<s:div id="divname2" href='cliente!pesquisar.action?funcao=cliente' cssClass="hiddencontent" theme="ajax"></s:div>
			
			<s:div id="divname3" href='funcionario!load.action' cssClass="hiddencontent" theme="ajax"></s:div>		
			 
			<s:div id="divname4" href='profissao!load.action' cssClass="hiddencontent" theme="ajax"></s:div>
			
			<s:div id="divname5" href='servico!servicosListar.action' cssClass="hiddencontent" theme="ajax"></s:div>
			
			<s:div id="divname6" href='relatorio!load.action' cssClass="hiddencontent" theme="ajax"></s:div>
			
			<s:div id="divname7" href='solicitacao!consultarFaturaBasica.action' cssClass="hiddencontent" theme="ajax"></s:div>
			
			<s:div id="divname8" href='cliente!pesquisar.action?funcao=servico' cssClass="hiddencontent" theme="ajax"></s:div>
			
			<s:div id="divname9" href='historico!historicoListar.action' cssClass="hiddencontent" theme="ajax"></s:div>
			
			<s:div id="divname" href='http://maps.google.com.br/' cssClass="hiddencontent" theme="ajax"></s:div>
		
			<s:div id="google" href='solicitacao!google.action?' cssClass="hiddencontent" theme="ajax"></s:div>
		-->		
			
			<div id="divname2" class="hiddencontent">			
				<IFRAME name="palco" src='cliente!pesquisar.action?funcao=cliente' frameBorder="no" width="100%" height="100%" scrolling="auto" allowtransparency="true"></IFRAME>				
			</div>						
			
			<div id="divname7" class="hiddencontent">				
				<IFRAME name="palco" src='solicitacao!consultarFaturaBasica.action' frameBorder="no" width="100%" height="100%" scrolling="auto" allowtransparency="true"></IFRAME>
			</div>
			<s:if test="${pessoaSessao.perfil.descricao eq 'Administrador'}">
				<div id="divname8" class="hiddencontent">				
					<IFRAME name="palco" src='cliente!pesquisar.action?funcao=servico' frameBorder="no" width="100%" height="100%" scrolling="auto" allowtransparency="true"></IFRAME>
				</div>
			</s:if>
			<s:else>
				<div id="divname8" class="hiddencontent">				
					<IFRAME name="palco" src='solicitacao!load.action?solicitacaoDTO.cliente.cpf=${pessoaSessao.cpf}' frameBorder="no" width="100%" height="100%" scrolling="auto" allowtransparency="true"></IFRAME>
				</div>
			</s:else>
			<div id="divname9" class="hiddencontent">				
				<IFRAME name="palco" src='historico!historicoListar.action' frameBorder="no" width="100%" height="100%" scrolling="auto" allowtransparency="true"></IFRAME>
			</div>
			<!--
			<div id="divname" class="hiddencontent">				
				<IFRAME name="palco" src='http://maps.google.com.br/' frameBorder="no" width="100%" height="100%" scrolling="auto" allowtransparency="true"></IFRAME>
			</div>
				
			<div id="google" class="hiddencontent">				
				<IFRAME name="palco" src='solicitacao!google.action?' frameBorder="no" width="100%" height="100%" scrolling="auto" allowtransparency="true"></IFRAME>
			</div>
				-->			
</div><!-- fim div wrap -->
</s:form>