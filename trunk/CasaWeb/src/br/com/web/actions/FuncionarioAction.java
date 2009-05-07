package br.com.web.actions;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import br.com.ConstantesENUM;
import br.com.bo.FactoryBO;
import br.com.bo.FuncionarioBO;
import br.com.bo.ProfissaoBO;
import br.com.persistencia.dto.FuncionarioDTO;
import br.com.persistencia.dto.PerfilDTO;
import br.com.persistencia.dto.ProfissaoDTO;

public class FuncionarioAction extends GenericAction {

	private FuncionarioBO funcionarioBO;
	private FuncionarioDTO funcionarioDTO;
	private List<FuncionarioDTO> listFuncionarios;
	private List<ProfissaoDTO> listProfissoes;
	private Long[] idsFuncionario;
	private Map<Number, String> profissoes;
	private ProfissaoBO profissaoBO;

	public FuncionarioAction() {
		funcionarioBO = FactoryBO.getInstance().getFuncionarioBO();
		profissaoBO = FactoryBO.getInstance().getProfissaoBO();
	}
	
	public String load(){
		return funcionariosListar();
	}

	public String funcionariosListar() {
		try {
			this.listFuncionarios = funcionarioBO.funcionariosListar();
		} catch (Exception e) {			
			e.printStackTrace();
		}
		return "funcionariosListar.fwd";
	}

	public String cadastrar() {
		profissoes = new HashMap<Number, String>();
		profissoes.put(0, "Selecione...");
		try {
			this.listProfissoes = profissaoBO.profissaoListar();
			for (ProfissaoDTO profissao : listProfissoes) {
				profissoes.put(profissao.getId(), profissao.getNome());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "cadastrar.fwd";
	}

	public String inclui() throws Exception {
		try {
			funcionarioDTO.setAtivo(true);

			PerfilDTO perfil = new PerfilDTO();
			perfil.setId(ConstantesENUM.PROFISSIONAL_ID.id());
			funcionarioDTO.setPerfil(perfil);
			funcionarioBO.inclui(funcionarioDTO);
		} catch (Exception e) {

			e.printStackTrace();
		}
		return load();
	}
	
	public String exclui() throws Exception {
		try {
			if (idsFuncionario != null && idsFuncionario.length > 0) {
				funcionarioBO.exclui(idsFuncionario);
			} else {
				System.out.println("Nenhum item selecionado.");
			}
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return load();
	}

	public FuncionarioDTO getFuncionarioDTO() {
		return funcionarioDTO;
	}

	public void setFuncionarioDTO(FuncionarioDTO funcionarioDTO) {
		this.funcionarioDTO = funcionarioDTO;
	}

	public List<FuncionarioDTO> getListFuncionarios() {
		return listFuncionarios;
	}

	public void setListFuncionarios(List<FuncionarioDTO> listFuncionarios) {
		this.listFuncionarios = listFuncionarios;
	}

	public Long[] getIdsFuncionario() {
		return idsFuncionario;
	}

	public void setIdsFuncionario(Long[] idsFuncionario) {
		this.idsFuncionario = idsFuncionario;
	}

	public List<ProfissaoDTO> getListProfissoes() {
		return listProfissoes;
	}

	public void setListProfissoes(List<ProfissaoDTO> listProfissoes) {
		this.listProfissoes = listProfissoes;
	}

	public Map<Number, String> getProfissoes() {
		return profissoes;
	}

	public void setProfissoes(Map<Number, String> profissoes) {
		this.profissoes = profissoes;
	}
	

}
