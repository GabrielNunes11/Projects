package br.com.api.g6.dto;

import java.util.Date;
import java.util.Set;

import com.fasterxml.jackson.annotation.JsonFormat;

import br.com.api.g6.enums.UsuarioEnum;

public class UsuarioDTO {

	private UsuarioEnum tipo;
	private String nome;
	private String cpf;
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date nasc;
	private String cep;
	private String numero;
	private String email;
	private String password;
	private Set<String> role;
	private String url;
	
	public UsuarioDTO(){}

	public UsuarioDTO(UsuarioEnum tipo, String nome, String cpf, Date nasc, String cep, String numero, String email, String password, Set<String> role, String url) {
		this.tipo = tipo;
		this.nome = nome;
		this.cpf = cpf;
		this.nasc = nasc;
		this.cep = cep;
		this.email = email;
		this.password = password;
		this.role = role;
		this.url = url;
		this.numero = numero;
	}

	
	public UsuarioEnum getTipo() {
		return tipo;		 
	}
	
	public void setTipo(UsuarioEnum tipo) {
		this.tipo = tipo;
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

	public Date getNasc() {
		return nasc;
	}

	public void setNasc(Date nasc) {
		this.nasc = nasc;
	}

	public String getCep() {
		return cep;
	}

	public void setCep(String cep) {
		this.cep = cep;
	}

	public String getNumero() {
		return numero;
	}

	public void setNumero(String numero) {
		this.numero = numero;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Set<String> getRole() {
		return role;
	}

	public void setRole(Set<String> roles) {
		this.role = roles;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

}
