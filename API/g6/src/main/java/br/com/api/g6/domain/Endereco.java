package br.com.api.g6.domain;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;

@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class, property = "id", scope = Endereco.class)
@Entity
@Table(name = "endereco")
public class Endereco {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "end_cd_id")
	private Integer id;

	@NotNull(message = "O CEP não pode estar vazio.")
	// @NotBlank (message = "O CEP não pode estar branco.")
	@Pattern(regexp = "[0-9]{5}-[0-9]{3}", message = "O CEP deve estar no formato 99999-999.")
	@Column(name = "end_tx_cep")
	private String cep;

	@Column(name = "end_tx_logradouro")
	private String logradouro;

	@Max(value = 10000, message = "Numero da residencia não pode exceder 10 caracteres")
	@NotNull(message = "O numero da residencia não pode estar vazio")
	// @NotBlank(message = "O campo de número não pode estar vazio. Caso não tenha,
	// por S/N")
	@Column(name = "end_tx_numero")
	private String numero;

	@Column(name = "end_tx_bairro")
	private String bairro;

	@Column(name = "end_tx_localidade")
	private String localidade;

	@Column(name = "end_tx_uf")
	private String uf;

	public Endereco() {
	}

	public Endereco(Integer id, String cep, String logradouro, String numero, String bairro, String localidade,
			String uf) {
		super();
		this.id = id;
		this.cep = cep;
		this.logradouro = logradouro;
		this.numero = numero;
		this.bairro = bairro;
		this.localidade = localidade;
		this.uf = uf;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCep() {
		return cep;
	}

	public void setCep(String cep) {
		this.cep = cep;
	}

	public String getLogradouro() {
		return logradouro;
	}

	public void setLogradouro(String logradouro) {
		this.logradouro = logradouro;
	}

	public String getNumero() {
		return numero;
	}

	public void setNumero(String numero) {
		this.numero = numero;
	}

	public String getBairro() {
		return bairro;
	}

	public void setBairro(String bairro) {
		this.bairro = bairro;
	}

	public String getLocalidade() {
		return localidade;
	}

	public void setLocalidade(String localidade) {
		this.localidade = localidade;
	}

	public String getUf() {
		return uf;
	}

	public void setUf(String uf) {
		this.uf = uf;
	}

}
