// CArtAgO artifact code for project jarvis

package jarvis;

import cartago.*;
import objects.Mapa;

public class GPS extends Artifact {
	Mapa mapa;
	void init() {
		mapa = new Mapa();
	}
	
	@OPERATION
	void busca_coordenada_local(String local, OpFeedbackParam<Integer> coordenadas){
		int coordenada = mapa.getCoordenada(local);
		coordenadas.set(coordenada);
	}
	
	@OPERATION
	void inc() {
		ObsProperty prop = getObsProperty("count");
		prop.updateValue(prop.intValue()+1);
		signal("tick");
	}
}

