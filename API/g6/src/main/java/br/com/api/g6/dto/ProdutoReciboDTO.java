package br.com.api.g6.dto;

public class ProdutoReciboDTO {

	private String Nome;
	private String Categoria;

	public ProdutoReciboDTO() {
	}

	public ProdutoReciboDTO(String nome, String categoria) {
		super();
		Nome = nome;
		Categoria = categoria;
	}

	public String getNome() {
		return Nome;
	}

	public void setNome(String nome) {
		Nome = nome;
	}

	public String getCategoria() {
		return Categoria;
	}

	public void setCategoria(String categoria) {
		Categoria = categoria;
	}

}
