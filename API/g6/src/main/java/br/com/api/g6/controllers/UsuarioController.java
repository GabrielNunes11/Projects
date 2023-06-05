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
import br.com.api.g6.domain.Usuario;
import br.com.api.g6.dto.UsuarioDTO;
import br.com.api.g6.services.EmailService;
import br.com.api.g6.services.FotoService;
import br.com.api.g6.services.UsuarioService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import jakarta.mail.MessagingException;
import jakarta.transaction.Transactional;
import jakarta.validation.Valid;

@Valid
@RestController
@RequestMapping("/usuario")
public class UsuarioController {
	
	@Autowired
	UsuarioService usuarioService;
	
	@Autowired
	EmailService emailService;
	
	@Autowired
	FotoService fotoService;
	
	@Transactional
	@GetMapping("/lista")
	@SecurityRequirement(name="Bearer Auth")
	@PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_ADMIN')")
	@Operation(summary = "Lista Usuario", description = "Método para listar Usuarios")
	public List<Usuario> listaUsuario(){
		return usuarioService.listaUsuario();
	}
	
	@GetMapping("/{id}")
	@SecurityRequirement(name="Bearer Auth")
	@PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_ADMIN')")
	@Operation(summary = "Buscar Usuario", description = "Método para buscar Usuario por id")
	public Usuario buscaUsuario(@PathVariable Integer id){
		return usuarioService.buscaUsuario(id);
	}
	
	@PostMapping(value = "/adicionar", consumes = {MediaType.MULTIPART_FORM_DATA_VALUE})
	@SecurityRequirement(name="Bearer Auth")
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@Operation(summary = "Adicionar Usuario", description = "Método para adicionar Usuario ao banco")
	public Usuario adicionaUsuario(@RequestParam String email,@RequestPart UsuarioDTO usuarioDTO,@RequestPart MultipartFile foto) throws IOException, MessagingException{
		emailService.envioEmailCadastroUsuario(usuarioDTO);
		return usuarioService.adicionaUsuario(usuarioDTO, foto);
	}

	@PutMapping("/alterar/{id}")
	@SecurityRequirement(name="Bearer Auth")
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@Operation(summary = "Alterar Usuario", description = "Método para alterar Usuario")
	public Usuario alteraUsuario(@PathVariable Integer id, @RequestBody UsuarioDTO usuario){
		return usuarioService.alteraUsuario(id, usuario);
	}
	
	@DeleteMapping("/deletar/{id}")
	@SecurityRequirement(name="Bearer Auth")
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@Operation(summary = "Deleta Usuario", description = "Metodo para deletar Usuarios")
	public ResponseEntity<String> deletaUsuario(@PathVariable Integer id){
		return usuarioService.deletaUsuario(id);
	}
	
	@Transactional
	@GetMapping("/{id}/foto")
	@SecurityRequirement(name="Bearer Auth")
	@PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_ADMIN')")
	@Operation(summary = "Mostra Foto por id do Usuario", description = "Metodo para buscar foto de Usuarios")
    public ResponseEntity<byte[]> buscarFoto(@PathVariable Integer id){
        Foto foto = fotoService.buscarPorIdUsuarios(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-type", foto.getTipo());
        headers.add("Content-lenght", String.valueOf(foto.getDados().length));
        return new ResponseEntity<>(foto.getDados(), headers, HttpStatus.OK);
    }
}
