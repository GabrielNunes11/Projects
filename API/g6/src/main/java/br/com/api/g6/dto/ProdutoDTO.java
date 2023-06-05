package br.com.api.g6.dto;

public class ProdutoDTO {

	private String nome;
	private Integer categoriaId;
	private Double preco;
	private Integer estoque;
	private String url;

	public ProdutoDTO() {
	}

	public ProdutoDTO(String nome, Integer categoriaId, Double preco, Integer estoque, String url) {
		super();
		this.nome = nome;
		this.categoriaId = categoriaId;
		this.preco = preco;
		this.estoque = estoque;
		this.url = url;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public Integer getCategoriaId() {
		return categoriaId;
	}

	public void setCategoriaId(Integer categoriaId) {
		this.categoriaId = categoriaId;
	}

	public Double getPreco() {
		return preco;
	}

	public void setPreco(Double preco) {
		this.preco = preco;
	}

	public Integer getEstoque() {
		return estoque;
	}

	public void setEstoque(Integer estoque) {
		this.estoque = estoque;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

}
