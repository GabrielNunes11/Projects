package br.com.api.g6.dto;

public class CategoriaDTO {
	private String nome;

	public CategoriaDTO() {
	}

	public CategoriaDTO(String nome) {
		this.nome = nome;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

}
