package br.com.api.g6.domain;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.validator.constraints.br.CPF;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import br.com.api.g6.enums.UsuarioEnum;
import br.com.api.g6.security.domain.User;
import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class, property = "id", scope = Usuario.class)
@Entity
@Table(name = "usuario")
public class Usuario {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "usu_cd_id")
	private Integer id;

	@NotNull(message = "O tipo de usuário não pode ser nulo.")
	// @NotBlank(message = "O campo de tipo não pode ser vazio, adicione CLIENTE ou
	// VENDEDOR")
	@Enumerated(EnumType.STRING)
	@Column(name = "usu_tx_tipo")
	private UsuarioEnum tipo;

	@NotNull(message = "O nome não pode ser nulo.")
	// @NotBlank(message = "O campo de nome não deve estar vazio.")
	@Column(name = "usu_tx_nome")
	private String nome;

	@NotNull(message = "O CPF não pode ser nulo.")
	// @NotBlank(message ="O campo de cpf não pode ser vazio")
	@CPF
	@Size(max = 14)
	@Column(name = "usu_tx_cpf")
	private String cpf;

	@Temporal(TemporalType.DATE)
	@JsonFormat(pattern = "yyyy-MM-dd")
	@NotNull(message = "A data de nascimento não pode ser nula.")
	// @NotBlank(message = "O campo de data de nascimento não pode estar vazio, deve
	// ser informado como aaaa/MM/dd")
	@Column(name = "usu_dt_nasc")
	private Date nasc;

	@ManyToMany(cascade = CascadeType.PERSIST, fetch = FetchType.LAZY)
	@JoinTable(name = "usuario_endereco", // Nomeia a tabela itermediaria
			joinColumns = @JoinColumn(name = "fk_usu_cd_id"), // Nomeia a coluna refente a id do classe atual
			inverseJoinColumns = @JoinColumn(name = "fk_end_cd_id")) // Nomeia a coluna da outra classe
	List<Endereco> endereco;

	@OneToOne
	@JoinColumn(name = "fk_id")
	private User user;

	public Usuario() {
		this.endereco = new ArrayList<Endereco>();
	}

	public Usuario(Integer id, String nome, UsuarioEnum tipo, String cpf, Date nasc, List<Endereco> endereco,
			User user) {
		this.id = id;
		this.nome = nome;
		this.tipo = tipo;
		this.cpf = cpf;
		this.nasc = nasc;
		this.endereco = endereco;
		this.endereco = new ArrayList<Endereco>();
		this.user = user;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public UsuarioEnum getTipo() {
		return tipo;
	}

	public void setTipo(UsuarioEnum tipo) {
		this.tipo = tipo;
	}

	public String getCpf() {
		return cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	public Date getNasc() {
		return nasc;
	}

	public void setNasc(Date nasc) {
		this.nasc = nasc;
	}

	public List<Endereco> getEndereco() {
		return endereco;
	}

	public void setEndereco(List<Endereco> endereco) {
		this.endereco = endereco;
	}

	public void adicionarEndereco(Endereco endereco) {
		this.endereco.add(endereco);
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}
