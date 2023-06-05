package br.com.api.g6.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import br.com.api.g6.domain.Produto;

@Repository("produto")
public interface ProdutoRepository extends JpaRepository<Produto, Integer> {
	
	@Query(value="SELECT * FROM produto", nativeQuery = true)
	List<Produto> listarProduto ();

	@Query(value="SELECT prod_tx_nome, fk_cat_cd_id, prod_nm_preco FROM produto ORDER BY prod_nm_preco ASC", nativeQuery = true)
	List<Produto> menorPreco();

}
