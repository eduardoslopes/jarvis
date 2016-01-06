// CArtAgO artifact code for project jarvis

package jarvis;

import java.util.Random;

import cartago.*;

public class Relogio extends Artifact {
	
	private long contadorTempo;
	private boolean ligado;
	
	void init(int initialValue) {
		
	}
	
	@OPERATION
	void startRelogio() {
		ligado = true;
		execInternalOp("countRelogio");
	}
	
	@OPERATION
	void stopRelogio() {
		ligado = false;
	}
	
	@INTERNAL_OPERATION
	void countRelogio() {
		if(ligado) {
			Random tempo = new Random();
			contadorTempo = tempo.nextInt(5000) + 5000;
			System.out.println(contadorTempo);
			await_time(contadorTempo);
			signal("reuniao");
		}
	}
	
	@OPERATION
	void inc() {
		ObsProperty prop = getObsProperty("count");
		prop.updateValue(prop.intValue()+1);
		signal("tick");
	}
}