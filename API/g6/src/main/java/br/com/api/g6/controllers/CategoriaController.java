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

import br.com.api.g6.domain.Categoria;
import br.com.api.g6.dto.CategoriaDTO;
import br.com.api.g6.services.CategoriaService;
import br.com.api.g6.services.EmailService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import jakarta.validation.Valid;

@Valid
@RestController
@RequestMapping("/categoria")
public class CategoriaController {

	@Autowired
	CategoriaService categoriaService;

	@Autowired
	EmailService emailService;

	@GetMapping("/lista")
	@SecurityRequirement(name="Bearer Auth")
	@PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_ADMIN')")
	@Operation(summary = "Lista de Categira", description = "Método para listar as categorias existentes no banco")
	public List<Categoria> listaCategoria() {
		return categoriaService.listaCategoria();
	}

	@GetMapping("/{id}")
	@SecurityRequirement(name="Bearer Auth")
	@PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_ADMIN')")
	@Operation(summary = "Busca Categoria", description = "Método para buscar Categoria por id")
	public Categoria buscaCategoria(@PathVariable Integer id) {
		return categoriaService.buscaCategoria(id);
	}

	@PostMapping("/adicionar")
	@SecurityRequirement(name="Bearer Auth")
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@Operation(summary = "Adicionar Categoria", description = "Método para adicionar Categoria no banco")
	public Categoria adicionaCategoria(@RequestBody CategoriaDTO categoriaDTO) {
		return categoriaService.adicionaCategoria(categoriaDTO);
	}

	@PutMapping("/alterar/{id}")
	@SecurityRequirement(name="Bearer Auth")
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@Operation(summary = "Altera Categoria", description = "Método para alterar categoria")
	public Categoria alteraCategoria(@PathVariable Integer id, @RequestBody CategoriaDTO categoriaDTO) {
		return categoriaService.alteraCategoria(id, categoriaDTO);
	}

	@DeleteMapping("/deletar/{id}")
	@SecurityRequirement(name="Bearer Auth")
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@Operation(summary = "Deleta Produto", description = "Método para deletar categoria do banco")
	public ResponseEntity<String> deletaCategoria(@PathVariable Integer id) {
		return categoriaService.deletaCategoria(id);
	}

}
