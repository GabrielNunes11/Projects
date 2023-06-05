package br.com.api.g6.repositories;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import br.com.api.g6.domain.Foto;
import br.com.api.g6.domain.Produto;
import br.com.api.g6.domain.Usuario;

@Repository
public interface FotoRepository extends JpaRepository<Foto, Integer>{
	
	Optional<Foto>findByUsuario(Usuario usuario);
	
	Optional<Foto>findByProduto(Produto produto);

}
