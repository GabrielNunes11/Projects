package br.com.api.g6.dto;

import java.util.List;

public class PedidoDTO {

	private List<Integer> produtoId;

	private Integer usuarioId;

	public PedidoDTO() {
	}

	public PedidoDTO(List<Integer> produtoId, Integer usuarioId) {
		super();
		this.produtoId = produtoId;
		this.usuarioId = usuarioId;
	}

	public List<Integer> getProdutoId() {
		return produtoId;
	}

	public void setProdutoId(List<Integer> produtoId) {
		this.produtoId = produtoId;
	}

	public Integer getUsuarioId() {
		return usuarioId;
	}

	public void setUsuarioId(Integer usuarioId) {
		this.usuarioId = usuarioId;
	}

}
