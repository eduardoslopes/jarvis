package objects;

import cartago.*;

public class ArCondicionado extends Artifact {

	private int status = 0;
	private Double temperatura;

	void init(int status) {
		this.status = status;
	}

	@OPERATION
	public void definirTemperatura(double temperatura, OpFeedbackParam<String> temp) {

		if (status == 1) {
			this.temperatura = temperatura;
			temp.set(this.temperatura.toString());
		} else {
			System.out.println("Erro, artefato n�o inicializado!");
		}
	}

	@OPERATION
	private double rand(double Str, double End) {

		return (double) Math.ceil(Math.random() * (End - Str + 1)) - 1 + Str;
	}

	@OPERATION
	public void modificarTemperatura(int valor1, int valor2, OpFeedbackParam<Double> temperaturaValor) {

		if (status == 1) {

			temperatura = rand(valor1, valor2);
			temperaturaValor.set(temperatura);
		} else {

			System.out.println("Erro, artefato n�o inicializado!");

		}
	}
}
