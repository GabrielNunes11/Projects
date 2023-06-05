package br.com.api.g6.controllers;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import br.com.api.g6.domain.Foto;
import br.com.api.g6.domain.Produto;
import br.com.api.g6.dto.ProdutoDTO;
import br.com.api.g6.services.EmailService;
import br.com.api.g6.services.FotoService;
import br.com.api.g6.services.ProdutoService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import jakarta.mail.MessagingException;
import jakarta.transaction.Transactional;
import jakarta.validation.Valid;

@Valid
@RestController
@RequestMapping("/produto")
public class ProdutoController {

	@Autowired
	ProdutoService produtoService;

	@Autowired
	EmailService emailService;
	
	@Autowired
	FotoService fotoService;
	
	@Transactional
	@GetMapping("/lista")
	@SecurityRequirement(name="Bearer Auth")
	@PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_ADMIN')")
	@Operation(summary = "Lista de Produtos", description = "Lista de produtos cadastrados no Banco de Dados")
	public List<Produto> listaProduto() {
		return produtoService.listaProduto();
	}

	@GetMapping("/{id}")
	@SecurityRequirement(name="Bearer Auth")
	@PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_ADMIN')")
	@Operation(summary = "Busca de Produto", description = "Retorna um produto de acordo com seu ID")
	public Produto buscaProduto(@PathVariable Integer id) {
		return produtoService.buscaProduto(id);
	}

	@GetMapping("/menor")
	@SecurityRequirement(name="Bearer Auth")
	@PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_ADMIN')")
	@Operation(summary = "Busca de Produto por menor preço", description = "Retorna uma lista de produtos em ordem decrescente de valor")
	public List<Produto> menorPreco(){
		return produtoService.menorPreco();
	}

	@Transactional
	@GetMapping("/{id}/foto")
	@SecurityRequirement(name="Bearer Auth")
	@PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_ADMIN')")
	@Operation(summary = "Busca de Foto", description = "Busca por Foto cadastrada no sistema")
    public ResponseEntity<byte[]> buscarFoto(@PathVariable Integer id){
        Foto foto = fotoService.buscarPorIdProduto(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-type", foto.getTipo());
        headers.add("Content-lenght", String.valueOf(foto.getDados().length));
        return new ResponseEntity<>(foto.getDados(), headers, HttpStatus.OK);
    }

	@PostMapping(value = "/adicionar", consumes = {MediaType.MULTIPART_FORM_DATA_VALUE})
	@SecurityRequirement(name="Bearer Auth")
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@Operation(summary = "Adicionar Produto", description = "Método para cadastrar Produto no banco")
	public Produto adicionaProduto(@RequestParam String email,@RequestPart ProdutoDTO produtoDTO,@RequestPart MultipartFile foto) throws IOException, MessagingException {
		emailService.envioEmailCadastroProduto(produtoDTO);
		return produtoService.adicionaProduto(produtoDTO, foto);
	}

	@PutMapping("/alterar/{id}")
	@SecurityRequirement(name="Bearer Auth")
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@Operation(summary = "Alterar Produto", description = "Método para alterar um Produto no banco")
	public Produto alteraProduto(@PathVariable Integer id, @RequestBody ProdutoDTO produtoDTO) {
		return produtoService.alteraProduto(id, produtoDTO);
	}

	@DeleteMapping("/deletar/{id}")
	@SecurityRequirement(name="Bearer Auth")
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@Operation(summary = "Deletar Produto", description = "Método para deletar produtos no banco")
	public ResponseEntity<String> deletaProduto(@PathVariable Integer id) {
		return produtoService.deletaProduto(id);
	}

}