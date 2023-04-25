package pessoas;

public class Cliente extends Pessoa {

	public Cliente(String nome, String cPF, String senha, String tipoPessoa, String tipoConta) {
		super(nome, cPF, senha, tipoPessoa, tipoConta);
	
	}

	@Override
	public String toString() {
		return "Cliente" + (tipoPessoa != null ? ",\nTipo Usuário: =" + tipoPessoa + ", " : "") + "\nCPF=" + CPF
				+ "\nsenha=" + senha + (nome != null ? "\nnome=" + nome + ", " : "");
	}
	
}