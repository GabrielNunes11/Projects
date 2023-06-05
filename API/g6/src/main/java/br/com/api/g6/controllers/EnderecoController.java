package br.com.api.g6.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.com.api.g6.domain.Endereco;
import br.com.api.g6.dto.EnderecoDTO;
import br.com.api.g6.services.EnderecoService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import jakarta.validation.Valid;

@Valid
@RestController
@RequestMapping("/endereco")
public class EnderecoController {

	@Autowired
	EnderecoService enderecoService;

	@GetMapping("/lista")
	@SecurityRequirement(name="Bearer Auth")
	@PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_ADMIN')")
	@Operation(summary = "Lista de Endereços", description = "Lista de endereços cadastrados no Banco de Dados")
	public List<Endereco> listaEndereco() {
		return enderecoService.listaEndereco();
	}

	@GetMapping("/{id}")
	@SecurityRequirement(name="Bearer Auth")
	@PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_ADMIN')")
	@Operation(summary = "Busca por Endereço", description = "Busca individual por endereço de acordo com seu ID")
	public Endereco buscaEndereco(@PathVariable Integer id) {
		return enderecoService.buscaEndereco(id);
	}

	@PostMapping("/adicionar")
	@SecurityRequirement(name="Bearer Auth")
	@PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_ADMIN')")
	@Operation(summary = "Adicionar Endereço", description = "Método utilizado junto ao usuárioService para adicionar Endereço")
	public Endereco adicionaEndereco(@RequestBody EnderecoDTO enderecoDTO) {
		return enderecoService.adicionaEndereco(enderecoDTO);
	}

	@PutMapping("/alterar/{id}")
	@SecurityRequirement(name="Bearer Auth")
	@PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_ADMIN')")
	@Operation(summary = "Alterar Endereço", description = "Método para alterar um Endereço cadastrado no banco")
	public Endereco alteraEndereco(@PathVariable Integer id, EnderecoDTO enderecoDTO) {
		return enderecoService.alteraEndereco(id, enderecoDTO);
	}

	@DeleteMapping("/deletar/{id}")
	@SecurityRequirement(name="Bearer Auth")
	@PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_ADMIN')")
	@Operation(summary = "Deletar Endereço", description = "Método para deletar um Endereço cadastrado no banco")
	public ResponseEntity<String> deletaEndereco(@PathVariable Integer id) {
		return enderecoService.deletaEndereco(id);
	}

}
