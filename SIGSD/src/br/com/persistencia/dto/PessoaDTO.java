package br.com.persistencia.dto;

import java.util.Date;

public class PessoaDTO extends GenericDTO{
	
	private int pessoaId;
	
	private String usuario;
	private String senha;
	private String nome;
	private String cpf;
	private String rg;
	private String email;
	private Date nasc;
	private Boolean ativo;
	private Date dataCadastro;
	private String telefone;
	private String celular;
	private String cep;
	
	private PerfilDTO perfil;

	
	public PessoaDTO(){}
	public PessoaDTO(Long id){
		this.id = id;
	} 
	
	public Long getId(){
		return id;
	}
	
	public int getPessoaId() {
		return pessoaId;
	}
	public void setPessoaId(int pessoaId) {
		this.pessoaId = pessoaId;
	}
	public String getUsuario() {
		return usuario;
	}
	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getCpf() {
		return cpf;
	}
	public void setCpf(String cpf) {
		this.cpf = cpf;
	}
	public String getRg() {
		return rg;
	}
	public void setRg(String rg) {
		this.rg = rg;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getNasc() {
		return nasc;
	}
	public void setNasc(Date nasc) {
		this.nasc = nasc;
	}
	public Boolean getAtivo() {
		return ativo;
	}
	public void setAtivo(Boolean ativo) {
		this.ativo = ativo;
	}
	public Date getDataCadastro() {
		return dataCadastro;
	}
	public void setDataCadastro(Date dataCadastro) {
		this.dataCadastro = dataCadastro;
	}
	public String getTelefone() {
		return telefone;
	}
	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}
	public String getCelular() {
		return celular;
	}
	public void setCelular(String celular) {
		this.celular = celular;
	}	
	public String getCep() {
		return cep;
	}
	public void setCep(String cep) {
		this.cep = cep;
	}
	public PerfilDTO getPerfil() {
		return perfil;
	}
	public void setPerfil(PerfilDTO perfil) {
		this.perfil = perfil;
	}
}
