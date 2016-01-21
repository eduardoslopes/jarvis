// CArtAgO artifact code for project jarvis

package jarvis;

import cartago.*;

public class Fogao extends Artifact {
	void init(int initialValue) {
		defineObsProperty("count", initialValue);
	}
	
	@OPERATION
	void colocar_no_fogo() {
		await_time(5000);
		signal("comida_pronta");
	}
	
	@OPERATION
	void inc() {
		ObsProperty prop = getObsProperty("count");
		prop.updateValue(prop.intValue()+1);
		signal("tick");
	}
}

