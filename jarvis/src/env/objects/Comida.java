package objects;

public class Comida {
	private String nome;
	private Double preco;

	public Comida(String nome, Double preco) {
		this.nome = nome;
		this.preco = preco;
	}

	public String getNome() {
		return nome;
	}

	public Double getPreco() {
		return preco;
	}
	
	
}
