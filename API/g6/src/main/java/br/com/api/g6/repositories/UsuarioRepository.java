package br.com.api.g6.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import br.com.api.g6.domain.Usuario;

@Repository("usuario")
public interface UsuarioRepository extends JpaRepository<Usuario, Integer>{

	@Query(value="SELECT * FROM usuario", nativeQuery = true)
	List<Usuario> listarUsuario (); 
}
