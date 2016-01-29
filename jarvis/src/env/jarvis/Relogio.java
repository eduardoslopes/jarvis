// CArtAgO artifact code for project jarvis

package jarvis;

import java.util.Calendar;
import java.util.GregorianCalendar;

import cartago.*;

public class Relogio extends Artifact {
	
	final static long TICK_HOUR = 3600000;
	final static long TICK_SEC = 1000;
	long contadorTempo;
	boolean ligado;
	
	void init(int initialValue) {
		
	}
	
	@OPERATION
	void startRelogio() {
		ligado = true;
		execInternalOp("hora");
		execInternalOp("segundos");
	}
	
	@OPERATION
	void stopRelogio() {
		ligado = false;
	}
	
	@OPERATION
	void protecaoNoturna() {
		Calendar hora = new GregorianCalendar();
		if(hora.get(Calendar.HOUR_OF_DAY) >= 18) {
			signal("dobrar_seguranca"); 
		} else if(hora.get(Calendar.HOUR_OF_DAY) >= 6) {
			signal("desativar_seguranca_noturna");
		}
	}
	
	@INTERNAL_OPERATION
	void hora() {
		while(ligado) {
			Calendar hora = new GregorianCalendar();
			if(hora.get(Calendar.HOUR_OF_DAY) == 19)
				signal("hora_jantar");
			else if(hora.get(Calendar.HOUR_OF_DAY) >= 8)
				signal("acordar");
			if(hora.get(Calendar.HOUR_OF_DAY) == 0)
				signal("dormir");
				signal("eh_outro_dia");
			await_time(TICK_HOUR);
		}
	}
	
	@INTERNAL_OPERATION
	void segundos() {
		while(ligado) {
			signal("tic");
			await_time(TICK_SEC);
		}
	}
	
	@OPERATION
	void inc() {
		ObsProperty prop = getObsProperty("count");
		prop.updateValue(prop.intValue()+1);
		signal("tick");
	}
}