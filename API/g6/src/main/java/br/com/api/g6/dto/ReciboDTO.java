package br.com.api.g6.dto;

import java.time.LocalDateTime;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;

import br.com.api.g6.domain.Usuario;

public class ReciboDTO {

	@JsonFormat(pattern = "dd/MM/yyyy HH:mm:ss")
	private LocalDateTime data;

	private Usuario usuario;

	private List<ProdutoReciboDTO> produtoReciboDTO;

	public ReciboDTO() {

	}

	public ReciboDTO(LocalDateTime data, Usuario usuario, List<ProdutoReciboDTO> produtoReciboDTO) {
		super();
		this.data = data;
		this.usuario = usuario;
		this.produtoReciboDTO = produtoReciboDTO;
	}

	public LocalDateTime getData() {
		return data;
	}

	public void setData(LocalDateTime data) {
		this.data = data;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public List<ProdutoReciboDTO> getProdutoReciboDTO() {
		return produtoReciboDTO;
	}

	public void setProdutoReciboDTO(List<ProdutoReciboDTO> produtoReciboDTO) {
		this.produtoReciboDTO = produtoReciboDTO;
	}

}
