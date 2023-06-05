package br.com.api.g6.services;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import br.com.api.g6.domain.Pedido;
import br.com.api.g6.domain.Produto;
import br.com.api.g6.dto.PedidoDTO;
import br.com.api.g6.dto.ProdutoReciboDTO;
import br.com.api.g6.repositories.PedidoRepository;
import br.com.api.g6.repositories.ProdutoRepository;

@Service
public class PedidoService {

	@Autowired
	PedidoRepository pedidoRepository;

	@Autowired
	ProdutoRepository produtoRepository;
	
	@Autowired
	ProdutoService produtoService;

	@Autowired
	UsuarioService usuarioService;

	public List<Pedido> listaPedido() {
		return pedidoRepository.findAll();
	}

	public Pedido buscaPedido(Integer id) {
		return pedidoRepository.findById(id).get();
	}

	public Pedido adicionaPedido(PedidoDTO pedidoDTO) {

		Pedido pedido = new Pedido();
		
		pedido.setDtPed(LocalDateTime.now());
		pedido.setUsuario(usuarioService.buscaUsuario(pedidoDTO.getUsuarioId()));
		for (Integer produto : pedidoDTO.getProdutoId()) {
			pedido.getProduto().add(produtoService.buscaProduto(produto));
			produtoService.buscaProduto(produto).setPedido(pedido);
		}
		
		return pedidoRepository.save(pedido);
	}

	public Pedido alteraPedido(Integer id, PedidoDTO pedidoDTO) {

		Pedido pedido = buscaPedido(id);

		pedido.setUsuario(usuarioService.buscaUsuario(pedidoDTO.getUsuarioId()));
		for (Integer produto : pedidoDTO.getProdutoId()) {
			pedido.getProduto().add(produtoService.buscaProduto(produto));
		}

		return pedidoRepository.save(pedido);
	}

	public ResponseEntity<String> deletaPedido(Integer id) {

		Pedido pedido = pedidoRepository.findById(id).get();
		
		if (pedido != null) {
			for (Produto produto : pedido.getProduto()) {
				if(produto.getPedido().getPedId() == id) {
					produtoRepository.deleteById(produto.getPedido().getPedId());
				}
			}
			pedidoRepository.deleteById(id);
			return ResponseEntity.ok("Produto excluído com sucesso!");
		} else {
			return ResponseEntity.notFound().build();
		}
	}

	public ProdutoReciboDTO produtoToReciboDTO (Produto produto) {
		
		ProdutoReciboDTO produtoDTO = new ProdutoReciboDTO();
		
		produtoDTO.setNome(produto.getNome());
		produtoDTO.setCategoria(produto.getCategoria().getNome());
		
		return produtoDTO;
	}

}
