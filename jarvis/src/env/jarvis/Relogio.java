// CArtAgO artifact code for project jarvis

package jarvis;

import java.util.Calendar;
import java.util.GregorianCalendar;

import cartago.*;

public class Relogio extends Artifact {
	
	final static long TICK_TIME = 1000;
	long contadorTempo;
	boolean ligado;
	
	void init(int initialValue) {
		
	}
	
	@OPERATION
	void startRelogio() {
		ligado = true;		
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
	
	@OPERATION
	void ehOutroDia(OpFeedbackParam<Boolean> outroDia) {
		Calendar hora = new GregorianCalendar();
		if(hora.get(Calendar.HOUR_OF_DAY) >= 19) 
			outroDia.set(true); 
	}
	
	@INTERNAL_OPERATION
	void segundos() {
		while(ligado) {
			Calendar hora = new GregorianCalendar();
			if(hora.get(Calendar.HOUR_OF_DAY) == 19){
				signal("hora_jantar");
			}
			signal("tic");
			await_time(TICK_TIME);
		}
	}
	
	@OPERATION
	void inc() {
		ObsProperty prop = getObsProperty("count");
		prop.updateValue(prop.intValue()+1);
		signal("tick");
	}
}