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

import br.com.api.g6.domain.Pedido;
import br.com.api.g6.dto.PedidoDTO;
import br.com.api.g6.services.PedidoService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import jakarta.validation.Valid;

@Valid
@RestController
@RequestMapping("/pedido")
public class PedidoController {

	@Autowired
	PedidoService pedidoService;

	@GetMapping("/lista")
	@SecurityRequirement(name="Bearer Auth")
	@PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_ADMIN')")
	@Operation(summary = "Lista de Pedidos", description = "Método para listar pedidos")
	public List<Pedido> listaPedido() {
		return pedidoService.listaPedido();
	}

	@GetMapping("/{id}")
	@SecurityRequirement(name="Bearer Auth")
	@PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_ADMIN')")
	@Operation(summary = "Buscar Pedido", description = "Método para buscar um pedido individual de acordo com seu ID")
	public Pedido buscaPedido(@PathVariable Integer pedId) {
		return pedidoService.buscaPedido(pedId);
	}
	
	@PostMapping("/adicionar")
//	@SecurityRequirement(name="Bearer Auth")
//	@PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_ADMIN')")
	@Operation(summary = "Adicionar Pedido", description = "Método para listar Usuarios")
	public Pedido adicionaPedido(@RequestBody PedidoDTO PedidoDTO) {
		return pedidoService.adicionaPedido(PedidoDTO);
	}

	@PutMapping("/alterar/{id}")
	@SecurityRequirement(name="Bearer Auth")
	@PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_ADMIN')")
	@Operation(summary = "Alterar Pedido", description = "Método para alterar pedido")
	public Pedido alteraPedido(@PathVariable Integer id, @RequestBody PedidoDTO pedidoDTO) {
		return pedidoService.alteraPedido(id, pedidoDTO);
	}

	@DeleteMapping("/deletar/{id}")
	@SecurityRequirement(name="Bearer Auth")
	@PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_ADMIN')")
	@Operation(summary = "Deletar Pedido", description = "Método para deletar pedido")
	public ResponseEntity<String> deletaPedido(@PathVariable Integer id) {
		return pedidoService.deletaPedido(id);
	}

}
