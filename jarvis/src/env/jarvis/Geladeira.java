// CArtAgO artifact code for project jarvis

package jarvis;

import java.util.Random;

import cartago.*;

public class Geladeira extends Artifact {
	void init(int initialValue) {
		defineObsProperty("count", initialValue);
	}

	@OPERATION
	void ingredientes_na_geladeira(OpFeedbackParam<Boolean> carne,
			OpFeedbackParam<Boolean> cebola, 
			OpFeedbackParam<Boolean> macarrao,
			OpFeedbackParam<Boolean> molho,
			OpFeedbackParam<Boolean> refrigerante){
		
		Random random = new Random();
		carne.set(random.nextBoolean());
		cebola.set(random.nextBoolean());
		macarrao.set(random.nextBoolean());
		molho.set(random.nextBoolean());
		refrigerante.set(random.nextBoolean());
		
	}

	@OPERATION
	void inc() {
		ObsProperty prop = getObsProperty("count");
		prop.updateValue(prop.intValue() + 1);
		signal("tick");
	}
}
