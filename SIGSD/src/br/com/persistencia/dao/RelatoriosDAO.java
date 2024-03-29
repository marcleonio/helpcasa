package br.com.persistencia.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.persistencia.dto.AdicionalDTO;
import br.com.persistencia.dto.ProfissaoDTO;
import br.com.persistencia.dto.RelatorioDTO;
import br.com.persistencia.dto.ServicoDTO;
import br.com.persistencia.dto.SolicitacaoDTO;

public class RelatoriosDAO extends GenericDAO{
	protected static final String strConsultResumoFaturamentoMensal = "SELECT servico.nome,sum(precovisita) as precovisita, sum(valor)+precovisita as totalServico " +
			"FROM profissao " +
			"inner join servico on servico.idProfissao = profissao.idProfissao " +
			"inner join solicitacao on solicitacao.idServico = servico.idServico " +
			"left join adicional on adicional.idSolicitacao = solicitacao.idSolicitacao " +
			"where servico.ativo=1 " +
			"and month(solicitacao.data) = month(now()) " +
			"and year(solicitacao.data) = year(now()) " +
			"and solicitacao.statusAtual<>2 "+
			"group by servico.idServico ";
	
	protected static final String strConsultResumoFaturamentoMensalPorProfissional =" "+
	"SELECT pessoa.nome,sum(precovisita) as precovisita, sum(valor)+precovisita as totalServico" +
	"	FROM profissao" +
	"	left join servico on servico.idProfissao = profissao.idProfissao" +
	"	left join solicitacao on solicitacao.idServico = servico.idServico" +
	"	left join adicional on adicional.idSolicitacao = solicitacao.idSolicitacao" +
	"   left join pessoa on idPessoa=idFuncionario"+
	"	where servico.ativo=1" +
	"	and month(solicitacao.data) = month(now())" +
	"	and year(solicitacao.data) = year(now())" +
	"   and solicitacao.statusAtual<>2"+
	"	group by profissao.idProfissao";

	public List<RelatorioDTO> resumoFaturamentoMensal(Connection conn) throws Exception {	
		List<RelatorioDTO> list =null;
		RelatorioDTO relatorioDTO = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
			
		StringBuffer qBuffer = new StringBuffer();		

		qBuffer.append(strConsultResumoFaturamentoMensal);
		//qBuffer.append(" WHERE ativo = 1");
		
		try{
			ps = conn.prepareStatement(qBuffer.toString());
			rs = ps.executeQuery();
			list = new ArrayList<RelatorioDTO>();
			while(rs.next()){
				RelatorioDTO dto = new RelatorioDTO();
				
				relatorioDTO = this.populaRelatorioDTO(dto,rs);
				
				list.add(relatorioDTO);
				
			}
		}catch(Exception e){
			throw e;
		}finally{
			if(ps!=null)
				ps.close();
			if(rs!=null)
				rs.close();
		}
		
		return list;
	}

	private RelatorioDTO populaRelatorioDTO(RelatorioDTO dto, ResultSet rs) throws Exception {
		AdicionalDTO adicional = new AdicionalDTO();
		Double valor = rs.getDouble("totalServico");
		if(valor>0)
			adicional.setValor(valor);
		else
			adicional.setValor(rs.getDouble("precovisita"));
		SolicitacaoDTO solicitacao = new SolicitacaoDTO();
		ServicoDTO servico = new ServicoDTO();
		String nome =rs.getString("nome");
		servico.setNome(nome);
		solicitacao.setServico(servico);
		ProfissaoDTO profissaoDTO = new ProfissaoDTO();
		Double precoVisita = rs.getDouble("precovisita");
		profissaoDTO.setPrecoVisita(precoVisita );
		servico.setProfissaoDTO(profissaoDTO);
		adicional.setSolicitacao(solicitacao);
		dto.setAdicional(adicional);
		return dto;
	}

	public List<RelatorioDTO> resumoFaturamentoMensalPorProfissional(Connection conn) throws Exception {
		List<RelatorioDTO> list =null;
		RelatorioDTO relatorioDTO = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
			
		StringBuffer qBuffer = new StringBuffer();		

		qBuffer.append(strConsultResumoFaturamentoMensalPorProfissional);
		//qBuffer.append(" WHERE ativo = 1");
		
		try{
			ps = conn.prepareStatement(qBuffer.toString());
			rs = ps.executeQuery();
			list = new ArrayList<RelatorioDTO>();
			while(rs.next()){
				RelatorioDTO dto = new RelatorioDTO();
				
				relatorioDTO = this.populaRelatorioDTO(dto,rs);
				
				list.add(relatorioDTO);
				
			}
		}catch(Exception e){
			throw e;
		}finally{
			if(ps!=null)
				ps.close();
			if(rs!=null)
				rs.close();
		}
		
		return list;
	}
}
