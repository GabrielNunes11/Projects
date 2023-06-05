package br.com.api.g6.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import br.com.api.g6.domain.Categoria;

@Repository("categoria")
public interface CategoriaRepository extends JpaRepository<Categoria, Integer> {

}
