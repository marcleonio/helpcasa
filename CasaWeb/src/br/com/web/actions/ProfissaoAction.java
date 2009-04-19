package br.com.web.actions;

import java.util.List;

import br.com.bo.FactoryBO;
import br.com.bo.ProfissaoBO;
import br.com.persistencia.dto.ProfissaoDTO;

public class ProfissaoAction extends GenericAction {

	private ProfissaoBO profissaoBO;
	private List<ProfissaoDTO> listProfissoes;
	private Long[] idsProfissao;
	private ProfissaoDTO profissaoDTO;

	public ProfissaoAction() {
		profissaoBO = FactoryBO.getInstance().getProfissaoBO();
	}

	public String load() {
		try {
			this.listProfissoes = profissaoBO.profissaoListar();
		} catch (Exception e) {

			e.printStackTrace();
		}
		return "load.fwd";
	}

	public String inclui() throws Exception {
		try {
			profissaoBO.inclui(profissaoDTO);
		} catch (Exception e) {

			e.printStackTrace();
		}
		return load();
	}

	public String exclui() throws Exception {
		try {
			if (idsProfissao != null && idsProfissao.length > 0) {
				profissaoBO.exclui(idsProfissao);
			} else {
				System.out.println("Nenhum item selecionado.");
			}
		} catch (Exception e) {
			System.out.println("Existe um funcionari anexado a essa fun��o");
			e.printStackTrace();
		}
		return load();
	}
	
	public String cadastrar(){
		return "cadastrar.fwd";
	}
	public List<ProfissaoDTO> getListProfissoes() {
		return listProfissoes;
	}

	public void setListProfissoes(List<ProfissaoDTO> listProfissoes) {
		this.listProfissoes = listProfissoes;
	}

	public Long[] getIdsProfissao() {
		return idsProfissao;
	}

	public void setIdsProfissao(Long[] idsProfissao) {
		this.idsProfissao = idsProfissao;
	}

}
