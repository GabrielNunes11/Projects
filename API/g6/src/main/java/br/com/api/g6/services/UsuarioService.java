package br.com.api.g6.services;

import java.io.IOException;
import java.net.URI;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import br.com.api.g6.domain.Endereco;
import br.com.api.g6.domain.Foto;
import br.com.api.g6.domain.Usuario;
import br.com.api.g6.dto.UsuarioDTO;
import br.com.api.g6.repositories.FotoRepository;
import br.com.api.g6.repositories.UsuarioRepository;
import br.com.api.g6.security.controllers.AuthController;
import br.com.api.g6.security.domain.Role;
import br.com.api.g6.security.domain.User;
import br.com.api.g6.security.enums.RoleEnum;
import br.com.api.g6.security.repositories.RoleRepository;
import br.com.api.g6.security.repositories.UserRepository;

@Service
public class UsuarioService {

	@Autowired
	UsuarioRepository usuarioRepository;

	@Autowired
	EnderecoService enderecoService;

	@Autowired
	UserRepository userRepository;

	@Autowired
	AuthController authController;

	@Autowired
	PasswordEncoder encoder;

	@Autowired
	RoleRepository roleRepository;

	@Autowired
	FotoRepository fotoRepository;

	@Autowired
	FotoService fotoService;

	public List<Usuario> listaUsuario() {
		return usuarioRepository.findAll();
	}

	public Usuario buscaUsuario(Integer id) {
		return usuarioRepository.findById(id).get();
	}

	public Usuario adicionaUsuario(UsuarioDTO usuarioDTO, MultipartFile foto) throws IOException {
		User userNovo = new User();
		Usuario usuario = new Usuario();
		usuario.setTipo(usuarioDTO.getTipo());
		usuario.setNome(usuarioDTO.getNome());
		userNovo.setUsername(userNovo.getUsername());
		userNovo.setPassword(userNovo.getPassword());
		usuario.setCpf(usuarioDTO.getCpf());
		usuario.setNasc(usuarioDTO.getNasc());
		userNovo.setEmail(userNovo.getEmail());
		Endereco endereco = enderecoService.enderecoPorCep(usuarioDTO.getCep());
		endereco.setNumero(usuarioDTO.getNumero());
		usuario.adicionarEndereco(endereco);
		// enderecoService.adicionaEndereco(enderecoService.enderecoPorCep(usuario.getCep()));
		User user = new User(usuarioDTO.getNome(), usuarioDTO.getEmail(), encoder.encode(usuarioDTO.getPassword()));

		Set<String> strRoles = usuarioDTO.getRole();
		Set<Role> roles = new HashSet<>();

		if (strRoles == null) {
			Role userRole = roleRepository.findByName(RoleEnum.ROLE_USER)
					.orElseThrow(() -> new RuntimeException("Erro: Role não encontrada."));
			roles.add(userRole);
		} else {
			strRoles.forEach(role -> {
				switch (role) {
				case "admin":
					Role adminRole = roleRepository.findByName(RoleEnum.ROLE_ADMIN)
							.orElseThrow(() -> new RuntimeException("Erro: Role não encontrada."));
					roles.add(adminRole);

					break;
				case "mod":
					Role modRole = roleRepository.findByName(RoleEnum.ROLE_MODERATOR)
							.orElseThrow(() -> new RuntimeException("Erro: Role não encontrada."));
					roles.add(modRole);

					break;
				default:
					Role userRole = roleRepository.findByName(RoleEnum.ROLE_USER)
							.orElseThrow(() -> new RuntimeException("Erro: Role não encontrada."));
					roles.add(userRole);
				}
			});
		}

		user.setRoles(roles);
		userRepository.save(user);
		usuario.setUser(user);
		usuarioRepository.save(usuario);
		fotoService.cadastrarFotoUsuario(usuario, foto);
		usuarioDTO.setUrl(adicionarImagemUri(usuario));

		return usuarioRepository.save(usuario);
	}

	private String adicionarImagemUri(Usuario usuario) {
		URI uri = ServletUriComponentsBuilder.fromCurrentContextPath().path("/usuario/{id}/foto")
				.buildAndExpand(usuario.getId()).toUri();
		UsuarioDTO usuarioDTO = new UsuarioDTO();
		usuarioDTO.setUrl(uri.toString());
		return usuarioDTO.getUrl();
	}

	public Usuario alteraUsuario(Integer id, UsuarioDTO usuario) {
		// User userNovo = userRepository.findById(id).get();
		Usuario usuarioNovo = usuarioRepository.findById(id).get();
		usuarioNovo.setTipo(usuario.getTipo());
		usuarioNovo.setNome(usuario.getNome());
		// userNovo.setUsername(userNovo.getUsername());
		// userNovo.setPassword(userNovo.getPassword());
		usuarioNovo.setCpf(usuario.getCpf());
		usuarioNovo.setNasc(usuario.getNasc());
		Endereco endereco = enderecoService.enderecoPorCep(usuario.getCep());
		endereco.setNumero(usuario.getNumero());
		usuarioNovo.adicionarEndereco(endereco);
		// userNovo.setEmail(userNovo.getEmail());

		usuarioRepository.save(usuarioNovo);
		return usuarioNovo;
	}

	public ResponseEntity<String> deletaUsuario(Integer id) {
		for (Foto foto : fotoService.listaFoto()) {
			if (foto.getUsuario() != null) {
				if (foto.getUsuario().getId() == id) {
					fotoRepository.deleteById(foto.getFotoId());
				}
			}
		}
		Usuario usuarioExcluido = usuarioRepository.findById(id).get();
		if (usuarioExcluido != null) {
			usuarioRepository.deleteById(id);
			return ResponseEntity.ok("Usuário excluído com sucesso!");
		} else {
			return ResponseEntity.notFound().build();
		}
	}
}
