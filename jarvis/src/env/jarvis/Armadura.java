// CArtAgO artifact code for project jarvis

package jarvis;

import cartago.*;

public class Armadura extends Artifact {
	
	boolean posicaoNoturna = false;
	
	void init(int initialValue) {
		defineObsProperty("count", initialValue);
	}
	
	@OPERATION
	void setPosicaoNoturna(boolean posicao) {
		posicaoNoturna = posicao;
		if(posicaoNoturna) System.out.println("ok");
	}
	
	@OPERATION
	void inc() {
		ObsProperty prop = getObsProperty("count");
		prop.updateValue(prop.intValue()+1);
		signal("tick");
	}
}

