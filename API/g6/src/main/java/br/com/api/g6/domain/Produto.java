package br.com.api.g6.domain;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class, property = "id", scope = Produto.class)
@Entity
@Table(name = "produto")
public class Produto {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "prod_cd_id")
	private Integer id;

	@NotNull(message = "O campo de nome não deve estar vazio.")
	// @NotBlank(message="O campo de nome não deve estar vazio.")
	@Size(min = 3, max = 20)
	@Column(name = "prod_tx_nome")
	private String nome;

	@NotNull(message = "Defina uma valor para o produto")
	// @NotBlank(message="Defina uma valor para o produto")
	@Column(name = "prod_nm_preco")
	private Double preco;

	@NotNull(message = "Informe a quantidade de produtos em estoque")
	// @NotBlank(message="Informe a quantidade de produtos em estoque")
	@Column(name = "prod_nm_estq")
	private Integer estoque;

	@ManyToOne
	@JoinColumn(name = "fk_cat_cd_id")
	private Categoria categoria;

	@OneToOne
	@JoinColumn(name = "fk_ped_cd_id")
	private Pedido pedido;

//	@Lob
//	@OneToMany(mappedBy = "produto")
//	private List<Foto> foto;

	public Produto() {
	}

	public Produto(Integer id, String nome, Double preco, Integer estoque, Categoria categoria,
			Pedido pedido/* , List<Foto> foto */) {
		super();
		this.id = id;
		this.nome = nome;
		this.categoria = categoria;
		this.pedido = pedido;
		// this.foto = foto;
		this.preco = preco;
		this.estoque = estoque;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
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

	public Categoria getCategoria() {
		return categoria;
	}

	public void setCategoria(Categoria categoria) {
		this.categoria = categoria;
	}

	public Pedido getPedido() {
		return pedido;
	}

	public void setPedido(Pedido pedido) {
		this.pedido = pedido;
	}

//	public List<Foto> getFoto() {
//		return foto;
//	}

//	public void setFoto(List<Foto> foto) {
//		this.foto = foto;
//	}

}