// CArtAgO artifact code for project jarvis

package jarvis;

import java.util.Calendar;
import java.util.GregorianCalendar;
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
		execInternalOp("protecaoNoturna");
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
			await_time(contadorTempo);
			signal("reuniao");
		}
	}
	
	@INTERNAL_OPERATION
	void protecaoNoturna() {
		Calendar hora = new GregorianCalendar();
		if(hora.get(Calendar.HOUR_OF_DAY) >= 18) {
			signal("dobrar_seguranca"); 
		}
	}
	
	@OPERATION
	void inc() {
		ObsProperty prop = getObsProperty("count");
		prop.updateValue(prop.intValue()+1);
		signal("tick");
	}
}