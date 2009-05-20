<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<s:form name="form1" id="form1">
	<div class="container" style="width: 650px">
		<h2>
			Agenda Virtual
		</h2>
		</hr>
		<h1>
			Agenda Virtual
		</h1><br><br><br>
		<s:datetimepicker name="profissionalDTO.data"
			label="Dia que deseja visualizar" theme="ajax"
			displayFormat="dd/MM/yyyy" onblur="selectAction('listar')" />
		<input type="button" value="ok" onclick="selectAction('listar')" class="principal">
		<br><br><br><br>
		<s:if test="${profissionalDTO.listar}">
			<h1>
				Data&nbsp;${profissionalDTO.data}
			</h1>
			<table width="100%" cellspacing="1" cellpadding="3" border="1"
				align="center">
				<tr>
					<td></td>
					<!--<td title="id">
						<input type="checkbox" name="checkAll" id="checkAll"
					onclick="checkUnCheckAll(this, 'idsS');" />
					</td>
					--><td title="Servi�o">
						<strong><c:out value="Servi�o" /> </strong>
					</td>
					<td title="Periodo">
						<strong><c:out value="Periodo" /> </strong>
					</td>
					<td title="Cliente">
						<strong><c:out value="Cliente" /> </strong>
					</td>
					<td title="Endere�o">
						<strong><c:out value="Endere�o" /> </strong>
					</td>
					<td title="CEP">
						<strong><c:out value="CEP" /> </strong>
					</td>
					<td title="Telefone">
						<strong><c:out value="Telefone" /> </strong>
					</td>
					<td title="Situa��o">
						<strong><c:out value="Situa��o" /> </strong>
					</td>
				</tr>
				<s:if test="${not empty listAgenda}">
					<s:iterator value="listAgenda" status="stat">
						<s:set name="corLinha" value="" />
						<s:if test="${stat.index%2 eq 0}">
							<s:set name="corLinha" value="'#e6f7ff'" />
						</s:if>
						<s:else>
							<s:set name="corLinha" value="'#FFFFFF'" />
						</s:else>
						<s:if test="${statusFormatado == 'Inv�lido'}">
							<s:set name="corLinha" value="'#FF6633'" />
						</s:if>
						<tr bgcolor="${corLinha}" onmouseover="this.bgColor='#C9D7DE'"
							onmouseout="this.bgColor='${corLinha}'">
							<td>
								<c:out value="${stat.index+1}" />
							</td>
							<!--<td>
								<input type="checkbox" name="idsS" id="idsS"
									value="<s:property value='id'/>" />
							</td>
							--><td>
								<s:a href="/CasaWeb/casa/profissional!consultarAgendaDetalhada.action?servicoDTO.id=${id}"><c:out value="${nome}" /></s:a>
							</td>
							<td>
								<c:out value="${profissaoDTO.nome}" />
							</td>
							<td>
								<c:out value="${descricao}" />
							</td>
							<td>
								<c:out value="${descricao}" />
							</td>
							<td>
								<c:out value="${descricao}" />
							</td>
							<td>
								<c:out value="${descricao}" />
							</td>
							<td>
								<c:out value="${descricao}" />
							</td>
						</tr>
					</s:iterator>
				</s:if>
				<s:else>
					<tr>
						<td colspan="15" align="center">
							<font color="red">Nenhum registro econtrado </font>
						</td>
					</tr>
				</s:else>
			</table>
		</s:if>
	</div>
</s:form>