package br.com.api.g6.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import br.com.api.g6.domain.Categoria;
import br.com.api.g6.dto.CategoriaDTO;
import br.com.api.g6.repositories.CategoriaRepository;

@Service
public class CategoriaService {

	@Autowired
	CategoriaRepository categoriaRepository;

	public List<Categoria> listaCategoria() {
		return categoriaRepository.findAll();
	}

	public Categoria buscaCategoria(Integer id) {
		return categoriaRepository.findById(id).get();
	}

	public Categoria adicionaCategoria(CategoriaDTO categoriaDTO) {

		Categoria categoria = new Categoria();

		categoria.setNome(categoriaDTO.getNome());

		return categoriaRepository.save(categoria);
	}

	public Categoria alteraCategoria(Integer id, CategoriaDTO categoriaDTO) {

		Categoria categoriaNova = categoriaRepository.findById(id).get();

		categoriaNova.setNome(categoriaDTO.getNome());

		return categoriaRepository.save(categoriaNova);
	}

	public ResponseEntity<String> deletaCategoria(Integer id) {

		Categoria categoria = categoriaRepository.findById(id).get();

		if (categoria != null) {
			categoriaRepository.deleteById(id);
			return ResponseEntity.ok("Categoria excluído com sucesso!");
		} else {
			return ResponseEntity.notFound().build();
		}
	}
}
