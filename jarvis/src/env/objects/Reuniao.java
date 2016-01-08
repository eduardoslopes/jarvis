package objects;

public class Reuniao {

	private Integer horario;
	private String pessoa;
	
	public Reuniao(Integer horario, String pessoa) {
		this.horario = horario;
		this.pessoa = pessoa;
	}

	public Integer getHorario() {
		return horario;
	}

	public String getPessoa() {
		return pessoa;
	}
}
