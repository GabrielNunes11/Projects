package br.com.api.g6.services;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import br.com.api.g6.domain.Endereco;
import br.com.api.g6.dto.EnderecoDTO;
import br.com.api.g6.repositories.EnderecoRepository;

@Service
public class EnderecoService {

	@Autowired
	EnderecoRepository enderecoRepository;

	public List<Endereco> listaEndereco() {
		return enderecoRepository.findAll();
	}

	public Endereco buscaEndereco(Integer id) {
		return enderecoRepository.findById(id).get();
	}

	public Endereco adicionaEndereco(EnderecoDTO enderecoDTO) {

		Endereco endereco = enderecoPorCep(enderecoDTO.getCep());

		endereco.setNumero(enderecoDTO.getNumero());

		return enderecoRepository.save(endereco);
	}

	public Endereco alteraEndereco(Integer id, EnderecoDTO enderecoDTO) {

		Endereco endereco = enderecoPorCep(enderecoDTO.getCep());
		Endereco enderecoNovo = enderecoRepository.findById(id).get();

		enderecoNovo.setCep(endereco.getCep());
		enderecoNovo.setLogradouro(endereco.getLogradouro());
		enderecoNovo.setNumero(enderecoDTO.getNumero());
		enderecoNovo.setBairro(endereco.getBairro());
		enderecoNovo.setLocalidade(endereco.getLocalidade());
		enderecoNovo.setUf(endereco.getUf());

		enderecoRepository.saveAndFlush(enderecoNovo);

		return enderecoNovo;
	}

	public ResponseEntity<String> deletaEndereco(Integer id) {

		Endereco endereco = enderecoRepository.findById(id).get();

		if (endereco != null) {
			enderecoRepository.deleteById(id);
			return ResponseEntity.ok("Endereço excluído com sucesso!");
		} else {
			return ResponseEntity.notFound().build();
		}
	}

	public Endereco enderecoPorCep(String cep) {

		String uri = "https://viacep.com.br/ws/{cep}/json";
		RestTemplate restTemplate = new RestTemplate();
		Map<String, String> params = new HashMap<>();
		Endereco enderecoRetorno = new Endereco();

		params.put("cep", cep);
		Endereco enderecoAPI = restTemplate.getForObject(uri, Endereco.class, params);

		enderecoRetorno.setCep(cep);
		enderecoRetorno.setLogradouro(enderecoAPI.getLogradouro());
		enderecoRetorno.setBairro(enderecoAPI.getBairro());
		enderecoRetorno.setLocalidade(enderecoAPI.getLocalidade());
		enderecoRetorno.setUf(enderecoAPI.getUf());

		return enderecoRetorno;
	}

}
