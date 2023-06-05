package br.com.api.g6.domain;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.Lob;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotNull;

@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class, property = "pedId", scope = Pedido.class)
@Entity
@Table(name = "pedido")
public class Pedido {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ped_cd_id")
	private Integer pedId;

	@JsonFormat(pattern = "dd/MM/yyyy HH:mm:ss")
	@Column(name = "ped_dt_data")
	private LocalDateTime dtPed;

	@NotNull(message = "O usuário que está pedindo deve ser especificado")
	// @NotBlank(message = "O usuário que está pedindo deve ser especificado")
	@ManyToOne
	@JoinColumn(name = "fk_usu_cd_id")
	private Usuario usuario;

	@Lob
	@OneToMany(mappedBy = "pedido")
	private List<Produto> produto;

	public Pedido() {
		this.produto = new ArrayList<Produto>();
	}

	public Pedido(Integer pedId, LocalDateTime dtPed, Usuario usuario, List<Produto> produto) {
		this.pedId = pedId;
		this.dtPed = dtPed;
		this.usuario = usuario;
		this.produto = new ArrayList<Produto>();
	}

	public Integer getPedId() {
		return pedId;
	}

	public void setPedId(Integer pedId) {
		this.pedId = pedId;
	}

	public LocalDateTime getDtPed() {
		return dtPed;
	}

	public void setDtPed(LocalDateTime dtPed) {
		this.dtPed = dtPed;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public List<Produto> getProduto() {
		return produto;
	}

	public void setProduto(List<Produto> produto) {
		this.produto = produto;
	}

}
