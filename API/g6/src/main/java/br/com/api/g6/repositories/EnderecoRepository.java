package br.com.api.g6.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import br.com.api.g6.domain.Endereco;

@Repository("endereco")
public interface EnderecoRepository extends JpaRepository<Endereco, Integer>{

}
