// CArtAgO artifact code for project jarvis

package jarvis;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import cartago.*;

public class ArsenalArmaduras extends Artifact {
	
	private List<String> arsenal;
	
	void init() {
		defineObsProperty("count");
		this.arsenal = new ArrayList<String>();
	}
	
	@OPERATION
	void inserirNoArsenal(String nomeArmadura){
		arsenal.add(nomeArmadura);
	}
	
	@OPERATION
	void percaNoArsenal(String nomeArmadura){
		arsenal.remove(nomeArmadura);
		signal("armadura_destruida");
	}
	
	@OPERATION
	void selecionaArmaduras(int coord){
		Random r = new Random();
		ArrayList<String> arm = new ArrayList<String>();
		int qntArmaduras = r.nextInt(arsenal.size());
		for(int i = 0; i<qntArmaduras; i++){
			String a = arsenal.get(r.nextInt(arsenal.size()));
			signal("invoca", a, coord);
		}
	}
	
	@OPERATION
	void inc() {
		ObsProperty prop = getObsProperty("count");
		prop.updateValue(prop.intValue()+1);
		signal("tick");
	}
	
	
}

