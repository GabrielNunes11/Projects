package br.com.api.g6.services;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import br.com.api.g6.domain.Foto;
import br.com.api.g6.domain.Produto;
import br.com.api.g6.domain.Usuario;
import br.com.api.g6.repositories.FotoRepository;

@Service
public class FotoService {
	
	@Autowired
	FotoRepository fotoRepository;
	
	public List<Foto> listaFoto(){
		return fotoRepository.findAll();
	}
	
	public Foto cadastrarFotoUsuario (Usuario usuario, MultipartFile foto) throws IOException {
		Foto fotoUsuario = new Foto();
		fotoUsuario.setDados(foto.getBytes());
		fotoUsuario.setNome(foto.getOriginalFilename());
		fotoUsuario.setTipo(foto.getContentType());
		fotoUsuario.setUsuario(usuario);
		return fotoRepository.save(fotoUsuario);
	}
	
	public Foto buscarPorIdUsuarios(Integer id) {
		Usuario usuario = new Usuario();
		usuario.setId(id);
		Optional<Foto>foto = fotoRepository.findByUsuario(usuario);
		if(!foto.isPresent()) {
			return null;
		}
		return foto.get();
	}
	
	public Foto cadastrarFotoProduto (Produto produto, MultipartFile foto) throws IOException {
		Foto fotoProduto = new Foto();
		fotoProduto.setDados(foto.getBytes());
		fotoProduto.setNome(foto.getOriginalFilename());
		fotoProduto.setTipo(foto.getContentType());
		fotoProduto.setProduto(produto);
		return fotoRepository.save(fotoProduto);
	}
	
	public Foto buscarPorIdProduto(Integer id) {
		Produto produto = new Produto();
		produto.setId(id);
		Optional<Foto>foto = fotoRepository.findByProduto(produto);
		if(!foto.isPresent()) {
			return null;
		}
		return foto.get();
	}

}
