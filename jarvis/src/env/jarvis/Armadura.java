// CArtAgO artifact code for project jarvis

package jarvis;

import java.util.List;

import cartago.*;

public class Armadura extends Artifact {
	private boolean hibernando = true;
	private static List<String> posicoesDefesa;
	
	void init() {
		
	}
	
	@OPERATION
	void inc() {
		ObsProperty prop = getObsProperty("count");
		prop.updateValue(prop.intValue()+1);
		signal("tick");
	}
}

