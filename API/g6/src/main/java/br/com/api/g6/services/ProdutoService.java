package br.com.api.g6.services;

import java.io.IOException;
import java.net.URI;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import br.com.api.g6.domain.Foto;
import br.com.api.g6.domain.Produto;
import br.com.api.g6.dto.ProdutoDTO;
import br.com.api.g6.repositories.FotoRepository;
import br.com.api.g6.repositories.PedidoRepository;
import br.com.api.g6.repositories.ProdutoRepository;

@Service
public class ProdutoService {

	@Autowired
	ProdutoRepository produtoRepository;

	@Autowired
	CategoriaService categoriaService;
	
	@Autowired
	FotoService fotoService;
	
	@Autowired
	FotoRepository fotoRepository;
	
	@Autowired
	PedidoRepository pedidoRepository;

	public List<Produto> listaProduto() {
		return produtoRepository.listarProduto();
	}

	public Produto buscaProduto(Integer id) {
		return produtoRepository.findById(id).get();
	}

	public List<Produto> menorPreco(){
		return produtoRepository.menorPreco();
	}

	public Produto adicionaProduto(ProdutoDTO produtoDTO, MultipartFile foto) throws IOException {

		Produto produto = new Produto();
		produto.setNome(produtoDTO.getNome());
		produto.setCategoria(categoriaService.buscaCategoria(produtoDTO.getCategoriaId()));
		produto.setPreco(produtoDTO.getPreco());
		produto.setEstoque(produtoDTO.getEstoque());
		fotoService.cadastrarFotoProduto(produto, foto);
		produtoDTO.setUrl(adicionarImagemUri(produto));
		
		return produtoRepository.save(produto);
	}
	
	private String adicionarImagemUri(Produto produto) {
		URI uri = ServletUriComponentsBuilder.fromCurrentContextPath().path("/usuario/{id}/foto")
				.buildAndExpand(produto.getId()).toUri();
		ProdutoDTO produtoDTO = new ProdutoDTO();
		produtoDTO.setUrl(uri.toString());
		return produtoDTO.getUrl();
	}

	public Produto alteraProduto(Integer id, ProdutoDTO produtoDTO) {

		Produto produtoNovo = buscaProduto(id);

		produtoNovo.setNome(produtoDTO.getNome());
		;
		produtoNovo.setCategoria(categoriaService.buscaCategoria(produtoDTO.getCategoriaId()));

		return produtoRepository.save(produtoNovo);
	}

	@SuppressWarnings("unused")
	public ResponseEntity<String> deletaProduto(Integer id) {
		Produto produto = produtoRepository.findById(id).get();
		
		if(produto.getPedido() != null){
		pedidoRepository.deleteById(produto.getPedido().getPedId());
		}
		for (Foto foto : fotoService.listaFoto()) {
			if (foto.getProduto() != null) {
				if (foto.getProduto().getId() == id) {
					fotoRepository.deleteById(foto.getFotoId());
				}
			}
		}
		 
		if (produto != null) {
			produtoRepository.deleteById(id);
			return ResponseEntity.ok("Produto excluído com sucesso!");
		} else {
			return ResponseEntity.notFound().build();
		}

	}

}
