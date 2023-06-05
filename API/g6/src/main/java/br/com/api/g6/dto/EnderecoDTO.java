package br.com.api.g6.dto;

public class EnderecoDTO {

	private String cep;
	private String numero;
//	private Integer id;
//	private String logradouro;
//	private String bairro;
//	private String localidade;
//	private String uf;

	public EnderecoDTO() {
	}

	public EnderecoDTO(String cep, String numero) {
		super();
		this.cep = cep;
		this.numero = numero;
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

}
