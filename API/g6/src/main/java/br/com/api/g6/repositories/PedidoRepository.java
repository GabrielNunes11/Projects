package br.com.api.g6.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import br.com.api.g6.domain.Pedido;

@Repository("pedido")
public interface PedidoRepository extends JpaRepository<Pedido, Integer> {


	
}
