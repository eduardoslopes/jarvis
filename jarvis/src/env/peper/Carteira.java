// CArtAgO artifact code for project jarvis

package peper;

import java.util.Random;

import cartago.*;

public class Carteira extends Artifact {
	private double valor = (new Random().nextDouble()%500.0)+50.0;
	
	void init(int initialValue) {
		
	}
	
	@OPERATION
	void dinheiro(OpFeedbackParam<Double> valor){	
		valor.set(this.valor);
	}
	
	@OPERATION
	void retirar_dinheiro(double valor){	
		this.valor-=valor;
	}
}

